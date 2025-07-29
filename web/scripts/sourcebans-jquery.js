/*************************************************************************
This file is part of SourceBans++

SourceBans++ (c) 2014-2024 by SourceBans++ Dev Team

The SourceBans++ Web panel is licensed under a
Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

You should have received a copy of the license along with this
work.  If not, see <http://creativecommons.org/licenses/by-nc-sa/3.0/>.

This program is based off work covered by the following copyright(s):
SourceBans 1.4.11
Copyright © 2007-2014 SourceBans Team - Part of GameConnect
Licensed under CC-BY-NC-SA 3.0
Page: <http://www.sourcebans.net/> - <http://www.gameconnect.net/>
*************************************************************************/

/*
This script has been modified by BrightSu, abandoning the use of MooTools and using jQuery instead.
*/

const ADMIN_LIST_ADMINS = 		(1 << 0);

const ADMIN_ADD_ADMINS = 		(1 << 1);

const ADMIN_EDIT_ADMINS =		(1 << 2);
const ADMIN_DELETE_ADMINS =		(1 << 3);

const ADMIN_LIST_SERVERS =		(1 << 4);
const ADMIN_ADD_SERVER =		(1 << 5);
const ADMIN_EDIT_SERVERS =		(1 << 6);
const ADMIN_DELETE_SERVERS =	(1 << 7);

const ADMIN_ADD_BAN =			(1 << 8);
const ADMIN_EDIT_OWN_BANS =		(1 << 10);
const ADMIN_EDIT_GROUP_BANS =	(1 << 11);
const ADMIN_EDIT_ALL_BANS =		(1 << 12);
const ADMIN_BAN_PROTESTS =		(1 << 13);
const ADMIN_BAN_SUBMISSIONS =	(1 << 14);
const ADMIN_DELETE_BAN =		(1 << 25);
const ADMIN_UNBAN = 			(1 << 26);
const ADMIN_BAN_IMPORT =		(1 << 27);
const ADMIN_UNBAN_OWN_BANS = 	(1 << 30);
const ADMIN_UNBAN_GROUP_BANS = 	(1 << 31);

const ADMIN_NOTIFY_SUB =		(1 << 28);
const ADMIN_NOTIFY_PROTEST =	(1 << 29);

const ADMIN_LIST_GROUPS =		(1 << 15);
const ADMIN_ADD_GROUP = 		(1 << 16);
const ADMIN_EDIT_GROUPS =		(1 << 17);
const ADMIN_DELETE_GROUPS =		(1 << 18);

const ADMIN_WEB_SETTINGS =		(1 << 19);

const ADMIN_LIST_MODS =			(1 << 20);
const ADMIN_ADD_MODS =			(1 << 21);
const ADMIN_EDIT_MODS =			(1 << 22);
const ADMIN_DELETE_MODS =		(1 << 23);

const ADMIN_OWNER = 			(1 << 24);

let accordion;

function ProcessAdminTabs()
{
	const url = window.location.toString();
	const pos = url.indexOf('^') + 1;
	const tabNo = url.charAt(pos);

	if (!isNaN(tabNo))
		swapTab(tabNo);

	const upos = url.indexOf('~') + 1;
	const utabNo = url.charAt(upos + 1);
	const utabType = url.charAt(upos);

	if (!isNaN(utabNo))
		Swap2ndPane(utabNo, utabType);
}

function Swap2ndPane(id, ttype)
{
	let i = 0;
	let i2 = 0;
	if(document.getElementById(`utab-${ttype}${id}`))
	{
		while (document.getElementById(ttype + i))
		{
			$(`#${ttype}${i}`).hide();
			i++;
		}
		while (i2 < 50)
		{
			if($(`#utab-${ttype}${i2}`).length)
			{
				$(`#utab-${ttype}${i2}`).removeClass('active').addClass('nonactive');
			}
			i2++;
		}
		$(`#utab-${ttype}${id}`).addClass('active');
		$(`#${ttype}${id}`).show();
	}
}

function InitAccordion(opener, element, container, num)
{
	// jQuery ready function
	$(document).ready(function() {
		InitAccordion(opener, element, container, num);
	});

	if(num == null)
		num = -1;
	
	// Simple accordion implementation with jQuery
	function createAccordion(opener, element, container) {
		const $openers = $(opener);
		const $elements = $(element);
		
		// Hide all elements initially
		$elements.hide();
		
		// Set up click handlers
		$openers.on('click', function() {
			const index = $openers.index(this);
			const $target = $elements.eq(index);
			
			// Toggle the target element
			if ($target.is(':visible')) {
				$target.slideUp();
			} else {
				$elements.slideUp(); // Hide all others
				$target.slideDown();
			}
			
			// Update opener styles
			$openers.css({
				'cursor': 'pointer',
				'background-color': ''
			});
		});
		
		return {
			showAll: function() {
				$elements.slideDown();
			},
			hideAll: function() {
				$elements.slideUp();
			}
		};
	}

	accordion = createAccordion(opener, element, container);
	accordion.hideAll();
}

function ScrollRcon()
{
	const objDiv = document.getElementById('rcon');
	objDiv.scrollTop = objDiv.scrollHeight;
	// alert(objDiv.scrollTop);
}

function Shrink(id, time, height)
{
	$(`#${id}`).animate({ height: height }, time);
}

function FadeElOut(id, time)
{
	$(`#${id}`).fadeOut(time, function() {
		$(this).css('opacity', 0);
	});
}

function FadeElIn(id, time)
{
	$(`#${id}`).show().css('opacity', 0).animate({ opacity: 1 }, time, function() {
		$(this).css('opacity', 1);
	});
}

function DoLogin(redir='')
{
	let err = 0;
	
	// Get input values
	let username = $('#loginUsername').val();
	let password = $('#loginPassword').val();
	let remember = $('#loginRememberMe').prop('checked');
	
	if (!username) err++; // Validate username
	if (!password) err++; // Validate password
	
	if (err)
		return false;

	// If redir is not provided or is 'undefined', set it to an empty string
	if (typeof redir === 'undefined')
		redir = '';
	
	// Call xajax_Plogin function
	xajax_Plogin(username, password, remember, redir);
}

