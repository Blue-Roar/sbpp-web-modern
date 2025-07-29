<!--<div class="text-center mb-4">
    <a href="/home" aria-label="Home" class="navbar-brand navbar-brand-autodark"><img class="navbar-brand-image" src="/images/{$logo}" alt="SourceBans Logo" /></a>
</div>-->
<div class="container container-tight py-4">
    <div class="card card-md">
        <div class="card-header justify-content-center">
            <div class="card-title">Admin Login</div>
        </div>
        -{if $steamlogin_show == 1}-
        <form class="card-body" id="loginForm" novalidate>
            <div class="mb-3">
                <label class="form-label" for="loginUsername">Username</label>
                <input type="text" class="form-control" id="loginUsername" name="username" required>
                <div class="invalid-feedback">You must enter your login name!</div>
            </div>
            <div class="mb-2">
                <label class="form-label" for="loginPassword">Password<span class="form-label-description"><a href="/lostpassword">Lost your password?</a></span></label>
                <input type="password" class="form-control" id="loginPassword" name="password" required>
                <div class="invalid-feedback">You must enter your password!</div>
            </div>
            <div class="mb-2">
                <label class="form-check">
                    <input type="checkbox" class="form-check-input" id="loginRememberMe" name="remember" checked>
                    <span class="form-check-label">Remember me</span>
                </label>
            </div>
            <div class="form-footer">
                <button type="submit" class="btn btn-primary w-100" disabled>Sign in</button>
            </div>
        </form>
        <div class="hr-text">or</div>
        -{/if}-
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <a href="/login?o=steam" class="btn btn-secondary w-100">
                        <i class="fab fa-steam icon"></i>
                        Login with Steam
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
    $('.form-control').on('input', function() {
        if ($(this).val().length > 0) {
            $(this).removeClass('is-invalid');
            if ($('#loginUsername').val().length > 0 && $('#loginPassword').val().length > 0) {
                $('#loginForm button[type="submit"]').removeAttr('disabled');
            } else {
                $('#loginForm button[type="submit"]').attr('disabled', true);
            }
        } else {
            $(this).addClass('is-invalid');
        }
    });

    $('#loginForm').on('submit', function(e) {
        e.preventDefault();
        DoLogin();
    });
});
</script>