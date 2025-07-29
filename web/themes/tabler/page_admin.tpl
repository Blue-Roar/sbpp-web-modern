<div class="card mb-3">
    <div class="card-header">
        <h3 class="card-title">Please select an option to administer</h3>
    </div>
    <div class="card-body">
        <nav class="nav nav-segmented nav-lg w-100" role="tablist">
            {if $access_admins}
                <a href="/admin?c=admins" class="nav-link">
                    <i class="icon nav-link-icon fas fa-user-tie"></i>
                    Admin <br> Settings
                </a>
            {/if}
            {if $access_servers}
                <a href="/admin?c=servers" class="nav-link">
                    <i class="icon nav-link-icon fas fa-server"></i>
                    Server <br> Settings
                </a>
            {/if}
            {if $access_bans}
                <a href="/admin?c=bans" class="nav-link">
                    <i class="icon nav-link-icon fas fa-ban"></i>
                    Manage <br> Bans
                </a>
            {/if}
            {if $access_bans}
                <a href="/admin?c=comms" class="nav-link">
                    <i class="icon nav-link-icon fas fa-comment-slash"></i>
                    Manage <br> Comms
                </a>
            {/if}
            {if $access_groups}
                <a href="/admin?c=groups" class="nav-link">
                    <i class="icon nav-link-icon fas fa-users"></i>
                    Group <br> Settings
                </a>
            {/if}
            {if $access_settings}
                <a href="/admin?c=settings" class="nav-link">
                    <i class="icon nav-link-icon fas fa-gears"></i>
                    Webpanel <br> Settings
                </a>
            {/if}
            {if $access_mods}
                <a href="/admin?c=mods" class="nav-link">
                    <i class="icon nav-link-icon fas fa-cubes"></i>
                    Manage <br> Mods
                </a>
            {/if}
        </nav>
    </div>
</div>
<div class="card mb-3">
    <div class="card-body">
        <div class="datagrid">
            <div class="datagrid-item">
                <div class="datagrid-title">Version Information</div>
                <div class="datagrid-content">
                    <div>Latest release: <strong id='relver'>Please Wait...</strong></div>
                    {if $dev}
                    <div>Latest Git: <strong id='svnrev'>Please Wait...</strong></div>
                    {/if}
                    <div id='versionmsg'>Please Wait...</div>
                </div>
            </div>
            <div class="datagrid-item">
                <div class="datagrid-title">Admin Information</div>
                <div class="datagrid-content">
                    Total admins: <strong>{$total_admins}</strong>
                </div>
            </div>
            <div class="datagrid-item">
                <div class="datagrid-title">Ban Information</div>
                <div class="datagrid-content">
                    <div>Total bans: <strong>{$total_bans}</strong></div>
                    <div>Total comms: <strong>{$total_comms}</strong></div>
                    <div>Connections Blocked: <strong>{$total_blocks}</strong></div>
                </div>
            </div>
            <div class="datagrid-item">
                <div class="datagrid-title">Server Information</div>
                <div class="datagrid-content">
                    <div>Total Servers: <strong>{$total_servers}</strong></div>
                    <div>Total demo size: <strong>{$demosize}</strong></div>
                </div>
            </div>
            <div class="datagrid-item">
                <div class="datagrid-title">Protest Information</div>
                <div class="datagrid-content">
                    <div>Pending Protests: <strong>{$total_protests}</strong></div>
                    <div>Archived Protests: <strong>{$archived_protests}</strong></div>
                </div>
            </div>
            <div class="datagrid-item">
                <div class="datagrid-title">Submission Information</div>
                <div class="datagrid-content">
                    <div>Pending Submissions: <strong>{$total_submissions}</strong></div>
                    <div>Archived Submissions: <strong>{$archived_submissions}</strong></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">xajax_CheckVersion();</script>
