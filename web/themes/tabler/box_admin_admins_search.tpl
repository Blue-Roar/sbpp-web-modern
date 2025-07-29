<div class="card">
    <div class="accordion accordion-flush" id="accordion-search">
        <div class="accordion-item">
            <div class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-search" aria-expanded="true">
                    Advanced Search
                    <div class="accordion-button-toggle"><i class="fas fa-chevron-down icon"></i></div>
                </button>
            </div>
            <div id="collapse-search" class="accordion-collapse collapse" data-bs-parent="#accordion-search">
                <div class="accordion-body">
                    <div class="mb-3">
                        <label class="form-label">Search</label>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-11 align-items-stretch">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="name_" name="search_type" type="radio" value="name">
                                            <span class="form-check-label text-end">Nickname</span>
                                        </label>
                                    </span>
                                    <input class="form-control" type="text" id="nick" onfocus="$('#name_').click()">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-11 align-items-stretch">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="steam_" type="radio" name="search_type" value="radiobutton">
                                            <span class="form-check-label text-end">SteamID</span>
                                        </label>
                                    </span>
                                    <input class="form-control" type="text" id="steamid" onfocus="$('#steam_').click()">
                                    <select class="form-select w-11 flex-grow-0" id="steam_match" onfocus="$('#steam_').click()">
                                        <option value="0" selected>Exact Match</option>
                                        <option value="1">Partial Match</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-11 align-items-stretch">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="admin_on_" name="search_type" type="radio" value="radiobutton">
                                            <span class="form-check-label text-end">Server</span>
                                        </label>
                                    </span>
                                    <select class="form-select" id="server" onfocus="$('#admin_on_').click()">
                                        {foreach from=$server_list item="server"}
                                            <option value="{$server.sid}" id="ss{$server.sid}">Retrieving Hostname... ({$server.ip}:{$server.port})</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            {if $can_editadmin}
                                <div class="col-lg-6">
                                    <div class="input-group mb-2">
                                        <span class="input-group-text w-11 align-items-stretch">
                                            <label class="form-check m-0 flex-grow-1">
                                                <input class="form-check-input" id="admemail_" name="search_type" type="radio" value="radiobutton">
                                                <span class="form-check-label text-end">E-Mail</span>
                                            </label>
                                        </span>
                                        <input class="form-control" type="text" id="admemail" onfocus="$('#admemail_').click()">
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-11 align-items-stretch">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="webgroup_" type="radio" name="search_type" value="radiobutton">
                                            <span class="form-check-label text-end">Web Group</span>
                                        </label>
                                    </span>
                                    <select class="form-select" id="webgroup" onfocus="$('#webgroup_').click()">
                                        {foreach from=$webgroup_list item="webgrp"}
                                            <option label="{$webgrp.name}" value="{$webgrp.gid}">{$webgrp.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-11 align-items-stretch">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="srvadmgroup_" type="radio" name="search_type" value="radiobutton">
                                            <span class="form-check-label text-end">Serveradmin Group</span>
                                        </label>
                                    </span>
                                    <select class="form-select" id="srvadmgroup" onfocus="$('#srvadmgroup_').click()">
                                        {foreach from=$srvadmgroup_list item="srvadmgrp"}
                                            <option label="{$srvadmgrp.name}" value="{$srvadmgrp.name}">{$srvadmgrp.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-11 align-items-stretch">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="srvgroup_" type="radio" name="search_type" value="radiobutton">
                                            <span class="form-check-label text-end">Server Group</span>
                                        </label>
                                    </span>
                                    <select class="form-select" id="srvgroup" onfocus="$('#srvgroup_').click()">
                                        {foreach from=$srvgroup_list item="srvgrp"}
                                            <option label="{$srvgrp.name}" value="{$srvgrp.gid}">{$srvgrp.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-11 align-items-stretch">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="admwebflags_" name="search_type" type="radio" value="radiobutton">
                                            <span class="form-check-label text-end">Web <br> Admin <br> Permissions</span>
                                        </label>
                                    </span>
                                    <select class="form-select" id="admwebflag" name="admwebflag" onfocus="$('#admwebflags_').click()" onblur="getMultiple(this, 1);" size="5" multiple>
                                        {foreach from=$admwebflag_list item="admwebflag"}
                                            <option label="{$admwebflag.name}" value="{$admwebflag.flag}">{$admwebflag.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-11 align-items-stretch">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="admsrvflags_" name="search_type" type="radio" value="radiobutton">
                                            <span class="form-check-label text-end">Server <br> Admin <br> Permissions</span>
                                        </label>
                                    </span>
                                    <select class="form-select" id="admsrvflag" name="admsrvflag" onfocus="$('#admsrvflags_').click()" onblur="getMultiple(this, 2);" size="5" multiple>
                                        {foreach from=$admsrvflag_list item="admsrvflag"}
                                            <option label="{$admsrvflag.name}" value="{$admsrvflag.flag}">{$admsrvflag.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="button" onclick="search_admins();" name="searchbtn" class="btn" id="searchbtn">Search</button>
                </div>
            </div>
        </div>
    </div>
</div>
{$server_script}
