<?php
global $theme;

$breadcrumb = [
    [
        'title' => 'Home',
        'url' => '/home'
    ],
    [
        'title' => $title,
        'url' => '/'.filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS)
    ]
];

$theme->assign('board_name', Config::get('template.title'));
$theme->assign('title', $title);
$theme->assign('breadcrumb', $breadcrumb);
$theme->display('core/title.tpl');
