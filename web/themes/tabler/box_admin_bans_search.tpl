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
                            <div class="col-lg-6 col-xl-4">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-10">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="name" name="search_type" type="radio" value="name">
                                            <span class="form-check-label text-end">Nickname</span>
                                        </label>
                                    </span>
                                    <input class="form-control" type="text" id="nick" onfocus="$('#name').click()">
                                </div>
                            </div>
                            <div class="col-lg-6 col-xl-5">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-10">
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
                            <div class="col-lg-6 col-xl-3">
                                {if !$hideplayerips}
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-10">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="ip_" type="radio" name="search_type" value="radiobutton">
                                            <span class="form-check-label text-end">IP</span>
                                        </label>
                                    </span>
                                    <input class="form-control" type="text" id="ip" onfocus="$('#ip_').click()">
                                </div>
                                {/if}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-10">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="ban_type_" type="radio" name="search_type" value="radiobutton">
                                            <span class="form-check-label text-end">Type</span>
                                        </label>
                                    </span>
                                    <select class="form-select" id="ban_type" onfocus="$('#ban_type_').click()">
                                        <option value="0" selected>Steam ID</option>
                                        <option value="1">IP Address</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-10">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="reason_" type="radio" name="search_type" value="radiobutton">
                                            <span class="form-check-label text-end">Reason</span>
                                        </label>
                                    </span>
                                    <input class="form-control" type="text" id="ban_reason" onfocus="$('#reason_').click()">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-10">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="date" type="radio" name="search_type" value="radiobutton">
                                            <span class="form-check-label text-end">Date</span>
                                        </label>
                                    </span>
                                    <input class="form-control" type="number" min="1" max="31" id="day" placeholder="DD" onfocus="$('#date').click()" maxlength="2">
                                    <input class="form-control" type="number" min="1" max="12" id="month" placeholder="MM" onfocus="$('#date').click()" maxlength="2">
                                    <input class="form-control" type="number" min="1970" max="2077" id="year" placeholder="YYYY" onfocus="$('#date').click()" maxlength="4">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-10">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="length_" type="radio" name="search_type" value="radiobutton">
                                            <span class="form-check-label text-end">Length</span>
                                        </label>
                                    </span>
                                    <select class="form-select w-8 flex-grow-0" id="length_type" onfocus="$('#length_').click()">
                                        <option value="e" title="equal to">=</option>
                                        <option value="h" title="greater">&gt;</option>
                                        <option value="l" title="smaller">&lt;</option>
                                        <option value="eh" title="equal to or greater">&gt;=</option>
                                        <option value="el" title="equal to or smaller">&lt;=</option>
                                    </select>
                                    <input class="form-control w-8" type="number" min="0" id="other_length" name="other_length" onfocus="$('#length_').click()" style="display: none;">
                                    <select class="form-select w-10" id="length" onfocus="$('#length_').click()" onchange="switch_length(this);">
                                        <option value="0">Permanent</option>
                                        <optgroup label="minutes">
                                            <option value="1">1 minute</option>
                                            <option value="5">5 minutes</option>
                                            <option value="10">10 minutes</option>
                                            <option value="15">15 minutes</option>
                                            <option value="30">30 minutes</option>
                                            <option value="45">45 minutes</option>
                                        </optgroup>
                                        <optgroup label="hours">
                                            <option value="60">1 hour</option>
                                            <option value="120">2 hours</option>
                                            <option value="180">3 hours</option>
                                            <option value="240">4 hours</option>
                                            <option value="480">8 hours</option>
                                            <option value="720">12 hours</option>
                                        </optgroup>
                                        <optgroup label="days">
                                            <option value="1440">1 day</option>
                                            <option value="2880">2 days</option>
                                            <option value="4320">3 days</option>
                                            <option value="5760">4 days</option>
                                            <option value="7200">5 days</option>
                                            <option value="8640">6 days</option>
                                        </optgroup>
                                        <optgroup label="weeks">
                                            <option value="10080">1 week</option>
                                            <option value="20160">2 weeks</option>
                                            <option value="30240">3 weeks</option>
                                        </optgroup>
                                        <optgroup label="months">
                                            <option value="40320">1 month</option>
                                            <option value="80640">2 months</option>
                                            <option value="120960">3 months</option>
                                            <option value="241920">6 months</option>
                                            <option value="483840">12 months</option>
                                        </optgroup>
                                        <option value="other">Other length in minutes</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-10">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="where_banned" name="search_type" type="radio" value="radiobutton">
                                            <span class="form-check-label text-end">Server</span>
                                        </label>
                                    </span>
                                    <select class="form-select" id="server" onfocus="$('#where_banned').click()">
                                        <option label="Web Ban" value="0">Web Ban</option>
                                    {foreach from=$server_list item="server"}
                                        <option value="{$server.sid}" id="ss{$server.sid}">Retrieving Hostname... ({$server.ip}:{$server.port})</option>
                                    {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                {if !$hideadminname}
                                <div class="input-group mb-2">
                                    <span class="input-group-text w-10">
                                        <label class="form-check m-0 flex-grow-1">
                                            <input class="form-check-input" id="admin" name="search_type" type="radio" value="radiobutton">
                                            <span class="form-check-label text-end">Admin</span>
                                        </label>
                                    </span>
                                    <select class="form-select" id="ban_admin" onfocus="$('#admin').click()">
                                    {foreach from=$admin_list item="admin"}
                                        <option label="{$admin.user}" value="{$admin.aid}">{$admin.user}</option>
                                    {/foreach}
                                    </select>
                                </div>
                                {/if}
                            </div>
                        </div>
                        {if $is_admin}
                        <div class="input-group mb-2">
                            <span class="input-group-text w-10">
                                <label class="form-check m-0 flex-grow-1">
                                    <input class="form-check-input" id="comment_" type="radio" name="search_type" value="radiobutton">
                                    <span class="form-check-label text-end">Comment</span>
                                </label>
                            </span>
                            <input class="form-control" type="text" id="ban_comment" onfocus="$('#comment_').click()">
                        </div>
                        {/if}
                    </div>
                    <button type="button" onclick="search_bans();" name="searchbtn" class="btn" id="searchbtn">Search</button>
                </div>
            </div>
        </div>
    </div>
</div>
{$server_script}
<script type="text/javascript">
function switch_length(opt)
{
    if ($(opt).val()=='other') {
        $('#other_length').show();
        $('#other_length').focus();
    } else {
        $('#other_length').hide();
    }
}
</script>
