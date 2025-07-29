<div class="container container-tight py-4">
    <div class="card card-md my-3">
        <div class="card-body">
            <h2 class="card-title text-center mb-4">Forgot password</h2>
            <p class="text-secondary mb-4">Please type your email address in the box below to have your password reset.</p>
            <div class="mb-3">
                <label class="form-label" for="email">E-Mail Address</label>
                <input id="email" class="form-control" type="email" name="email"/>
            </div>
            <div class="form-footer" id="loginSubmit">
                <button class="btn btn-primary w-100" type="button" onclick="xajax_LostPassword($('#email').val());" name="alogin" id="alogin">OK</button>
            </div>
            <div class="text-center text-secondary mt-3">Forget it, <a href="/login">return to the login page</a>.</div>
        </div>
    </div>
    <div class="card" id="msg-blue msg-red">
        <div class="card-status-start bg-info"></div>
        <div class="card-stamp card-stamp-lg">
            <div class="card-stamp-icon bg-info">
                <i class="fas fa-info icon"></i>
            </div>
        </div>
        <div class="card-body">
            <h3 class="card-title">Information</h3>
            <p class="text-secondary">
                If your email is registered, you will receive a password reset link shortly. Please check your email inbox (and spam).
            </p>
        </div>
    </div>
</div>