function SlideUp(id)
{
	$(`#${id}`).slideUp(function() {
		$(this).remove();
	});
}

function RemoveGroup(id, name, type)
{
	const noPerm = confirm(`Are you sure you want to delete the group: '<mark>${name}</mark>'?`);
	if(noPerm == false)
	{
		return;
	}
	xajax_RemoveGroup(id, type);
}

function RemoveAdmin(id, name)
{
	const noPerm = confirm(`Are you sure you want to delete '<mark>${name}</mark>'?`);
	if(noPerm == false)
	{
		return;
	}
	xajax_RemoveAdmin(id);
}

function RemoveSubmission(id, name, archiv)
{
	if(archiv == '2') {
		var noPerm = confirm(`Are you sure you want to restore the ban submission for '<mark>${name}</mark>' from the archive?`);
	} else if(archiv == '1') {
		var noPerm = confirm(`Are you sure you want to move the ban submission for '<mark>${name}</mark>' to the archive?`);
	} else {
		var noPerm = confirm(`Are you sure you want to delete the ban submission for '<mark>${name}</mark>'?`);
	}
	if(noPerm == false)
		return;

	xajax_RemoveSubmission(id, archiv);
}

function RemoveProtest(id, name, archiv)
{
	if(archiv == '2') {
		var noPerm = confirm(`Are you sure you want to restore the ban protest for '<mark>${name}</mark>' from the archive?`);
	} else if(archiv == '1') {
		var noPerm = confirm(`Are you sure you want to move the ban protest for '<mark>${name}</mark>' to the archive?`);
	} else {
		var noPerm = confirm(`Are you sure you want to delete the ban protest for '<mark>${name}</mark>'?`);
	}
	if(noPerm == false)
	{
		return;
	}
	xajax_RemoveProtest(id, archiv);
}

function RemoveServer(id, name)
{
	const noPerm = confirm(`Are you sure you want to delete the server: '<mark>${name}</mark>'?`);
	if(noPerm == false)
	{
		return;
	}
	xajax_RemoveServer(id);
}

