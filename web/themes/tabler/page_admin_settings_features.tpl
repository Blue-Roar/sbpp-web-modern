<form action="" method="post">
    <input type="hidden" name="settingsGroup" value="features" />
    <table width="99%" border="0" style="border-collapse:collapse;" id="group.features" cellpadding="3">
        <tr>
            <td valign="top" colspan="2"><h3>Ban Features</h3>For more information or help regarding a certain subject move your mouse over the question mark.<br /><br /></td>
        </tr>
        <tr>
            <td valign="top" width="35%"><div class="rowdesc"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Check this box to enable the entire ban list to be publically downloaded and shared."><i class="fas fa-circle-question icon"></i></span> Make Export Bans Public</div></td>
            <td>
                <div align="left">
                    <input type="checkbox" name="export_public" id="export_public" />
                </div>
            </td>
        </tr>
        <tr>
            <td valign="top"><div class="rowdesc"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Check this box to kick a player when a ban is posted."><i class="fas fa-circle-question icon"></i></span> Enable KickIt</div></td>
            <td>
                <div align="left">
                    <input type="checkbox" name="enable_kickit" id="enable_kickit" />
                </div>
            </td>
        </tr>
        <tr>
            <td valign="top"><div class="rowdesc"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Check this box, if you want to enable banning of whole steam community groups."><i class="fas fa-circle-question icon"></i></span> Enable Group Banning</div></td>
            <td>
                <div align="left">
                    {if $steamapi}
                        <input type="checkbox" name="enable_groupbanning" id="enable_groupbanning" />
                    {else}
                        <input type="checkbox" name="enable_groupbanning" id="enable_groupbanning" disabled />
                        <br/>You haven't set a valid steamapi key in the config
                    {/if}
                </div>
                <div id="enable_groupbanning.msg" class="badentry"></div>
            </td>
        </tr>
        <tr>
            <td valign="top"><div class="rowdesc"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Check this box, if you want to enable banning all steam community friends of a player."><i class="fas fa-circle-question icon"></i></span> Enable Friends Banning</div></td>
            <td>
                <div align="left">
                    <input type="checkbox" name="enable_friendsbanning" id="enable_friendsbanning" />
                </div>
                <div id="enable_friendsbanning.msg" class="badentry"></div>
            </td>
        </tr>
        <tr>
            <td valign="top"><div class="rowdesc"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Check this box, if you want to enable the admin rehashing everytime an admin/group has been changed."><i class="fas fa-circle-question icon"></i></span> Enable Admin Rehashing</div></td>
            <td>
                <div align="left">
                    <input type="checkbox" name="enable_adminrehashing" id="enable_adminrehashing" />
                </div>
                <div id="enable_adminrehashing.msg" class="badentry"></div>
            </td>
        </tr>


        <!-- added for steam login option mod -->

        <tr>
            <td valign="top"><div class="rowdesc"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Check this box, if you want to enable the Normal login option on the login form."><i class="fas fa-circle-question icon"></i></span> Enable Normal Login</div></td>
            <td>
                <div align="left">
                    <input type="checkbox" name="enable_steamlogin" id="enable_steamlogin" />
                </div>
                <div id="enable_steamlogin.msg" class="badentry"></div>
            </td>
        </tr>

        <!-- end steam login option mod -->


        <!-- public comments -->

        <tr>
            <td valign="top"><div class="rowdesc"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Check this box, if you want to make admin comments on bans viewable by everyone."><i class="fas fa-circle-question icon"></i></span> Enable Public Comments</div></td>
            <td>
                <div align="left">
                    <input type="checkbox" name="enable_publiccomments" id="enable_publiccomments" />
                </div>
                <div id="enable_publiccomments.msg" class="badentry"></div>
            </td>
        </tr>

        <!-- end public comments -->


        <tr>
            <td colspan="2" align="center">
                {sb_button text="Save Changes" class="ok" id="fsettings" submit=true}
                &nbsp;
                {sb_button text="Back" class="cancel" id="fback"}
            </td>
        </tr>
    </table>
</form>
