<div class="card">
    <div class="card-header">
        <ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs" role="tablist" id="admin-page-menu">
        {foreach from=$tabs item="tab"}
            <li class="nav-item" role="presentation">
                <a href="#{$tab.name}" class="nav-link" data-bs-toggle="tab" aria-selected="false" role="tab" onclick="openTab(this, '{$tab.name}');">{$tab.name}</a>
            </li>
        {/foreach}
        </ul>
    </div>
