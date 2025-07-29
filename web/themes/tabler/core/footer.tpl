            </div><!-- container-xl -->
        </div><!-- page-body -->
        <footer class="footer footer-transparent d-print-none">
            <div class="container-xl">
                <div class="row text-center align-items-center flex-row-reverse">
                    <div class="col-lg-auto ms-lg-auto">
                        <ul class="list-inline list-inline-dots mb-0">
                            <li class="list-inline-item"><a href="https://sbpp.github.io/" target="_blank">SourceBans++</a> {$version}{$git}</li>
                            <li class="list-inline-item">Powered by <a href="https://www.sourcemod.net" target="_blank">SourceMod</a></li>
                        </ul>
                    </div>
                    <div class="col-12 col-lg-auto mt-3 mt-lg-0">
                        <ul class="list-inline list-inline-dots mb-0">
                            <li class="list-inline-item">Theme Tabler</li>
                            <li class="list-inline-item">Adapted by BrightSu</li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </div><!-- page-wrapper -->
</div><!-- page -->

<div class="modal" id="dialogModal" tabindex="-1">
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body text-center py-4">
                <span id="dialog-icon"></span>
                <h3 id="dialog-title"></h3>
                <div id="dialog-content-text" class="text-secondary"></div>
            </div>
            <div class="modal-footer">
                <div class="btn-group w-100" id="dialog-control"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/themes/{$theme}/js/main.js"></script>
<script crossorigin="anonymous" src="https://use.fontawesome.com/releases/v6.7.0/js/all.js"></script>
<script>

{$query}

{literal}
$(document).ready(function() {
    ProcessAdminTabs();

    $('.tip').each(function() {
        $(this).hover(
            function() {
                // Show tooltip with fade in
                var tooltip = $('<div class="custom-tooltip"></div>').text($(this).attr('title')).appendTo('body');
                $(this).data('tooltip', tooltip);
                tooltip.css({
                    position: 'absolute',
                    top: $(this).offset().top + $(this).outerHeight(),
                    left: $(this).offset().left
                }).fadeTo(300, 1);
            },
            function() {
                // Hide tooltip with fade out
                var tooltip = $(this).data('tooltip');
                if (tooltip) {
                    tooltip.fadeTo(300, 0, function() {
                        $(this).remove();
                    });
                }
            }
        );
    });

    $('.perm').each(function() {
        $(this).hover(
            function() {
                var tooltip = $('<div class="custom-tooltip perm"></div>').text($(this).attr('title')).appendTo('body');
                $(this).data('tooltip', tooltip);
                tooltip.css({
                    position: 'absolute',
                    top: $(this).offset().top + $(this).outerHeight(),
                    left: $(this).offset().left
                }).fadeTo(300, 1);
            },
            function() {
                var tooltip = $(this).data('tooltip');
                if (tooltip) {
                    tooltip.fadeTo(300, 0, function() {
                        $(this).remove();
                    });
                }
            }
        );
    });
});
{/literal}
</script>
</body>
</html>
