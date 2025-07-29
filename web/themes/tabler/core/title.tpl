        <div class="page-header d-print-none" aria-label="Page header">
            <div class="container-xl">
                <div class="row g-2 align-items-center">
                    <div class="col">
                        <div class="page-pretitle">
                            <ol class="breadcrumb" aria-label="breadcrumbs">
                                {foreach from=$breadcrumb item=crumb}
                                    <li class="breadcrumb-item">
                                        <a href="{$crumb.url}">{$crumb.title}</a>
                                    </li>
                                {/foreach}
                            </ol>
                        </div>
                        <h2 class="page-title">{$title}</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-body">
            <div class="container-xl" id="content">
