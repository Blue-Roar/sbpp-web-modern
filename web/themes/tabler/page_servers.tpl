{if $IN_SERVERS_PAGE && $access_bans}

Hint: Right click on a player to open a context menu with options to kick, ban or contact the player directly.
{/if}

<div class="card">
    <div class="card-stamp card-stamp-lg">
        <div class="card-stamp-icon bg-primary">
            <i class="fas fa-server icon"></i>
        </div>
    </div>
    <div class="card-body" id="front-servers">
        <div class="accordion bg-body mt-2" id="accordion-servers">
        {foreach from=$server_list item=server}
            <div class="accordion-item">
                <div class="accordion-header">
                    <button class="accordion-button collapsed" type="button" {if $IN_SERVERS_PAGE}data-bs-toggle="collapse" data-bs-target="#collapse-{$server.sid}" aria-expanded="false"{else}onclick="{$server.evOnClick}"{/if}>
                        <div class="d-flex align-items-center flex-nowrap text-truncate flex-grow-1">
                            <img class="lh-1 me-2" style="height:28px;" src="/images/games/{$server.icon}">
                            <span id="host_{$server.sid}">Querying Server Data...</span>
                            <span class="lh-1 ms-auto" id="vac_{$server.sid}"></span>
                            <span class="lh-1 ms-1" id="os_{$server.sid}"></span>
                        </div>
                        <div class="text-truncate w-10" id="map_{$server.sid}">N/A</div>
                        <div class="w-7 pe-3" id="players_{$server.sid}">N/A</div>
                        <div class="accordion-button-toggle"><i class="fas fa-chevron-{if $IN_SERVERS_PAGE}down{else}right{/if} icon"></i></div>
                    </button>
                </div>
            </div>
            {if $IN_SERVERS_PAGE}
            <div id="collapse-{$server.sid}" class="accordion-collapse collapse" data-bs-parent="#accordion-servers">
                <div class="accordion-body p-0">
                    <div class="card rounded-0 border-top-0">
                        <div class="card-body">
                            <div id="serverwindow_{$server.sid}">
                                <div class="row" id="sinfo_{$server.sid}">
                                    <div class="col">
                                        <table class="table" id="playerlist_{$server.sid}" name="playerlist_{$server.sid}"></table>
                                    </div>
                                    <div class="col-auto">
                                        <img class="rounded" id="mapimg_{$server.sid}" width="340" src="/images/maps/nomap.jpg">
                                    </div>
                                </div>
                                <div id="noplayer_{$server.sid}" name="noplayer_{$server.sid}" style="display:none;"><br />
                                    <h2 style="color: #333;">No players in the server</h2><br />
                                    <div align='center'>
                                        <p style="font-size: 13px;">{$server.ip}:{$server.port}</p>
                                        <button type='button' onclick="document.location = 'steam://connect/{$server.dns}:{$server.port}'" name='button' class='btn game' style='margin:0;' id='button'>Join game</button>
                                        <button type='button' onclick="ShowReloadingBox({$server.sid});" name='button' class='btn refresh' style='margin:0;' id='button'>Refresh</button><br /><br />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer d-flex align-items-center flex-wrap">
                            <div class="text-muted">{$server.ip}:{$server.port}</div>
                            <button class="btn ms-auto" onclick="ShowReloadingBox({$server.sid});">Refresh</button>
                            <a class="btn btn-primary ms-1 d-none d-md-block" href="steam://connect/{$server.dns}:{$server.port}" target="_blank" rel="noopener">Join game</a>
                        </div>
                    </div>
                </div>
            </div>
            {/if}
        {/foreach}
        </div>
    </div>
</div>
<script>
function ShowReloadingBox(sid) {
    MsgBox('Reloading...', '<b>Refreshing the Serverdata...</b><br><i>Please Wait!</i>', 'wait', false);
    xajax_RefreshServer(sid);
}
</script>
