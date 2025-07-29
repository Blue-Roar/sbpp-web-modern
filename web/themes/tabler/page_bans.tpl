{if $comment}
    <div class="card">
        <div class="card-stamp card-stamp-lg">
            <div class="card-stamp-icon bg-primary"><i class="fas fa-ban icon"></i></div>
        </div>
        <div class="card-header">
            <h3 class="card-title">{$commenttype} Comment</h3>
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label class="form-label required"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Type the text you would like to say."><i class="fas fa-circle-question icon"></i></span>Comment</label>
                <textarea id="commenttext" name="commenttext" {if !$canedit}disabled{/if} class="form-control" placeholder="Type something…">{$commenttext}</textarea>
            </div>
            <div id="commenttext.msg" class="badentry"></div>
            <input type="hidden" name="bid" id="bid" value="{$comment}">
            <input type="hidden" name="ctype" id="ctype" value="{$ctype}">
            {if $cid != ""}
                <input type="hidden" name="cid" id="cid" value="{$cid}">
            {else}
                <input type="hidden" name="cid" id="cid" value="-1">
            {/if}
            <input type="hidden" name="page" id="page" value="{$page}">
        </div>
        <div class="card-footer">
            {if $canedit}
                <button type="button" onclick="ProcessComment();" name="acom" class="btn" id="acom">{$commenttype} Comment</button>
                <button type="button" onclick="history.go(-1)" name="aback" class="btn cancel" id="aback">Back</button>
            {/if}
        </div>
    </div>
    <h3></h3>
    <table width="90%" border="0" style="border-collapse:collapse;" id="group.details" cellpadding="3">
        {foreach from=$othercomments item="com"}
            <tr>
                <td>
                    <b>{$com.comname}</b></td><td align="right"><b>{$com.added}</b>
                </td>
            </tr>
            <tr>
                <td colspan='2'>
                    {$com.commenttxt}
                </td>
            </tr>
            {if $com.editname != ''}
                <tr>
                    <td colspan='3'>
                        <span style='font-size:6pt;color:grey;'>last edit {$com.edittime} by {$com.editname}</span>
                    </td>
                </tr>
            {/if}
        {/foreach}
    </table>
{else}
    <h3>Banlist Overview - <i>Total Bans: {$total_bans}</i></h3>
    {load_template file='admin.bans.search'}
    <div class="mt-3" id="banlist">
        <div class="card">
            <div class="card-stamp card-stamp-lg">
                <div class="card-stamp-icon bg-primary">
                    <i class="fas fa-ban icon"></i>
                </div>
            </div>
            <div class="card-header">
                <h3 class="card-title">Ban List</h3>
                <div class="ms-auto" id="banlist-nav"><a href="/banlist?hideinactive={if $hidetext == 'Hide'}true{else}false{/if}{$searchlink|smarty_htmlspecialchars}" title="{$hidetext} inactive">{$hidetext} inactive</a> | <i>Total Bans: {$total_bans}</i></div>
            </div>
            <div class="card-body p-0 table-responsive">
                <table class="table table-banlist{if $view_bans} table-selectable{/if}">
                    <thead>
                        <tr class="align-middle">
                            {if $view_bans}
                                <th class="w-1"><input class="form-check-input m-0 align-middle" type="checkbox" title="Select All" name="tickswitch" id="tickswitch" onclick="TickSelectAll()" value="0"></th>
                            {/if}
                            <th class="w-11">MOD/Country</th>
                            <th class="w-8">Date</th>
                            <th class="w-auto">Player</th>
                            <th class="w-9"></th>
                            {if !$hideadminname}
                                <th class="w-11">Admin</th>
                            {/if}
                            <th class="w-11">Length</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach from=$ban_list item=ban name=banlist}
                        <tr class="align-middle cursor-pointer" data-bs-toggle="collapse" data-bs-target="#collapse-{$smarty.foreach.banlist.index}" aria-expanded="false" {if $ban.server_id != 0} onclick="xajax_ServerHostPlayers({$ban.server_id}, 'id', 'host_{$ban.ban_id}');"{/if}>
                        {if $view_bans}
                            <td><input class="form-check-input m-0 align-middle table-selectable-check" type="checkbox" name="chkb_{$smarty.foreach.banlist.index}" id="chkb_{$smarty.foreach.banlist.index}" value="{$ban.ban_id}"></td>
                        {/if}
                            <td>
                                <img class="icon icon-md w-auto mx-1" src="{$ban.mod_icon_url}">
                                <img class="icon icon-md w-auto mx-1" src="{$ban.country_flag_url}">
                            </td>
                            <td>{$ban.ban_date}</td>
                            <td class="text-truncate">
                            {if empty($ban.player)}
                                <span class="text-muted">no nickname present</span>
                            {else}
                                {$ban.player|escape:'html'|smarty_stripslashes}
                            {/if}
                            </td>
                            <td class="text-end">
                            {if $ban.demo_available}
                                <div>
                                    <i class="fas fa-video fa-lg"></i>
                                </div>
                            {/if}
                            {if $view_comments && $ban.commentdata != "None" && $ban.commentdata|@count > 0}
                                <div>
                                    {$ban.commentdata|@count} <i class="fas fa-clipboard-list fa-lg"></i>
                                </div>
                            {/if}
                            </td>
                            {if !$hideadminname}
                                <td>
                                    {if !empty($ban.admin)}
                                        {$ban.admin|escape:'html'}
                                    {else}
                                        <span class="text-muted">Admin deleted</span>
                                    {/if}
                                </td>
                            {/if}
                            <td width="20%" class="{$ban.class}">{$ban.banlength}</td>
                        </tr>
                        <!-- ###############[ Start Sliding Panel ]################## -->
                        <tr>
                            <td class="p-0 border-top-0" colspan="7">
                                <!--<div class="opener">-->
                                <div id="collapse-{$smarty.foreach.banlist.index}" class="accordion-collapse collapse" data-bs-parent="#accordion-{$smarty.foreach.banlist.index}">
                                    <div class="accordion-body">
                                        <div class="card rounded-0 border-0">
                                            <!--<div class="card-header">
                                                <h3 class="card-title">Admin Details of {$admin.user}</h3>
                                            </div>-->
                                            <div class="card-body p-0">
                                                <table class="table table-details">
                                                    <thead>
                                                        <tr class="border-1 border-x-0">
                                                            <th class="w-25">Ban Details</th>
                                                            <th class="w-auto"></th>
                                                            <th class="w-33"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Player</td>
                                                            <td>
                                                                {if empty($ban.player)}
                                                                    <span class="text-muted">no nickname present</span>
                                                                    <span class="text-muted">No Steam3 ID present</span>
                                                                        <span class="text-muted">No Steam Community ID present</span>
                                                                {else}
                                                                    {$ban.player|escape:'html'|smarty_stripslashes}
                                                                {/if}
                                                            </td>
                                                            <td class="border-bottom-0" rowspan="{if $ban.unbanned}15{else}13{/if}">
                                                                <!-- ###############[ Start Admin Controls ]################## -->
                                                                <div class="card ban-edit">
                                                                    <div class="card-header">
                                                                        <h3 class="card-title">Actions</h3>
                                                                    </div>
                                                                    <div class="list-group list-group-flush">
                                                                        {if $demo_available}
                                                                            <a class="list-group-item list-group-item-action" href="{$ban.demo_link_href}"><i class="fas fa-video icon"></i> Review Demo</a>
                                                                        {else}
                                                                            <button class="list-group-item list-group-item-action" disabled><i class="fas fa-video-slash icon"></i> No Demos</button>
                                                                        {/if}
                                                                        {if $view_bans}
                                                                            {if $ban.unbanned && $ban.reban_link != false}
                                                                                <a class="list-group-item list-group-item-action" href="{$ban.reban_link_href}"><i class="fas fa-redo icon"></i> Reban</a>
                                                                            {/if}
                                                                            <a class="list-group-item list-group-item-action" href="{$ban.blockcomm_link_href}"><i class="fas fa-ban icon"></i> Block Comms</a>
                                                                            <a class="list-group-item list-group-item-action" href="{$ban.addcomment_href}"><i class="fas fa-comment-dots icon"></i> Add Comment</a>
                                                                            {if $ban.type == 0}
                                                                                {if $groupban}
                                                                                    <a class="list-group-item list-group-item-action" href="{$ban.groups_link_href}"><i class="fas fa-users icon"></i> Show Groups</a>
                                                                                {/if}
                                                                                {if $friendsban}
                                                                                    <button class="list-group-item list-group-item-action" onclick="{$ban.friend_ban_link_onclick}"><i class="fas fa-trash icon"></i> Ban Friends</button>
                                                                                {/if}
                                                                            {/if}
                                                                            {if ($ban.view_edit && !$ban.unbanned)}
                                                                                <a class="list-group-item list-group-item-action" href="{$ban.edit_link_href}"><i class="fas fa-edit icon"></i> Edit Details</a>
                                                                            {/if}
                                                                            {if ($ban.unbanned == false && $ban.view_unban)}
                                                                                <button class="list-group-item list-group-item-action" onclick="{$ban.unban_link_onclick}"><i class="fas fa-undo icon"></i> Unban</button>
                                                                            {/if}
                                                                            {if $ban.view_delete}
                                                                                <button class="list-group-item list-group-item-action" onclick="{$ban.delete_link_onclick}"><i class="fas fa-trash icon"></i> Delete Ban</button>
                                                                            {/if}
                                                                        {/if}
                                                                    </div>
                                                                </div>
                                                                <!-- ###############[ End Admin Controls ]##################### -->
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Steam ID</td>
                                                            <td>
                                                                {if empty($ban.steamid)}
                                                                    <span class="text-muted">No Steam ID present</span>
                                                                {else}
                                                                    SteamID: <code class="user-select-all">{$ban.steamid}</code><br>
                                                                    SteamID3: <code class="user-select-all"><a href="http://steamcommunity.com/profiles/{$ban.steamid3}" target="_blank">{$ban.steamid3}</a></code>
                                                                    {if $ban.type == 0}
                                                                    <br>Community ID: <code class="user-select-all"><a href="http://steamcommunity.com/profiles/{$ban.communityid}" target="_blank">{$ban.communityid}</a></code>
                                                                    {/if}
                                                                {/if}
                                                            </td>
                                                        </tr>
                                                        {if !$hideplayerips}
                                                            <tr>
                                                                <td>IP address</td>
                                                                <td>
                                                                    {if $ban.ip == "none"}
                                                                        <span class="text-muted">no IP address present</span>
                                                                    {else}
                                                                        <img class="icon w-auto me-1" src="{$ban.country_flag_url}">{$ban.ban_ip}
                                                                    {/if}
                                                                </td>
                                                            </tr>
                                                        {/if}
                                                        <tr>
                                                            <td>Invoked on</td>
                                                            <td>{$ban.ban_date}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Banlength</td>
                                                            <td>{$ban.banlength}</td>
                                                        </tr>
                                                        {if $ban.unbanned}
                                                        <tr>
                                                            <td>Unban reason</td>
                                                            <td>
                                                                {if $ban.ureason == ""}
                                                                    <span class="text-muted">no reason present</span>
                                                                {else}
                                                                    {$ban.ureason}
                                                                {/if}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Unbanned by Admin</td>
                                                            <td>
                                                                {if !empty($ban.removedby)}
                                                                    {$ban.removedby|escape:'html'}
                                                                {else}
                                                                    <span class="text-muted">(Deleted Admin)</span>
                                                                {/if}
                                                            </td>
                                                        </tr>
                                                        {/if}
                                                        <tr>
                                                            <td>Expires on</td>
                                                            <td>
                                                                {if $ban.expires == "never"}
                                                                    <span class="text-muted">Not applicable.</span>
                                                                {else}
                                                                    {$ban.expires}
                                                                {/if}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Reason</td>
                                                            <td>{$ban.reason|escape:'html'}</td>
                                                        </tr>
                                                        {if !$hideadminname}
                                                        <tr>
                                                            <td>Banned by Admin</td>
                                                            <td>{if !empty($ban.admin)}{$ban.admin|escape:'html'}{else}<span class="text-muted">(Deleted Admin)</span>{/if}</td>
                                                        </tr>
                                                        {/if}
                                                        <tr>
                                                            <td>Banned from</td>
                                                            <td{if $ban.server_id != 0} id="host_{$ban.ban_id}"{/if}>{if $ban.server_id == 0}Web Ban{else}Please Wait...{/if}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Total Bans</td>
                                                            <td>{$ban.prevoff_link}</td>
                                                        </tr>
                                                        <tr{if !$view_comments} class="border-bottom-0"{/if}>
                                                            <td>Blocked ({$ban.blockcount})</td>
                                                            <td>
                                                                {if $ban.banlog == ""}
                                                                    <i><span class="text-muted">(Never)</span></i>
                                                                {else}
                                                                    {$ban.banlog}
                                                                {/if}
                                                            </td>
                                                        </tr>
                                                        {if $view_comments}
                                                            <tr class="border-bottom-0">
                                                                <td>Comments</td>
                                                                <td height="60" colspan="2">
                                                                    {if $ban.commentdata != "None"}
                                                                        <table width="100%" border="0">
                                                                            {foreach from=$ban.commentdata item=commenta}
                                                                                {if $commenta.morecom}
                                                                                    <tr>
                                                                                        <td colspan='3'>
                                                                                            <hr>
                                                                                        </td>
                                                                                    </tr>
                                                                                {/if}
                                                                                <tr>
                                                                                    <td>
                                                                                        {if !empty($commenta.comname)}
                                                                                            <b>{$commenta.comname|escape:'html'}</b>
                                                                                        {else}
                                                                                            <span class="text-muted">Admin deleted</span>
                                                                                        {/if}
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <b>{$commenta.added}</b>
                                                                                    </td>
                                                                                    {if $commenta.editcomlink != ""}
                                                                                        <td align="right">
                                                                                            {$commenta.editcomlink} {$commenta.delcomlink}
                                                                                        </td>
                                                                                    {/if}
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan='3'>
                                                                                        {$commenta.commenttxt}
                                                                                    </td>
                                                                                </tr>
                                                                                {if !empty($commenta.edittime)}
                                                                                    <tr>
                                                                                        <td colspan='3'>
                                                                                            <span style="font-size:6pt;color:grey;">last edit {$commenta.edittime} by {if !empty($commenta.editname)}{$commenta.editname}{else}<span class="text-muted">Admin deleted</span>{/if}</span>
                                                                                        </td>
                                                                                    </tr>
                                                                                {/if}
                                                                            {/foreach}
                                                                        </table>
                                                                    {/if}
                                                                    {if $ban.commentdata == "None"}
                                                                        {$ban.commentdata}
                                                                    {/if}
                                                                </td>
                                                            </tr>
                                                        {/if}
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <!-- ###############[ End Sliding Panel ]################## -->
                    {/foreach}
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                <div id="banlist-nav">{$ban_nav}</div>
            </div>
        </div>
        {if $general_unban || $can_delete}
        <div class="input-group my-2" style="max-width: 25rem;">
            <button type="button" class="btn w-10 input-group-text" onclick="TickSelectAll();return false;" name="tickswitchlink" id="tickswitchlink">Select All</button>
            <select class="form-select" name="bulk_action" id="bulk_action" onchange="BulkEdit(this,'{$admin_postkey}');">
                <option value="-1">Bulk Action</option>
                {if $general_unban}
                    <option value="U">Unban</option>
                {/if}
                {if $can_delete}
                    <option value="D">Delete</option>
                {/if}
            </select>
        </div>
        <hr>
        {/if}
        {if $can_export }
            <a href="/exportbans.php?type=steam" title="Export Permanent SteamID Bans">Export Permanent SteamID Bans</a>&nbsp;&nbsp;|&nbsp;
            <a href="/exportbans.php?type=ip" title="Export Permanent IP Bans">Export Permanent IP Bans</a>
        {/if}
    </div>
{/if}
