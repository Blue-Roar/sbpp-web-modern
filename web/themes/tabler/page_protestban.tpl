<div class="card">
    <div class="card-status-start bg-primary"></div>
    <div class="card-stamp card-stamp-lg">
        <div class="card-stamp-icon bg-primary">
            <i class="fas fa-gavel icon"></i>
        </div>
    </div>
    <div class="card-body">
        <h3 class="card-title">Appeal a Ban</h3>
        <p class="text-secondary">
            In order to appeal a ban, you must make sure you are banned via clicking <a href="/banlist">here</a> to see if you are banned and for what reason.<br />
            If you are indeed on our ban list and you feel it is unjust or any other circumstances, please fill out the appeal format below.
        </p>
    </div>
</div>
<form action="/protest" method="post" class="card my-3">
    <div class="card-header">
        <h3 class="card-title">Protest Submission Form</h3>
    </div>
    <div class="card-body" id="submit-main">
        <input type="hidden" name="subprotest" value="1">
        <input type="hidden" name="Type" value="0">
        <div class="row">
            <div class="col-sm-6">
                <div class="mb-3">
                    <label class="form-label required">Your Name</label>
                    <input type="text" name="PlayerName" maxlength="70" value="{$player_name}" class="form-control" />
                </div>
            </div>
            <div class="col-sm-6">
                <div class="mb-3">
                    <label class="form-label required">Your Email</label>
                    <input type="email" name="EmailAddr" maxlength="70" value="{$player_email}" class="form-control" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 col-md-4">
                <div class="mb-3">
                    <label class="form-label">Type of ban</label>
                    <label class="form-check form-switch d-flex m-0 p-2 justify-content-center align-items-center">
                        <span class="form-check-label ms-2">SteamID</span>
                        <input class="form-check-input my-0 mx-2" type="checkbox" id="Type" name="TypeSelect">
                        <span class="form-check-label me-2">IP Address</span>
                    </label>
                </div>
            </div>
            <div class="col-sm-6 col-md-8" id="steam_row">
                <div class="mb-3">
                    <label class="form-label required">SteamID</label>
                    <input type="text" name="SteamID" maxlength="64" value="{$steam_id}" class="form-control" />
                </div>
            </div>
            <div class="col-sm-6 col-md-8" id="ip_row" style="display: none;">
                <div class="mb-3">
                    <label class="form-label required">IP Address</label>
                    <input type="text" name="IP" maxlength="64" value="{$ip}" class="form-control" />
                </div>
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label required">Reason why you should be unbanned</label>
            <textarea name="BanReason" class="form-control" placeholder="Type something…">{$reason}</textarea>
            <small class="form-hint">Be as descriptive as possible</small>
        </div>
    </div>
    <div class="card-footer">
        <button type="submit" name="alogin" class="btn btn-primary w-100" id="alogin">Submit</button>
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
        <h3 class="card-title">What happens after I post my appeal?</h3>
        <p class="text-secondary">
            The staff team will be notified of your appeal. They will then review if the ban is conclusive. After reviewing you will get a reply, which usally means within 24 hours.<br />
            <b>Note:</b> Sending emails with threats to our admins, scolding or shouting will not get you unbanned and you will be permanently denied from using any of our services.
        </p>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#Type').change(function() {
            if ($(this).is(':checked')) {
                $('#steam_row').hide();
                $('#ip_row').show();
                $('input[name="Type"]').val(1);
            } else {
                $('#steam_row').show();
                $('#ip_row').hide();
                $('input[name="Type"]').val(0);
            }
        });
    });
</script>