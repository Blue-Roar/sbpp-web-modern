<?php
global $userbank, $theme;

$navbar = [
     [
        'title' => 'Dashboard',
        'endpoint' => 'home',
        'icon' => 'fas fa-tachometer-alt',
        'description' => 'This page shows an overview of your bans and servers.',
        'permission' => true
    ],
    [
        'title' => 'Servers',
        'endpoint' => 'servers',
        'icon' => 'fas fa-server',
        'description' => 'All of your servers and their status can be viewed here.',
        'permission' => true
    ],
    [
        'title' => 'Bans',
        'endpoint' => 'banlist',
        'icon' => 'fas fa-ban',
        'description' => 'All of the bans in the database can be viewed from here.',
        'permission' => true
    ],
    [
        'title' => 'Comms',
        'endpoint' => 'commslist',
        'icon' => 'fas fa-comment-slash',
        'description' => 'All of the communication bans (such as chat gags and voice mutes) in the database can be viewed from here.',
        'permission' => Config::getBool('config.enablecomms')
    ],
    [
        'title' => 'Report a Player',
        'endpoint' => 'submit',
        'icon' => 'fas fa-flag',
        'description' => 'You can submit a demo or screenshot of a suspected cheater here. It will then be up for review by one of the admins.',
        'permission' => Config::getBool('config.enablesubmit')
    ],
    [
        'title' => 'Appeal a Ban',
        'endpoint' => 'protest',
        'icon' => 'fas fa-gavel',
        'description' => 'Here you can appeal your ban. And prove your case as to why you should be unbanned.',
        'permission' => Config::getBool('config.enableprotest')
    ],
    [
        'title' => 'Admin Panel',
        'endpoint' => 'admin',
        'icon' => 'fas fa-screwdriver-wrench',
        'description' => 'This is the control panel for SourceBans where you can setup new admins, add new server, etc.',
        'permission' => $userbank->is_admin()
    ]
];

$admin = [
    [
        'title' => 'Admins',
        'endpoint' => 'admins',
        'icon' => 'fas fa-user-tie',
        'permission' => ADMIN_OWNER|ADMIN_LIST_ADMINS|ADMIN_ADD_ADMINS|ADMIN_EDIT_ADMINS|ADMIN_DELETE_ADMINS
    ],
    [
        'title' => 'Servers',
        'endpoint' => 'servers',
        'icon' => 'fas fa-server',
        'permission' => ADMIN_OWNER|ADMIN_LIST_SERVERS|ADMIN_ADD_SERVER|ADMIN_EDIT_SERVERS|ADMIN_DELETE_SERVERS
    ],
    [
        'title' => 'Bans',
        'endpoint' => 'bans',
        'icon' => 'fas fa-ban',
        'permission' => ADMIN_OWNER|ADMIN_ADD_BAN|ADMIN_EDIT_OWN_BANS|ADMIN_EDIT_GROUP_BANS|ADMIN_EDIT_ALL_BANS|ADMIN_BAN_PROTESTS|ADMIN_BAN_SUBMISSIONS
    ],
    [
        'title' => 'Comms',
        'endpoint' => 'comms',
        'icon' => 'fas fa-comment-slash',
        'permission' => ADMIN_OWNER|ADMIN_ADD_BAN|ADMIN_EDIT_OWN_BANS|ADMIN_EDIT_ALL_BANS
    ],
    [
        'title' => 'Groups',
        'endpoint' => 'groups',
        'icon' => 'fas fa-users',
        'permission' => ADMIN_OWNER|ADMIN_LIST_GROUPS|ADMIN_ADD_GROUP|ADMIN_EDIT_GROUPS|ADMIN_DELETE_GROUPS
    ],
    [
        'title' => 'Settings',
        'endpoint' => 'settings',
        'icon' => 'fas fa-gears',
        'permission' => ADMIN_OWNER|ADMIN_WEB_SETTINGS
    ],
    [
        'title' => 'Mods',
        'endpoint' => 'mods',
        'icon' => 'fas fa-cubes',
        'permission' => ADMIN_OWNER|ADMIN_LIST_MODS|ADMIN_ADD_MODS|ADMIN_EDIT_MODS|ADMIN_DELETE_MODS
    ]
];

$active = filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS) ?? 'home';
foreach ($navbar as $key => $tab) {
    $navbar[$key]['state'] = ($active === $tab['endpoint']) ? 'active' : 'nonactive';

    if (!$tab['permission']) {
        unset($navbar[$key]);
    }
}

if ($userbank->is_admin()) {
    $cat = filter_input(INPUT_GET, 'c', FILTER_SANITIZE_SPECIAL_CHARS);
    foreach ($admin as $key => $tab) {
        $admin[$key]['state'] = ($cat === $tab['endpoint']) ? 'active' : '';

        if (!$userbank->HasAccess($tab['permission'])) {
            unset($admin[$key]);
        }
    }
}

$theme->assign('navbar', array_values($navbar));
$theme->assign('adminbar', array_values($admin));
$theme->assign('isAdmin', $userbank->is_admin());
$theme->assign('login', $userbank->is_logged_in());
$theme->assign('username', $userbank->GetProperty("user"));
$theme->assign('email', $userbank->GetProperty("email"));
$theme->assign('avatar', "https://gravatar.com/avatar/" . md5($userbank->GetProperty("email")));
$theme->display('core/navbar.tpl');
