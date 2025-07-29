<div class="card">
    <div class="card-status-start bg-primary"></div>
    <div class="card-stamp card-stamp-lg">
        <div class="card-stamp-icon bg-primary">
            <i class="fas fa-flag icon"></i>
        </div>
    </div>
    <div class="card-body">
        <h3 class="card-title">Submit a Report</h3>
        <p class="text-secondary">
            In order to keep our servers running smoothly, offenders of our rules should be punished and we can't always be on call to help.<br />
            When submitting a player report, we ask you to fill out the report as detailed as possible to help ban the offender as this will help us process your report quickly.<br />
            If you are unsure on how to record evidence within in-game, please click <a href="javascript:void(0)" onclick="ShowBox('How To Record Evidence', 'The best way to record evidence on someone breaking the rules would be to use Shadow Play or Plays.TV. Both pieces of software will record your game 24/7 with little to no impact on your game and you simply press a keybind to record the last X amount of minutes of gameplay which is perfect for catching rule breakers.<br /><br /> Alternatively, you can use the old method of using demos. While you are spectating the offending player, press the <kbd>`</kbd> key on your keyboard to show the Developers Console. If this does not show, you will need to go into your Game Settings and enable this. Then type `<code>record [demoname]</code>` and hit enter, the file will then be in your mod folder of your game directory.', 'blue', '', true);">here</a> for an explanation.
        </p>
    </div>
</div>
<form action="/submit" method="post" enctype="multipart/form-data" class="card my-3">
    <div class="card-header">
        <h3 class="card-title">Ban Submission Form</h3>
    </div>
    <div class="card-body" id="submit-main">
        <input type="hidden" name="subban" value="1">
        <div class="row">
            <div class="col-sm-4">
                <div class="mb-3">
                    <label class="form-label">Player SteamID</label>
                    <input type="text" name="SteamID" maxlength="64" value="{$STEAMID}" class="form-control"/>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="mb-3">
                    <label class="form-label">Player IP</label>
                    <input type="text" name="BanIP" maxlength="64" value="{$ban_ip}" class="form-control" />
                </div>
            </div>
            <div class="col-sm-4">
                <div class="mb-3">
                    <label class="form-label required">Player Nickname</label>
                    <input type="text" name="PlayerName" maxlength="70" value="{$player_name}" class="form-control" />
                </div>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label required">Comments</label>
            <textarea name="BanReason" class="form-control" placeholder="Type something…">{$ban_reason}</textarea>
            <small class="form-hint">Please write down a descriptive comment. So NO comments like: "hacking"</small>
        </div>
        <div class="row">
            <div class="col-sm-8">
                <div class="mb-3">
                    <label class="form-label required">Server</label>
                    <select id="server" name="server" class="form-select">
                        <option value="-1">-- Select Server --</option>
                        <optgroup label="Servers on this system">
                        {foreach from=$server_list item="server"}
                            <option value="{$server.sid}" {if $server_selected == $server.sid}selected{/if}>{$server.hostname}</option>
                        {/foreach}
                        </optgroup>
                        <optgroup label="Other servers">
                            <option value="0">Other server / Not listed here</option>
                        </optgroup>
                    </select>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="mb-3">
                    <label class="form-label">Upload Demo</label>
                    <input name="demo_file" type="file" class="form-control" />
                    <small class="form-hint">Note: Only DEM, <a href="http://www.winzip.com" target="_blank">ZIP</a>, <a href="http://www.rarlab.com" target="_blank">RAR</a>, <a href="http://www.7-zip.org" target="_blank">7Z</a>, <a href="http://www.bzip.org" target="_blank">BZ2</a> or <a href="http://www.gzip.org" target="_blank">GZ</a> allowed.</small>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="mb-3">
                    <label class="form-label">Your Name</label>
                    <input type="text" name="SubmitName" maxlength="70" value="{$subplayer_name}" class="form-control" />
                </div>
            </div>
            <div class="col-sm-6">
                <div class="mb-3">
                    <label class="form-label required">Your Email</label>
                    <input type="email" name="EmailAddr" maxlength="70" value="{$player_email}" class="form-control" />
                </div>
            </div>
        </div>
    </div>
    <div class="card-footer">
        <button type="submit" name="save" class="btn btn-primary w-100" id="save">Submit</button>
    </div>
</form>
<div class="card">
    <div class="card-status-start bg-info"></div>
    <div class="card-stamp card-stamp-lg">
        <div class="card-stamp-icon bg-info">
            <i class="fas fa-info icon"></i>
        </div>
    </div>
    <div class="card-body">
        <h3 class="card-title">What happens if someone gets banned?</h3>
        <p class="text-secondary">
            If someone you reported gets banned, the SteamID or IP will be included onto the ban on the main bans list and everytime they try to connect to any server they will be blocked from joining and it will be logged into our database.
        </p>
    </div>
</div>