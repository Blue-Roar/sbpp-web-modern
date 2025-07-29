{if NOT $permission_import}
    Access Denied!
{else}
    <h3>Import Bans</h3>
    For more information or help regarding a certain subject move your mouse over the question mark.<br /><br />
    <form action="" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="importBans" />
        <table width="90%" style="border-collapse:collapse;" id="group.details" cellpadding="3">
            <tr>
                <td valign="top" width="25%">
                    <div class="rowdesc">
                        <span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Select the banned_users.cfg or banned_ip.cfg file to upload and add bans."><i class="fas fa-circle-question icon"></i></span>File
                    </div>
                </td>
                <td>
                    <div align="left">
                        <input type="file" TABINDEX=1 class="file" id="importFile" name="importFile" />
                    </div>
                    <div id="file.msg" class="badentry"></div>
                </td>
            </tr>
            <tr>
                <td valign="top"><div class="rowdesc"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Check this box, if you want to get the names of the players from their steam community profile. (just works with banned_users.cfg)"><i class="fas fa-circle-question icon"></i></span>Get Names</div></td>
                <td>
                    <div align="left">
                        <input type="checkbox" name="friendsname" id="friendsname" />
                    </div>
                    <div id="friendsname.msg" class="badentry"></div>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    {sb_button text="Import" class="ok" id="iban" submit=true}
                    &nbsp;
                    {sb_button text="Back" onclick="history.go(-1)" class="cancel" id="iback"}
                </td>
            </tr>
        </table>
    </form>
    {if !$extreq}
        <script type="text/javascript">
            $('friendsname').disabled = true;
        </script>
    {/if}
{/if}
