<div class="row row-deck row-cards">
    <div class="col-md-6 col-lg-4">
        <div class="card card-md">
            <div class="card-stamp card-stamp-lg">
                <div class="card-stamp-icon bg-primary">
                    <i class="fas fa-info icon"></i>
                </div>
            </div>
            <div class="card-header">
                <div class="card-title">Dashboard</div>
            </div>
            <div class="card-body">
                {$dashboard_text}
            </div>
        </div>
    </div>
    <div class="col-md-12 col-lg-8">
        {literal}<style>.accordion-button::after{transform: rotate(-90deg);}</style>{/literal}
        {include file='page_servers.tpl'}
    </div>
    <div class="col-md-6 col-lg-4">
        <div class="card">
            <div class="card-stamp card-stamp-lg">
                <div class="card-stamp-icon bg-primary">
                    <i class="fas fa-ban icon"></i>
                </div>
            </div>
            <div class="card-body">
                <div class="card-title d-flex justify-content-between">
                    <span>Latest Added Bans</span>
                    <span>Total bans: {$total_bans}</span>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th width="16">MOD</th>
                            <th width="24%" align="center"><strong>Date/Time</strong></th>
                            <th><strong>Name</strong></th>
                            <th width="14%"><strong>Length</strong></th>
                        </tr>
                    </thead>
                    {foreach from=$players_banned item=player}
                        <tr class="cursor-pointer" onclick="{$player.link_url}">
                            <td><img class="icon" src="/images/games/{$player.icon}" alt="MOD" title="MOD" /></td>
                            <td>{$player.created}</td>
                            <td>
                                {if empty($player.short_name)}
                                    <span class="text-muted">no nickname present</span>
                                {else}
                                    {$player.short_name|escape:'html'}
                                {/if}
                            </td>
                            <td class="listtable_1{if $player.unbanned}_unbanned{elseif $player.perm}_permanent{elseif $player.temp}_banned{/if}">{$player.length}{if $player.unbanned} ({$player.ub_reason}){/if}</td>
                        </tr>
                    {/foreach}
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-lg-4">
        <div class="card">
            <div class="card-stamp card-stamp-lg">
                <div class="card-stamp-icon bg-primary">
                    <i class="fas fa-circle-minus icon"></i>
                </div>
            </div>
            <div class="card-body">
                <div class="card-title d-flex justify-content-between">
                    <span>Latest Players Blocked</span>
                    <span>Total Stopped: {$total_blocked}</span>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th width="16px" height="16">&nbsp;</th>
                            <th height="25%" class="listtable_top dashboard-ban-block-date"><b>Date/Time</b></th>
                            <th height="16"><b>Name</b></th>
                        </tr>
                    </thead>
                    {foreach from=$players_blocked item=player}
                        <tr{if $dashboard_lognopopup} onclick="{$player.link_url}"{else} onclick="{$player.popup}"{/if} class="cursor-pointer" id="{$player.server}" title="Querying Server Data...">
                            <td><i class="fas fa-ban icon"></i></td>
                            <td>{$player.date}</td>
                            <td>
                                {if empty($player.short_name)}
                                    <span class="text-muted">no nickname present</span>
                                {else}
                                    <span>{$player.short_name|escape:'html'}</span>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-lg-4">
        <div class="card">
            <div class="card-stamp card-stamp-lg">
                <div class="card-stamp-icon bg-primary">
                    <i class="fas fa-comment-slash icon"></i>
                </div>
            </div>
            <div class="card-body">
                <div class="card-title d-flex justify-content-between">
                    <span>Latest Comm Blocks</span>
                    <span>Total blocks: {$total_comms}</span>
                </div>
                <table class="table">
                    <thead class="bg-transparent">
                        <tr>
                            <th width="16">Type</th>
                            <th width="24%" align="center"><strong>Date/Time</strong></th>
                            <th><strong>Name</strong></th>
                            <th width="23%"><strong>Length</strong></th>
                        </tr>
                    </thead>
                    {foreach from=$players_commed item=player}
                        <tr onclick="{$player.link_url}" class="cursor-pointer">
                            <td><i class="{$player.type}"></i></td>
                            <td>{$player.created}</td>
                            <td>
                                {if empty($player.short_name)}
                                    <span class="text-muted">no nickname present</span>
                                {else}
                                    {$player.short_name|escape:'html'}
                                {/if}
                            </td>
                            <td class="listtable_1{if $player.unbanned}_unbanned{elseif $player.perm}_permanent{elseif $player.temp}_banned{/if}">{$player.length}{if $player.unbanned} ({$player.ub_reason}){/if}</td>
                        </tr>
                    {/foreach}
                </table>
            </div>
        </div>
    </div>
</div>
