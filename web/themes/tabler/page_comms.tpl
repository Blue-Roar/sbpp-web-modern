{if $comment}
    <h3>{$commenttype} Comment</h3>
    <table width="90%" align="center" border="0" style="border-collapse:collapse;" id="group.details" cellpadding="3">
        <tr>
            <td valign="top"><div class="rowdesc"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Type the text you would like to say."><i class="fas fa-circle-question icon"></i></span> Comment</div></td>
        </tr>
        <tr>
            <td><div>
                    <textarea rows="10" cols="60" class="submit-fields" style="width:500px;" id="commenttext" name="commenttext" {if !$canedit}disabled{/if}>{$commenttext}</textarea>
                </div>
                <div id="commenttext.msg" class="badentry"></div></td>
        </tr>
        <tr>
            <td>
                <input type="hidden" name="bid" id="bid" value="{$comment}">
                <input type="hidden" name="ctype" id="ctype" value="{$ctype}">
                {if $cid != ""}
                    <input type="hidden" name="cid" id="cid" value="{$cid}">
                {else}
                    <input type="hidden" name="cid" id="cid" value="-1">
                {/if}
                <input type="hidden" name="page" id="page" value="{$page}">
                {if $canedit}
                    {sb_button text="$commenttype Comment" onclick="ProcessComment();" class="ok" id="acom" submit=false}&nbsp;
                    {sb_button text="Back" onclick="history.go(-1)" class="cancel" id="aback"}
                {/if}
            </td>
        </tr>
        {foreach from=$othercomments item="com"}
            <tr>
                <td colspan='3'>
                    <hr>
                </td>
            </tr>
            <tr>
                <td>
                    <b>{$com.comname}</b></td><td align=\"right\"><b>{$com.added}</b>
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
    <h3>Communications Blocklist Overview - <i>Total Blocks: {$total_bans}</i></h3>
    {load_template file='admin.comms.search'}
    <div class="mt-3" id="banlist">
        <div class="card">
            <div class="card-stamp card-stamp-lg">
                <div class="card-stamp-icon bg-primary">
                    <i class="fas fa-comment-slash icon"></i>
                </div>
            </div>
            <div class="card-header">
                <h3 class="card-title">Block List</h3>
                <div class="ms-auto" id="banlist-nav"><a href="/commslist?hideinactive={if $hidetext == 'Hide'}true{else}false{/if}{$searchlink|smarty_htmlspecialchars}" title="{$hidetext} inactive">{$hidetext} inactive</a> | <i>Total Blocks: {$total_bans}</i></div>
            </div>
            <div class="card-body p-0 table-responsive">
                <table class="table table-banlist">
                    <thead>
                        <tr>
                            <th class="w-11">MOD/Type</th>
                            <th class="w-8">Date</th>
                            <th class="w-auto">Player</th>
                            <th class="w-9"></th>
                            {if !$hideadminname}
                                <th class="w-11">Admin</th>
                            {/if}
                            <th class="w-11">Length</th>
                        </tr>
                    </thead>
                    {foreach from=$ban_list item=ban name=banlist}
                        <tr class="align-middle cursor-pointer" data-bs-toggle="collapse" data-bs-target="#collapse-{$smarty.foreach.banlist.index}" aria-expanded="false" {if $ban.server_id != 0} onclick="xajax_ServerHostPlayers({$ban.server_id}, 'id', 'host_{$ban.ban_id}');"{/if}>
                            <td>
                                <img class="icon icon-md w-auto mx-1" src="{$ban.mod_icon_url}">
                                <i class="icon icon-md w-auto mx-1 {$ban.type_icon_class}"></i>
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
                            {if $view_comments && $ban.commentdata != "None" && $ban.commentdata|@count > 0}
                                {$ban.commentdata|@count}&thinsp;<i class="fas fa-clipboard-list fa-lg"></i>
                            {/if}
                            {if $view_bans}
                                {$ban.counts}
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
                                                            <th class="w-25">Block Details</th>
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
                                                                {else}
                                                                    {$ban.player|escape:'html'|smarty_stripslashes}
                                                                {/if}
                                                            </td>
                                                            <td class="border-bottom-0" rowspan="{if isset($ban.unbanned)}13{else}11{/if}">
                                                                <!-- ###############[ Start Admin Controls ]################## -->
                                                                {if $view_bans}
                                                                    <div class="card ban-edit">
                                                                        <div class="card-header">
                                                                            <h3 class="card-title">Actions</h3>
                                                                        </div>
                                                                        <div class="list-group list-group-flush">
                                                                            {if isset($ban.unbanned) && $ban.reban_link != false}
                                                                                <a class="list-group-item list-group-item-action" href="{$ban.reban_link_href}"><i class="fas fa-redo icon"></i> Reban</a>
                                                                            {/if}
                                                                            <a class="list-group-item list-group-item-action" href="{$ban.addcomment_href}"><i class="fas fa-comment-dots icon"></i> Add Comment</a>
                                                                            {if ($ban.view_edit && (!isset($ban.unbanned) || !$ban.unbanned))}
                                                                                <a class="list-group-item list-group-item-action" href="{$ban.edit_link_href}"><i class="fas fa-edit icon"></i> Edit Details</a>
                                                                            {/if}
                                                                            {if isset($ban.unbanned) && ($ban.unbanned == false && $ban.view_unban)}
                                                                                <button class="list-group-item list-group-item-action" onclick="{$ban.unban_link_onclick}"><i class="fas fa-undo icon"></i> Unban</button>
                                                                            {/if}
                                                                            {if $ban.view_delete}
                                                                                <button class="list-group-item list-group-item-action" onclick="{$ban.delete_link_onclick}"><i class="fas fa-trash icon"></i> Delete Ban</button>
                                                                            {/if}
                                                                        </div>
                                                                    </div>
                                                                {/if}
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
                                                                    SteamID3: <code class="user-select-all"><a href="http://steamcommunity.com/profiles/{$ban.steamid3}" target="_blank">{$ban.steamid3}</a></code><br>
                                                                    SteamID64: <code class="user-select-all"><a href="http://steamcommunity.com/profiles/{$ban.communityid}" target="_blank">{$ban.communityid}</a></code>
                                                                {/if}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Invoked on</td>
                                                            <td>{$ban.ban_date}</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Block length</td>
                                                            <td>{$ban.banlength}</td>
                                                        </tr>
                                                        {if isset($ban.unbanned) && ($ban.unbanned == true)}
                                                            <tr>
                                                                <td>Unblock reason</td>
                                                                <td>
                                                                    {if !isset($ban.ureason) || $ban.ureason == ""}
                                                                        <span class="text-muted">no reason present</span>
                                                                    {else}
                                                                        {$ban.ureason}
                                                                    {/if}
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Unblocked by Admin</td>
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
                                                                <td>Blocked by Admin</td>
                                                                <td>
                                                                    {if !empty($ban.admin)}
                                                                        {$ban.admin|escape:'html'}
                                                                    {else}
                                                                        <span class="text-muted">(Deleted Admin)</span>
                                                                    {/if}
                                                                </td>
                                                            </tr>
                                                        {/if}
                                                        <tr>
                                                            <td>Blocked from</td>
                                                            <td {if $ban.server_id != 0}id="host_{$ban.ban_id}"{/if}>
                                                                {if $ban.server_id == 0}
                                                                    Web Ban
                                                                {else}
                                                                    Please Wait...
                                                                {/if}
                                                            </td>
                                                        </tr>
                                                        <tr{if !$view_comments} class="border-bottom-0"{/if}>
                                                            <td>Total Blocks</td>
                                                            <td>{$ban.prevoff_link}</td>
                                                        </tr>
                                                        {if $view_comments}
                                                        <tr class="border-bottom-0">
                                                            <td>Comments</td>
                                                            <td height="60" class="listtable_1" colspan="2">
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
                </table>
            </div>
            <div class="card-footer">
                <div id="banlist-nav">{$ban_nav}</div>
            </div>
        </div>
        <div class="text-muted small float-end">SourceComms plugin &#038;	integration to SourceBans made by <a href="https://github.com/ppalex7" target="_blank">Alex</a></div>
    </div>
{/if}
