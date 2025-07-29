    <header class="navbar navbar-expand-md d-print-none">
        <div class="container-xl">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu" aria-controls="navbar-menu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
                <a href="/home" aria-label="Home"><img class="navbar-brand-image" src="/images/{$logo}" alt="SourceBans Logo" /></a>
            </div>
            <div class="navbar-nav flex-row order-md-last">
            {if $isAdmin}
                <div class="collapse navbar-collapse me-3" id="navbar-menu">
                    <ul class="navbar-nav">
                        {foreach from=$adminbar item=admin}
                            <li class="nav-item {$admin.state}">
                                <a class="nav-link" href="/admin?c={$admin.endpoint}">
                                    <span class="nav-link-icon d-md-none d-lg-inline-block"><i class="{$admin.icon}"></i></span>
                                    <span class="nav-link-title">{$admin.title}</span>
                                </a>
                            </li>
                        {/foreach}
                    </ul>
                </div>
            {/if}
            {if $login}
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown" aria-label="User Menu">
                        <span class="avatar avatar-sm" style="background-image: url({$avatar})"></span>
                        <div class="d-none d-xl-block ps-2">
                            <div class="mb-1 small text-muted">Welcome back,</div>
                            <div class="text-primary">{$username}</div>
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                        <a href="/account" class="dropdown-item">My Account</a>
                        <div class="dropdown-divider my-1"></div>
                        <a href="/logout" class="dropdown-item">Logout</a>
                    </div>
                </div>
            {else}
                <div class="d-flex">
                    <a href="/login" class="nav-link px-0" title="Login" data-bs-toggle="tooltip" data-bs-placement="bottom"><i class="fas fa-right-to-bracket"></i></a>
                </div>
            {/if}
            </div>
        </div>
    </header>
    <header class="navbar-expand-md">
        <div class="collapse navbar-collapse" id="navbar-menu">
            <div class="navbar">
                <div class="container-xl">
                    <div class="row flex-column flex-md-row flex-fill align-items-center">
                        <div class="col">
                            <ul class="navbar-nav">
                            {foreach from=$navbar item=nav}
                                <li class="nav-item {$nav.state}">
                                    <a class="nav-link" href="/{$nav.endpoint}" data-bs-toggle="tooltip" data-bs-placement="bottom" title="{$nav.description}" target="_self">
                                        <span class="nav-link-icon d-md-none d-lg-inline-block"><i class="{$nav.icon}"></i></span>
                                        <span class="nav-link-title">{$nav.title}</span>
                                    </a>
                                </li>
                            {/foreach}
                            </ul>
                        </div>
                        <div class="col-2 d-none d-xxl-block">
                            <div class="my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last">
                                <form action="/" method="get" onsubmit="validateForm(this)">
                                    <input type="hidden" name="p" value="banlist" />
                                    <div class="input-icon">
                                        <span class="input-icon-addon"><i class="fas fa-magnifying-glass icon"></i></span>
                                        <input type="text" name="searchText" class="form-control" placeholder="Search Bans..." aria-label="Search Bans">
                                        <span class="input-icon-addon"><i class="fas fa-ban icon"></i></span>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-2 d-none d-xxl-block">
                            <div class="my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last">
                                <form action="/" method="get" onsubmit="validateForm(this)">
                                    <input type="hidden" name="p" value="commslist" />
                                    <div class="input-icon">
                                        <span class="input-icon-addon"><i class="fas fa-magnifying-glass icon"></i></span>
                                        <input type="text" name="searchText" class="form-control" placeholder="Search Comms..." aria-label="Search Comms">
                                        <span class="input-icon-addon"><i class="fas fa-comment-slash icon"></i></span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="page-wrapper">
