<div id="admin-page-content">
    <div class="tabcontent" id="List admins">
        {if not $permission_listadmin}
            Access Denied
        {else}
            {load_template file="admin.admins.search"}

            <div class="mt-3" id="banlist">
                <div class="card">
                    <div class="card-stamp card-stamp-lg">
                        <div class="card-stamp-icon bg-primary">
                            <i class="fas fa-user-tie icon"></i>
                        </div>
                    </div>
                    <div class="card-header">
                        <h3 class="card-title">Admin List (<span id="admincount">{$admin_count}</span>)</h3>
                        <div class="ms-auto">Click on an admin to see more detailed information and actions to perform on them.</div>
                    </div>
                    <div class="card-body p-0 table-responsive">
                        <table class="table table-banlist">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Server Admin Group</th>
                                    <th>Web Admin Group</th>
                                </tr>
                            </thead>
                            <tbody>
                            {foreach from=$admins item="admin"}
                                <tr class="align-middle cursor-pointer collapsed" data-bs-toggle="collapse" data-bs-target="#collapse-{$admin.aid}" aria-expanded="false">
                                    <td>{$admin.user}</td>
                                    <td>{$admin.server_group}</td>
                                    <td>{$admin.web_group}</td>
                                </tr>
                                <tr>
                                    <td class="p-0 border-top-0" colspan="3">
                                        <div id="collapse-{$admin.aid}" class="accordion-collapse collapse" data-bs-parent="#accordion-{$admin.aid}">
                                            <div class="accordion-body">
                                                <div class="card rounded-0 border-0">
                                                    <!--<div class="card-header">
                                                        <h3 class="card-title">Admin Details of {$admin.user}</h3>
                                                    </div>-->
                                                    <div class="card-body p-0">
                                                        <table class="table">
                                                            <thead>
                                                                <tr class="border-1 border-x-0">
                                                                    <th class="w-33">Server Admin Permissions</th>
                                                                    <th class="w-33">Web Admin Permissions</th>
                                                                    <th class="w-33"></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr class="border-bottom-0">
                                                                    <td>
                                                                        {if $admin.server_flag_string}
                                                                        <ul>
                                                                        {foreach from=$admin.server_flag_string item=permission}
                                                                            <li>{$permission}</li>
                                                                        {/foreach}
                                                                        </ul>
                                                                        {else}
                                                                            <i>None</i>
                                                                        {/if}
                                                                    </td>
                                                                    <td>
                                                                        {if $admin.web_flag_string}
                                                                        <ul>
                                                                        {foreach from=$admin.web_flag_string item=permission}
                                                                            <li>{$permission}</li>
                                                                        {/foreach}
                                                                        </ul>
                                                                        {else}
                                                                            <i>None</i>
                                                                        {/if}
                                                                    </td>
                                                                    <td>
                                                                        <div class="datagrid mb-3">
                                                                            <div class="datagrid-item">
                                                                                <div class="datagrid-title">Immunity Level</div>
                                                                                <div class="datagrid-content">{$admin.immunity}</div>
                                                                            </div>
                                                                            <div class="datagrid-item">
                                                                                <div class="datagrid-title">Last Visited</div>
                                                                                <div class="datagrid-content">{$admin.lastvisit}</div>
                                                                            </div>
                                                                            <div class="datagrid-item">
                                                                                <div class="datagrid-title">Bans</div>
                                                                                <div class="datagrid-content">
                                                                                    <div class="btn-group w-100">
                                                                                        <a class="btn justify-content-between{if (!$admin.bancount)} disabled{/if}" href="/banlist?advSearch={$admin.aid}&advType=admin" title="Show bans"><i class="fas fa-ban icon"></i>{$admin.bancount}</a>
                                                                                        <a class="btn justify-content-between{if (!$admin.nodemocount)} disabled{/if}" href="/banlist?advSearch={$admin.aid}&advType=nodemo" title="Show bans without demo"><i class="fas fa-video-slash icon"></i>{$admin.nodemocount}</a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="card ban-edit">
                                                                            <div class="card-header">
                                                                                <h3 class="card-title">Actions</h3>
                                                                            </div>
                                                                            <div class="list-group list-group-flush">
                                                                            {if $permission_editadmin}
                                                                                <a class="list-group-item list-group-item-action" href="/admin?c=admins&o=editdetails&id={$admin.aid}"><i class="fas fa-clipboard-list icon"></i> Edit Details</a>
                                                                                <a class="list-group-item list-group-item-action" href="/admin?c=admins&o=editpermissions&id={$admin.aid}"><i class="fas fa-subscript icon"></i> Edit Permissions</a>
                                                                                <a class="list-group-item list-group-item-action" href="/admin?c=admins&o=editservers&id={$admin.aid}"><i class="fas fa-server icon"></i> Edit Server Access</a>
                                                                                <a class="list-group-item list-group-item-action" href="/admin?c=admins&o=editgroup&id={$admin.aid}"><i class="fas fa-users icon"></i> Edit Groups</a>
                                                                            {/if}
                                                                            {if $permission_deleteadmin}
                                                                                <button class="list-group-item list-group-item-action" onclick="RemoveAdmin({$admin.aid}, '{$admin.user}');"><i class="fas fa-trash icon"></i> Delete Admin</button>
                                                                            {/if}
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <div id="banlist-nav">{$admin_nav}</div>
                    </div>
                </div>
            </div>
        {/if}
    </div>
