<h3>Email Player  <i>({$email_addr})</i></h3>
<table width="90%" style="border-collapse:collapse;" id="group.details" cellpadding="3">
	<tr>
    	<td valign="top" width="35%">
    		<div class="rowdesc"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Type the subject of the email."><i class="fas fa-circle-question icon"></i></span>Subject </div>
    	</td>
    	
    <td><div align="left">
      <input type="text" TABINDEX=1 class="textbox" id="subject" name="subject" />
    </div><div id="subject.msg" class="badentry"></div></td>
  </tr>
  <tr>
    <td valign="top"><div class="rowdesc"><span class="text-info cursor-help me-1" data-bs-toggle="tooltip" data-bs-placement="right" title="Type your message here."><i class="fas fa-circle-question icon"></i></span>Message </div></td>
    <td><div align="left">
       <textarea class="textbox" TABINDEX=2 cols="35" rows="7" id="message" name="message"></textarea>
    </div><div id="message.msg" class="badentry"></div></td>
  </tr>
 	

 <tr>
    <td>&nbsp;</td>
		<td>
      		{sb_button text="Send Email" onclick="$email_js" class="ok" id="aemail" submit=false}
     		 &nbsp;
      		{sb_button text="Back" onclick="history.go(-1)" class="cancel" id="back" submit=false}
     	</td>
 	</tr>
</table>

