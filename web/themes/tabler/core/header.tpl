<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{$title}</title>
    <link rel="Shortcut Icon" href="/themes/{$theme}/images/favicon.ico" />
    <link href="/themes/{$theme}/css/tabler.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.7.0/css/all.css">
    <link href="/themes/{$theme}/css/main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/scripts/jquery.min.js"></script>
    <script type="text/javascript" src="/themes/{$theme}/js/tabler.min.js"></script>
    <script type="text/javascript" src="/scripts/sourcebans-jquery.js"></script>
    {$xajax}
    {literal}
    <script>
        // Based on sourcebans.js
        function isValidID(steamid) {
            const regexes = [
                /STEAM_[0|1]:[0:1]:\d*/,
                /$U:1:\d*$/,
                /U:1:\d*/,
                /\d{17}/
            ];
            return regexes.some(regex => regex.test(steamid));
        }

        // Verify input data and dynamically adjust search
        function validateForm(form) {
            const searchInput = form.querySelector('.searchbox');
            const submitButton = form.querySelector('.button');
            const pageValue = form.querySelector('input[name="p"]').value;

            if (isValidID(searchInput.value)) {
                searchInput.name = 'advSearch';
                submitButton.name = 'advType';
                submitButton.value = 'steamid';
            } else {
                searchInput.name = 'searchText';
                submitButton.name = 'Submit';
                submitButton.value = 'Search';
            }
        }
    </script>
    {/literal}
</head>
<body>
<div class="page">