function RemoveBan(id, key, page, name, confirm, bulk)
{
	if(confirm == 0) {
		MsgBox('Delete Ban', `Are you sure you want to delete the ban${bulk == 'true' ? 's' : ''} for ${bulk == 'true' ? 'those players' : `\'<mark>${name}</mark>\'`}?`, 'question-danger', `<button type="button" onclick="RemoveBan('${id}', '${key}', '${page}', '${addslashes(name.replace(/\'/g, '\\\''))}', '1'${bulk == 'true' ? ", \'true\'" : ''});" name="rban" class="btn btn-danger" id="rban">Remove Ban</button><button type="button" onclick="closeMsg();$('#bulk_action').val(-1);" name="astop" class="btn" id="astop">Cancel</button>`);
	} else if(confirm == 1) {
		if(page != '')
			var pagelink = page;
		else
			var pagelink = '';
		window.location = `/banlist?${pagelink}&a=delete&id=${id}&key=${key}${bulk == 'true' ? '&bulk=true' : ''}`;
	}
}

function UnbanBan(id, key, page, name, popup, bulk) {
	if(popup == 1) {
		MsgBox('Unban Reason', `<b>Please give a short comment, why you are going to unban ${bulk == 'true' ? 'those players' : `\'<mark>${name}</mark>\'`}!</b><br><textarea class="form-control" placeholder="Type something…" name="ureason" id="ureason"></textarea><br><div id="ureason.msg" class="badentry"></div>`, 'question-warning', `<button type="button" onclick="UnbanBan('${id}', '${key}', '${page}', '${addslashes(name.replace(/\'/g, '\\\''))}', '0'${bulk == 'true' ? ", \'true\'" : ''});" name="uban" class="btn btn-warning" id="uban">Unban Ban</button><button type="button" onclick="closeMsg();$('#bulk_action').val(-1);" name="astop" class="btn" id="astop">Cancel</button>`);
	} else if(popup == 0) {
		if(page != '')
			var pagelink = page;
		else
			var pagelink = '';
		reason = $('#ureason').val();
		if(reason == '') {
			$('#ureason\\.msg').html('Please leave a comment.').show();
			return;
		}
		$('#ureason\\.msg').html('').hide();

		window.location = `/banlist?${pagelink}&a=unban&id=${id}&key=${key}&ureason=${reason}${bulk == 'true' ? '&bulk=true' : ''}`;
	}
}

function BoxToSrvMask()
{
	let string = '';
	if(document.getElementById('s1'))
	{
		if($('#s1').is(':checked'))
			string += 'a';
		if($('#s23').is(':checked'))
			string += 'b';
		if($('#s2').is(':checked'))
			string += 'c';
		if($('#s3').is(':checked'))
			string += 'd';
		if($('#s4').is(':checked'))
			string += 'e';
		if($('#s5').is(':checked'))
			string += 'f';
		if($('#s6').is(':checked'))
			string += 'g';
		if($('#s7').is(':checked'))
			string += 'h';
		if($('#s8').is(':checked'))
			string += 'i';
		if($('#s9').is(':checked'))
			string += 'j';
		if($('#s10').is(':checked'))
			string += 'k';
		if($('#s11').is(':checked'))
			string += 'l';
		if($('#s12').is(':checked'))
			string += 'm';
		if($('#s13').is(':checked'))
			string += 'n';
		if($('#s17').is(':checked'))
			string += 'o';
		if($('#s18').is(':checked'))
			string += 'p';
		if($('#s19').is(':checked'))
			string += 'q';
		if($('#s20').is(':checked'))
			string += 'r';
		if($('#s21').is(':checked'))
			string += 's';
		if($('#s22').is(':checked'))
			string += 't';
		if($('#s14').is(':checked'))
			string += 'z';
		if($('#immunity').val())
			string += `#${$('#immunity').val()}`;
	}
	return string;
}

function BoxToMask()
{
	let Mask = 0;
	if(document.getElementById('p4'))
	{
		if($('#p4').is(':checked'))
			Mask |= ADMIN_LIST_ADMINS;
		if($('#p5').is(':checked'))
			Mask |= ADMIN_ADD_ADMINS;
		if($('#p6').is(':checked'))
			Mask |= ADMIN_EDIT_ADMINS;
		if($('#p7').is(':checked'))
			Mask |= ADMIN_DELETE_ADMINS;

		if($('#p9').is(':checked'))
			Mask |= ADMIN_LIST_SERVERS;
		if($('#p10').is(':checked'))
			Mask |= ADMIN_ADD_SERVER;
		if($('#p11').is(':checked'))
			Mask |= ADMIN_EDIT_SERVERS;
		if($('#p12').is(':checked'))
			Mask |= ADMIN_DELETE_SERVERS;

		if($('#p14').is(':checked'))
			Mask |= ADMIN_ADD_BAN;
		if($('#p16').is(':checked'))
			Mask |= ADMIN_EDIT_OWN_BANS;
		if($('#p17').is(':checked'))
			Mask |= ADMIN_EDIT_GROUP_BANS;
		if($('#p18').is(':checked'))
			Mask |= ADMIN_EDIT_ALL_BANS;
		if($('#p19').is(':checked'))
			Mask |= ADMIN_BAN_PROTESTS;
		if($('#p20').is(':checked'))
			Mask |= ADMIN_BAN_SUBMISSIONS;
		if($('#p38').is(':checked'))
			Mask |= ADMIN_UNBAN_OWN_BANS;
		if($('#p39').is(':checked'))
			Mask |= ADMIN_UNBAN_GROUP_BANS;
		if($('#p32').is(':checked'))
			Mask |= ADMIN_UNBAN;
		if($('#p33').is(':checked'))
			Mask |= ADMIN_DELETE_BAN;
		if($('#p34').is(':checked'))
			Mask |= ADMIN_BAN_IMPORT;

		if($('#p36').is(':checked'))
			Mask |= ADMIN_NOTIFY_SUB;
		if($('#p37').is(':checked'))
			Mask |= ADMIN_NOTIFY_PROTEST;

		if($('#p22').is(':checked'))
			Mask |= ADMIN_LIST_GROUPS;
		if($('#p23').is(':checked'))
			Mask |= ADMIN_ADD_GROUP;
		if($('#p24').is(':checked'))
			Mask |= ADMIN_EDIT_GROUPS;
		if($('#p25').is(':checked'))
			Mask |= ADMIN_DELETE_GROUPS;

		if($('#p26').is(':checked'))
			Mask |= ADMIN_WEB_SETTINGS;

		if($('#p28').is(':checked'))
			Mask |= ADMIN_LIST_MODS;
		if($('#p29').is(':checked'))
			Mask |= ADMIN_ADD_MODS;
		if($('#p30').is(':checked'))
			Mask |= ADMIN_EDIT_MODS;
		if($('#p31').is(':checked'))
			Mask |= ADMIN_DELETE_MODS;

		if($('#p2').is(':checked'))
			Mask |= ADMIN_OWNER;
	}
	return Mask;
}

function UpdateCheckBox(tgl, start, stop)
{
	for (let i = start; i <= stop; i++)
	{
		if($(`#p${i}`).length)
		{
			if($(`#p${tgl}`).is(':checked'))
				$(`#p${i}`).prop('checked', true);
			else
				$(`#p${i}`).prop('checked', false);
		}
	}

	// Other Arguments is individual items not available in the range
	if(arguments.length > 3)
	{
		for (let lp = 4; lp <= arguments.length; lp++)
		{
			if($(`#p${arguments[lp - 1]}`).length)
			{
				$(`#p${arguments[lp - 1]}`).prop('checked', $(`#p${tgl}`).is(':checked'));
			}
		}
	}
}

function ProcessGroup()
{
	const Mask = BoxToMask();
	const Smask = BoxToSrvMask();
	xajax_AddGroup($('#groupname').val(), $('#grouptype').val(), Mask, Smask);
}

function update_web()
{
	$('#webperm').html('');

	if($('#webg').val() == 'c' || $('#webg').val() == 'n') {
		$('#web\\.msg').html('Please Wait...').show();
	}

	if($('#webg').val() == 'c')
		var height = 390;
	else if($('#webg').val() == 'n')
		var height = 410;
	else {
		$('#webperm').html('');
		var height = 1;
	}
	Shrink('webperm', 1000, height);

	if($('#webg').val() == 'c' || $('#webg').val() == 'n')
		setTimeout(function() { xajax_UpdateAdminPermissions(1, $('#webg').val()); }, 1000);
	else {
		$('#web\\.msg').html('').hide();
	}
}

function update_server_groups() {
	$('#nsgroup').html('');

	if($('#serverg').val() == 'n') {
		$('#group\\.msg').html('Please Wait...').show();
		var height = 50;
		Shrink('nsgroup', 500, height);
		setTimeout(function() { xajax_AddServerGroupName(); }, 500);
	} else {
		height = 5;
		Shrink('nsgroup', 500, height);
		$('#group\\.msg').html('').hide();
	}
}

function ProcessAddAdmin() {
	let Mask = BoxToMask();
	let srvMask = BoxToSrvMask();
	let server_a_pass = '-1';

	var el = $('input[name="group[]"]');
	let grp = '';
	el.each(function() {
		if($(this).is(':checked')) {
			grp = `${grp},${$(this).val()}`;
		}
	});

	var el = $('input[name="servers[]"]');
	let svr = '';
	el.each(function() {
		if($(this).is(':checked')) {
			svr = `${svr},${$(this).val()}`;
		}
	});

	const serverg = $('#serverg').val();
	if(serverg == '-3') {
		// serverg = "c";
		srvMask = '';
	}
	const webg = $('#webg').val();
	if(webg == '-3') {
		// webg = "c";
		Mask = 0;
	}

	if($('#a_useserverpass').is(':checked'))
		server_a_pass = $('#a_serverpass').val();

	if($('#webname').length && !$('#servername').length)
	xajax_AddAdmin(Mask,srvMask, $('#adminname').val(), //Admin name
					$('#steam').val(), //Admin Steam
					$('#email').val(), // Email
					$('#password').val(),//passwrds
					$('#password2').val(),
					serverg, //servergroup
					webg,
					server_a_pass,
					$('#webname').val(),
					0,
					grp,
					svr); //server / server group
	else if(!$('#webname').length && $('#servername').length)
	xajax_AddAdmin(Mask,srvMask, $('#adminname').val(), //Admin name
					$('#steam').val(), //Admin Steam
					$('#email').val(), // Email
					$('#password').val(),//passwrds
					$('#password2').val(),
					serverg, //servergroup
					webg,
					server_a_pass,
					0,
					$('#servername').val(),
					grp,
					svr);
	else if($('#webname').length && $('#servername').length)
	xajax_AddAdmin(Mask,srvMask, $('#adminname').val(), //Admin name
					$('#steam').val(), //Admin Steam
					$('#email').val(), // Email
					$('#password').val(),//passwrds
					$('#password2').val(),
					serverg, //servergroup
					webg,
					server_a_pass,
					$('#webname').val(),
					$('#servername').val(),
					grp,
					svr);
	else
	xajax_AddAdmin(Mask,srvMask, $('#adminname').val(), //Admin name
					$('#steam').val(), //Admin Steam
					$('#email').val(), // Email
					$('#password').val(),//passwrds
					$('#password2').val(),
					serverg, //servergroup
					webg,
					server_a_pass,
					0,
					0,
					grp,
					svr);
}

function ProcessEditAdminPermissions()
{
	const Mask = BoxToMask();
	const srvMask = BoxToSrvMask();
	const aid = $('#admin_id').val();

	if($('#immunity').length)
	{
	 	if(IsNumeric($('#immunity').val()))
			xajax_EditAdminPerms(aid, Mask, srvMask);
		else
			MsgBox('Error', 'Immunity must be a numerical value (0-9)', 'error');
	} else
		xajax_EditAdminPerms(aid, Mask, srvMask);
}

function ProcessEditGroup(type, name)
{
	const Mask = BoxToMask();
	const srvMask = BoxToSrvMask();
	const group = $('#group_id').val();

	if(name == '')
	{
		MsgBox('Error', 'You have to type a name for the group.', 'error');
		$('#groupname\\.msg').html('You have to type a name for the group.').show();
		return;
	}

	$('#groupname\\.msg').html('').hide();

	if($('#immunity').length && !IsNumeric($('#immunity').val()))
	{
		MsgBox('Error', 'Immunity must be a numerical value (0-9)', 'error');
		return;
	}

	let overrides = [];
	let new_override = {};

	// Handle group overrides
	if(type == 'srv')
	{
		let override_id = document.group_overrides_form.elements['override_id[]'];
		// Are there any old overrides to change?
		if(override_id != null)
		{
			let override_type = document.group_overrides_form.elements['override_type[]'];
			let override_name = document.group_overrides_form.elements['override_name[]'];
			let override_access = document.group_overrides_form.elements['override_access[]'];

			// Make sure they're arrays!
			if($type(override_id) == 'element')
				override_id = [override_id];
			if($type(override_type) == 'element')
				override_type = [override_type];
			if($type(override_name) == 'element')
				override_name = [override_name];
			if($type(override_access) == 'element')
				override_access = [override_access];

			overrides = {};

			for (let i = 0; i < override_id.length; i++)
			{
				overrides[i] = { id: override_id[i].value, type: override_type[i][override_type[i].selectedIndex].value, name: override_name[i].value, access: override_access[i][override_access[i].selectedIndex].value};
			}
		}

		new_override = { type: $('#new_override_type').val(), name: $('#new_override_name').val(), access: $('#new_override_access').val() };
	}

	xajax_EditGroup(group, Mask, srvMask, type, name, JSON.stringify(overrides), JSON.stringify(new_override));
}

function update_server()
{
	$('#serverperm').html('');

	if($('#serverg').val() == 'c' || $('#serverg').val() == 'n') {
		$('#server\\.msg').html('Please Wait...').show();
	}

	if($('#serverg').val() == 'c')
		var height = 580;
	else if($('#serverg').val() == 'n')
		var height = 590;
	else {
		$('#serverperm').html('');
		var height = 1;
	}
	Shrink('serverperm', 1000, height);

	if($('#serverg').val() == 'c' || $('#serverg').val() == 'n')
		setTimeout(function() { xajax_UpdateAdminPermissions(2, $('#serverg').val()); }, 1000);
	else {
		$('#server\\.msg').html('').hide();
	}
}

function process_add_server()
{
	const el = $('input[name="groups[]"]');
	let grp = '';
	el.each(function() {
		if($(this).is(':checked')) {
			grp = `${grp},${$(this).val()}`;
		}
	});
	xajax_AddServer($('#address').val(),
				$('#port').val(),
				$('#rcon').val(),
				$('#rcon2').val(),
				$('#mod').val(),
				$('#enabled').is(':checked'),
				grp,
				-1);
}

function process_edit_server()
{
	if($('#rcon').val() != $('#rcon2').val())
	{
		$('#rcon2\\.msg').html('Passwords don\'t match.').show();
		return;
	}

	$('#rcon2\\.msg').hide();
	document.forms.editserver.submit();
}

function search_bans()
{
	let type = '';
	let input = '';
	if($('#name').is(':checked'))
	{
		type = 'name';
		input = $('#nick').val();
	}
	if($('#steam_').is(':checked'))
	{
		type = ($('#steam_match').val() == '1' ? 'steam' : 'steamid');
		input = $('#steamid').val();
	}
	if($('#ip_').is(':checked'))
	{
		type = 'ip';
		input = $('#ip').val();
	}
	if($('#reason_').is(':checked'))
	{
		type = 'reason';
		input = $('#ban_reason').val();
	}
	if($('#date').is(':checked'))
	{
		type = 'date';
		input = `${$('#day').val()},${$('#month').val()},${$('#year').val()}`;
	}
	if($('#length_').is(':checked'))
	{
		type = 'length';
		if($('#length').val() == 'other')
			var length = $('#other_length').val();
		else
			var length = $('#length').val();
		input = `${$('#length_type').val()},${length}`;
	}
	if($('#ban_type_').is(':checked'))
	{
		type = 'btype';
		input = $('#ban_type').val();
	}
	if($('#bancount').is(':checked'))
	{
		type = 'bancount';
		input = $('#timesbanned').val();
	}
	if($('#admin').is(':checked'))
	{
		type = 'admin';
		input = $('#ban_admin').val();
	}
	if($('#where_banned').is(':checked'))
	{
		type = 'where_banned';
		input = $('#server').val();
	}
	if($('#comment_').is(':checked'))
	{
		type = 'comment';
		input = $('#ban_comment').val();
	}
	if(type != '' && input != '') window.location = `/banlist?advSearch=${input}&advType=${type}`;
}

const webSelected = new Array();
const srvSelected = new Array();
function getMultiple(ob, type) {
	if(type == 1) {
		while (ob.selectedIndex != -1)
		{
			webSelected.push(ob.options[ob.selectedIndex].value);
			ob.options[ob.selectedIndex].selected = false;
		}
	}
	if(type == 2) {
		while (ob.selectedIndex != -1)
		{
			srvSelected.push(ob.options[ob.selectedIndex].value);
			ob.options[ob.selectedIndex].selected = false;
		}
	}
}
function search_admins()
{
	let type = '';
	let input = '';
	if($('#name_').is(':checked'))
	{
		type = 'name';
		input = $('#nick').val();
	}
	if($('#steam_').is(':checked'))
	{
		type = ($('#steam_match').val() == '1' ? 'steam' : 'steamid');
		input = $('#steamid').val();
	}
	if($('#admemail_').is(':checked'))
	{
		type = 'admemail';
		input = $('#admemail').val();
	}
	if($('#webgroup_').is(':checked'))
	{
		type = 'webgroup';
		input = $('#webgroup').val();
	}
	if($('#srvadmgroup_').is(':checked'))
	{
		type = 'srvadmgroup';
		input = $('#srvadmgroup').val();
	}
	if($('#srvgroup_').is(':checked'))
	{
		type = 'srvgroup';
		input = $('#srvgroup').val();
	}
	if($('#admwebflags_').is(':checked'))
	{
		type = 'admwebflag';
		input = webSelected.toString();
	}
	if($('#admsrvflags_').is(':checked'))
	{
		type = 'admsrvflag';
		input = srvSelected.toString();
	}
	if($('#admin_on_').is(':checked'))
	{
		type = 'server';
		input = $('#server').val();
	}
	if(type != '' && input != '')
		window.location = `/admin?c=admins&advSearch=${input}&advType=${type}`;
}

function search_log()
{
	let type = '';
	let input = '';
	if($('#admin_').is(':checked'))
	{
		type = 'admin';
		input = $('#admin').val();
	}
	if($('#message_').is(':checked'))
	{
		type = 'message';
		input = $('#message').val();
	}
	if($('#date_').is(':checked'))
	{
		type = 'date';
		input = `${$('#day').val()},${$('#month').val()},${$('#year').val()},${$('#fhour').val()},${$('#fminute').val()},${$('#thour').val()},${$('#tminute').val()}`;
	}
	if($('#type_').is(':checked'))
	{
		type = 'type';
		input = $('#type').val();
	}
	if(type != '' && input != '')
		window.location = `/admin?c=settings&advSearch=${input}&advType=${type}#^2`;
}

let icname = '';
function icon(name)
{
	$('#icon\\.msg').html(`Uploaded: <b><mark>${name}</mark></b>`);
	icname = name;
	if($('#icon_hid').length)
		$('#icon_hid').val(name);
}

function ProcessMod()
{
	let err = 0;
	if(!$('#name').val()) {
		$('#name\\.msg').html('You must enter the name of the mod you are adding.').show();
		err++;
	} else {
		$('#name\\.msg').html('').hide();
	}

	if(!$('#folder').val()) {
		$('#folder\\.msg').html('You must enter mod\'s folder name.').show();
		err++;
	} else {
		$('#folder\\.msg').html('').hide();
	}

	if(err)
		return 0;

	xajax_AddMod($('#name').val(),
				 $('#folder').val(),
				 icname,
				 $('#steam_universe').val(),
				 $('#enabled').is(':checked'));
}
function MsgBox(title, msg, type, controls='<button type="button" class="btn" data-bs-dismiss="modal">OK</button>') {
	$(document).ready(function() {
		$('#dialogModal').modal({backdrop: 'static', keyboard: false});
		// Ensure dialog is hidden initially
		$('#dialogModal').modal('hide');
		let color = '';
		let icon = '';

		switch (type) {
			case 'red':
			case 'danger':
			case 'error':
				color = 'danger';
				icon = 'fas fa-circle-xmark';
				break;
			case 'yellow':
			case 'warning':
			case 'exclamation':
				color = 'warning';
				icon = 'fas fa-circle-exclamation';
				break;
			case 'green':
			case 'success':
				color = 'success';
				icon = 'fas fa-circle-check';
				break;
			case 'question':
				color = 'primary';
				icon = 'fas fa-circle-question';
				break;
			case 'question-warning':
				color = 'warning';
				icon = 'fas fa-circle-question';
				break;
			case 'question-danger':
				color = 'danger';
				icon = 'fas fa-circle-question';
				break;
			case 'wait':
				color = 'primary';
				icon = 'fas fa-spinner fa-spin-pulse';
				break;
			case 'blue':
			case 'info':
			default:
				color = 'info';
				icon = 'fas fa-circle-info';
				break;
		}

		// $('#dialog-status').removeClass('bg-danger bg-info bg-success').addClass(`bg-${color}`);
		$('#dialog-icon').html(`<i class="icon icon-lg text-${color} ${icon} mb-2"></i>`);
		$('#dialog-title').html(title);
		$('#dialog-content-text').html(msg);
		$('#dialogModal').modal('show');

		if (controls == false) {
			$('#dialog-control').parent().hide();
		} else {
			$('#dialog-control').parent().show();
			$('#dialog-control').html(controls);
		}
	});
}
function ShowBox(title, msg, type, redir='', noclose, controls='')
{
	$(document).ready(function() {
		$('#dialogModal').modal({backdrop: 'static', keyboard: false});
		// Ensure dialog is hidden initially
		$('#dialogModal').modal('hide');
		let color = '';
		let icon = '';

		switch (type) {
			case 'red':
			case 'danger':
				color = 'danger';
				icon = 'fas fa-circle-xmark';
				break;
			case 'yellow':
			case 'warning':
				color = 'warning';
				icon = 'fas fa-circle-exclamation';
				break;
			case 'green':
			case 'success':
				color = 'success';
				icon = 'fas fa-circle-check';
				break;
			case 'blue':
			case 'info':
			default:
				color = 'info';
				icon = 'fas fa-circle-info';
				break;
		}

		// $('#dialog-status').removeClass('bg-danger bg-info bg-success').addClass(`bg-${color}`);
		$('#dialog-icon').html(`<i class="icon icon-lg text-${color} ${icon} mb-2"></i>`);
		$('#dialog-title').html(title);
		$('#dialog-content-text').html(msg);
		$('#dialogModal').modal('show');

		const jsCde = `closeMsg('${redir}');`;
		if (controls == false) {
			$('#dialog-control').parent().hide();
		} else {
			$('#dialog-control').parent().show();
			if (controls == '') controls = `<button type="button" class="btn btn-primary me-auto" onclick="${jsCde}" id="dialog-close">Close</button>`;
			$('#dialog-control').html(controls);
		}

		if (!noclose) {
			if (redir) setTimeout(function() { window.location = redir; }, 5000);
			else setTimeout(function() { $('#dialogModal').modal('hide'); }, 5000);
		}
	});
}
function closeMsg(redir='') {
	if (redir.toString().length > 0 && redir != 'undefined') {
		window.location = redir;
	} else {
		$('#dialogModal').modal('hide');
	}
}

function TabToReload() {
	const url = window.location.toString();
	const nurl = url.replace(`#^${url[url.length - 1]}`, '');

	window.setTimeout(() => {
		window.location.href = nurl;
	}, 2000);
}

function CheckEmail(type, id) {
	let err = 0;
	if($('#subject').val() == '') {
		$('#subject\\.msg').html('You must type a subject for the email.').show();
		err++;
	} else {
		$('#subject\\.msg').html('').hide();
	}

	if($('#message').val() == '') {
		$('#message\\.msg').html('You must type a message for the email.').show();
		err++;
	} else {
		$('#message\\.msg').html('').hide();
	}

	if(err > 0)
		return;
	xajax_SendMail($('#subject').val(), $('#message').val(), type, id);
}

function IsNumeric(sText)
{
	const ValidChars = '0123456789.';
	let IsNumber = true;
	let Char;

	for (i = 0; i < sText.length && IsNumber == true; i++) {
		Char = sText.charAt(i);
			if(ValidChars.indexOf(Char) == -1) {
			IsNumber = false;
		 	}
		}
	return IsNumber;
}

function ClearLogs()
{
	const noPerm = confirm('Are you sure you want to delete all of the log entries?');
	if(noPerm == false) {
		return;
	}
	window.location = '/admin?c=settings&log_clear=true#^2';
}

function RemoveMod(name, id)
{
	const noPerm = confirm(`Are you sure you want to delete '<mark>${name}</mark>'?`);
	if(noPerm == false) return;
	xajax_RemoveMod(id);
}

function UpdateGroupPermissionCheckBoxes()
{
	$('#perms').html('');
	if($('#grouptype').val() != 3 && $('#grouptype').val() != 0) {
		$('#type\\.msg').html('Please Wait...').show();
	}
	if($('#grouptype').val() == 1)
	{
		var height = 285;
	} else if($('#grouptype').val() == 2)
	{
		var height = 435;
	} else
	{
		$('#type\\.msg').hide();
		var height = 2;
	}
	Shrink('perms', 1000, height);
	if($('#grouptype').val() != 3 && $('#grouptype').val() != 0)
		setTimeout(function() { xajax_UpdateGroupPermissions($('#grouptype').val()); }, 1000);
}

function changePage(newPage, type, advSearch, advType)
{
	nextPage = newPage.options[newPage.selectedIndex].value;
	if(advSearch != '' && advType != '') {
		var searchlink = `advSearch=${advSearch}&advType=${advType}`;
	} else {
		var searchlink = '';
	}
	 if(nextPage != 0)
	{
		if(type == 'A')
			window.location = `/admin?c=admins&${searchlink}&page=${nextPage}`;
		if(type == 'B')
			window.location = `/banlist?${searchlink}&page=${nextPage}`;
		if(type == 'C')
			window.location = `/commslist?${searchlink}&page=${nextPage}`;
		if(type == 'L')
			window.location = `/admin?c=settings&${searchlink}&page=${nextPage}#^2`;
		if(type == 'P')
			window.location = `/admin?c=bans&ppage=${nextPage}#^1`;
		if(type == 'PA')
			window.location = `/admin?c=bans&papage=${nextPage}#^1~p1`;
		if(type == 'S')
			window.location = `/admin?c=bans&spage=${nextPage}#^2`;
		if(type == 'SA')
			window.location = `/admin?c=bans&sapage=${nextPage}#^2~s1`;
	 }
}

function ShowKickBox(check, type)
{
	ShowBox('Ban Added', `The ban has been successfully added<br><iframe id="srvkicker" frameborder="0" width="100%" src="/pages/admin.kickit.php?check=${check}&type=${type}"></iframe>`, 'green', '/admin?c=bans', true);
}

function ShowRehashBox(servers, title, msg, color, redir)
{
	// Don't show anything sm_rehash related, if there are no servers to rcon.
	if(servers == '')
	{
		ShowBox(title, msg, color, redir, true);
		return;
	}
	msg = `${msg}<br /><hr /><i>Rehashing Admin and Group data on all related servers...</i><div id="rehashDiv" name="rehashDiv" width="100%"></div>`;
	ShowBox(title, msg, color, redir, true);
	xajax_RehashAdmins(servers);
}

function ProcessComment()
{
	let err = 0;
	if($('#commenttext').val() == '')
	{
		$('#commenttext\\.msg').html('You have to type your comment').show();
		err++;
	}else
	{
		$('#commenttext\\.msg').html('').hide();
		err = 0;
	}

	if(err)
		return 0;

	if($('#cid').val() == -1)
	{
		xajax_AddComment($('#bid').val(),
					 $('#ctype').val(),
					 $('#commenttext').val(),
					 $('#page').val());
	}
	else
	{
		xajax_EditComment($('#cid').val(),
					 $('#ctype').val(),
					 $('#commenttext').val(),
					 $('#page').val());
	}
}

function RemoveComment(cid, type, page)
{
	const checkUp = confirm('Are you sure you want to delete the comment?');
	if(checkUp == false)
		return;
	xajax_RemoveComment(cid, type, page);
}

function TickSelectAll()
{
	for (let i = 0; $(`#chkb_${i}`).length; i++)
	{
		if($('#tickswitch').val() == 0)
			$(`#chkb_${i}`).prop('checked', true);
		else
			$(`#chkb_${i}`).prop('checked', false);
	}
	if($('#tickswitch').val() == 0)
	{
		$('#tickswitch').val(1);
		$('#tickswitch').attr('title', 'Deselect All');
		$('#tickswitchlink').attr('title', 'Deselect All').html('Deselect All');
	} else {
		$('#tickswitch').val(0);
		$('#tickswitch').attr('title', 'Select All');
		$('#tickswitchlink').attr('title', 'Select All').html('Select All');
	}
}

function BulkEdit(action, bankey)
{
	option = action.options[action.selectedIndex].value;
	ids = new Array();
	for (let i = 0; $(`#chkb_${i}`).length; i++)
	{
		if($(`#chkb_${i}`).is(':checked'))
			ids.push($(`#chkb_${i}`).val());
	}
	switch (option) {
		case 'U':
			UnbanBan(ids, bankey, '', 'Bulk Unban', '1', 'true');
			break;
		case 'D':
			RemoveBan(ids, bankey, '', 'Bulk Delete', '0', 'true');
			break;
	}
}

function BanFriendsProcess(fid, name)
{
	const checkUp = confirm(`Are you sure you want to ban all steam community friends of '<mark>${name}</mark>'?`);
	if(checkUp == false)
		return;
	MsgBox(`Banning friends of <mark>${name}</mark>`, `Banning all steam community friends of '<mark>${name}</mark>'.<br />Please wait...<br />This can last very long, depending on the amount of friends.`, 'wait', false);
	xajax_BanFriends(fid, name);
}

function OpenMessageBox(sid, name, popup) {
	if(popup == 1) {
		MsgBox('Send Message', `<b>Please type the message you want to send to <br>'<mark>${name}</mark>'.</b><br>You need to have basechat.smx enabled as we use<br><i>&lt;sm_psay&gt;</i>.<br><textarea class="form-control" placeholder="Type something…" name="ingamemsg" id="ingamemsg"></textarea><br><div id="ingamemsg.msg" class="badentry"></div>`, 'question', `<button type="button" name="ingmsg" class="btn" id="ingmsg" onclick="OpenMessageBox(${sid}, '${name}', 0);">Send Message</button><button type="button" onclick="closeMsg();" name="astop" class="btn" id="astop">Cancel</button>`);
	} else if(popup == 0) {
		message = $('#ingamemsg').val();
		if(message == '') {
			$('#ingamemsg\\.msg').html('Please type your message.').show();
			return;
		}
		$('#ingamemsg\\.msg').html('').hide();

		$('#ingamemsg').prop('readOnly', true);
		xajax_SendMessage(sid, name, message);
	}
}

function KickPlayerConfirm(sid, name, conf) {
	if(conf == 0)	{
		MsgBox('Kick Player', `<b>Are you sure you want to kick player  <br>'<mark>${name}</mark>'?</b>`, 'question-warning', `<button type="button" name="kbutton" class="btn" id="kbutton" onclick="KickPlayerConfirm(${sid}, '${name}', 1);">Yes</button><button type="button" onclick="closeMsg();" name="astop" class="btn" id="astop">No</button>`);
	} else if(conf == 1) {
		xajax_KickPlayer(sid, name);
	}
}

function mapimg(filename)
{
	$('#mapimg\\.msg').html(`Uploaded: <b>${filename}</b>`);
}

function selectLengthTypeReason(length, type, reason)
{
	for (var i = 0; i <= $('#banlength option').length; i++) {
		if($('#banlength option').eq(i).val() == (length / 60)) {
			$('#banlength option').eq(i).prop('selected', true);
			break;
		}
	}
	$('#type option').eq(type).prop('selected', true);
	for (var i = 0; i <= $('#listReason option').length; i++)	{
		if($('#listReason option').eq(i).html() == reason) {
			$('#listReason option').eq(i).prop('selected', true);
			break;
		}
		if($('#listReason option').eq(i).val() == 'other') {
			$('#txtReason').val(reason);
			$('#dreason').show();
			$('#listReason option').eq(i).prop('selected', true);
			break;
		}
	}
}

function ViewCommunityProfile(sid, name)
{
	MsgBox('View Community Profile', `Generating Community Profile link for "<mark>${name}</mark>", please wait...`, 'wait', false);
	xajax_ViewCommunityProfile(sid, name);
}

// Thanks to http://phpjs.org/functions/addslashes:303
function addslashes(str)
{
	return (`${str}`).replace(/[\\"']/g, '\\$&').replace(/\u0000/g, '\\0');
}

function RemoveBlock(id, key, page, name, confirm)
{
	if(confirm == 0) {
		MsgBox('Delete Block', `Are you sure you want to delete the block for <mark>${name}</mark>?`, 'question-danger', `<button type="button" onclick="RemoveBlock('${id}', '${key}', '${page}', '${addslashes(name.replace(/\'/g, '\\\''))}', '1');" name="rban" class="btn btn-danger" id="rban">Remove Block</button><button type="button" onclick="closeMsg();$('#bulk_action').val(-1);" name="astop" class="btn" id="astop">Cancel</button>`);
	} else if(confirm == 1) {
		if(page != '')
			var pagelink = page;
		else
			var pagelink = '';
		window.location = `/commslist?${pagelink}&a=delete${pagelink}&id=${id}&key=${key}`;
	}
}

function UnGag(id, key, page, name, popup)
{
	if(popup == 1) {
		MsgBox('UnGag Reason', `${'<b>Please give a short comment, why you are going to ungag ' + "\'"}<mark>${name}</mark>\'` + '!</b><br><textarea class="form-control" placeholder="Type something…" name="ureason" id="ureason"></textarea><br><div id="ureason.msg" class="badentry"></div>', 'question-warning', `<button type="button" onclick="UnGag('${id}', '${key}', '${page}', '${addslashes(name.replace(/\'/g, '\\\''))}', '0');" name="uban" class="btn btn-danger" id="uban">UnGag Player</button><button type="button" onclick="closeMsg();" name="astop" class="btn" id="astop">Cancel</button>`);
	} else if(popup == 0) {
		if(page != '')
			var pagelink = page;
		else
			var pagelink = '';
		reason = $('#ureason').val();
		if(reason == '') {
			$('#ureason\\.msg').html('Please leave a comment.').show();
			return;
		}
		$('#ureason\\.msg').html('').hide();

		window.location = `/commslist?a=ungag&id=${id}&key=${key}&ureason=${reason}`;
	}
}

function UnMute(id, key, page, name, popup)
{
	if(popup == 1) {
		MsgBox('UnMute Reason', `${'<b>Please give a short comment, why you are going to unmute ' + "\'"}<mark>${name}</mark>\'` + '!</b><br><textarea class="form-control" placeholder="Type something…" name="ureason" id="ureason"></textarea><br><div id="ureason.msg" class="badentry"></div>', 'question-warning', `<button type="button" onclick="UnMute('${id}', '${key}', '${page}', '${addslashes(name.replace(/\'/g, '\\\''))}', '0');" name="uban" class="btn btn-danger" id="uban">UnMute Player</button><button type="button" onclick="closeMsg();" name="astop" class="btn" id="astop">Cancel</button>`);
	} else if(popup == 0) {
		if(page != '')
			var pagelink = page;
		else
			var pagelink = '';
		reason = $('#ureason').val();
		if(reason == '') {
			$('#ureason\\.msg').html('Please leave a comment.').show();
			return;
		}
		$('#ureason\\.msg').html('').hide();

		window.location = `/commslist?${pagelink}&a=unmute&id=${id}&key=${key}&ureason=${reason}`;
	}
}

function search_blocks()
{
	let type = '';
	let input = '';
	if($('#name').is(':checked'))
	{
		type = 'name';
		input = $('#nick').val();
	}
	if($('#steam_').is(':checked'))
	{
		type = ($('#steam_match').val() == '1' ? 'steam' : 'steamid');
		input = $('#steamid').val();
	}
	if($('#reason_').is(':checked'))
	{
		type = 'reason';
		input = $('#ban_reason').val();
	}
	if($('#date').is(':checked'))
	{
		type = 'date';
		input = `${$('#day').val()},${$('#month').val()},${$('#year').val()}`;
	}
	if($('#length_').is(':checked'))
	{
		type = 'length';
		if($('#length').val() == 'other')
			var length = $('#other_length').val();
		else
			var length = $('#length').val();
		input = `${$('#length_type').val()},${length}`;
	}
	if($('#ban_type_').is(':checked'))
	{
		type = 'btype';
		input = $('#ban_type').val();
	}
	if($('#bancount').is(':checked'))
	{
		type = 'bancount';
		input = $('#timesbanned').val();
	}
	if($('#admin').is(':checked'))
	{
		type = 'admin';
		input = $('#ban_admin').val();
	}
	if($('#where_banned').is(':checked'))
	{
		type = 'where_banned';
		input = $('#server').val();
	}
	if($('#comment_').is(':checked'))
	{
		type = 'comment';
		input = $('#ban_comment').val();
	}
	if(type != '' && input != '')
		window.location = `/commslist?advSearch=${input}&advType=${type}`;
}

function ShowBlockBox(check, type, length)
{
	ShowBox('Block Added', `The block has been successfully added<br><iframe id="srvkicker" frameborder="0" width="100%" src="/pages/admin.blockit.php?check=${check}&type=${type}&length=${length}"></iframe>`, 'green', '/admin?c=comms', true);
}

function openTab(event, target) {
	$('#admin-page-menu .nav-link').removeClass('active');

	$(event).addClass('active');

	$('.tabcontent').hide();
	$.each($('.tabcontent'), function() {
		if ($(this).attr('id') == target)
			$(this).show();
	});
}

function swapTab(tab) {
	const menu = document.getElementById('admin-page-menu').children;
	if(!isNaN(tab) && tab <= menu.length)
		menu[tab].click();
}
