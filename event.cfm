<html>
<body bgcolor="#CCCCCC">
<h1><a href="index.cfm">Calender</a></h1>
<cfoutput>
<div align="center">
	<div align="center" style=" background-color:##FFFFFF;border:1px solid black; width:420px; height:300px">
		<table width="100%" cellspacing="0" class="dataform">
				<tr>
					<td colspan="3" align="center"><h3>Add / Update Events</h3></td>
				</tr>
				<tr>
					<td class="left">
						<label for="name">
							Name:
						</label>
					</td>
					<td class="right">
						<input type="text" id="name" name="name" value="" maxlength="100" class="large" /><br />				
					</td>
				</tr>
				<tr>
					<td class="left">
						<label for="date_started">
							Date:
						</label>
					</td>
					<td class="right">
						
						<table cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<input 
									type="text" 
									id="date_started" 
									name="date_started" 
									value="<cfif isDefined('URL.thisDate')>#URL.thisDate#</cfif>" 
									maxlength="10" 
									class="date" 
									/><br />
							</td>
						</tr>
						<tr class="fieldnote">
							<td>
								<em>(mm/dd/yyyy)</em><br />
							</td>
						</tr>
						</table>
						
					</td>
				</tr>
				<tr>
					<td class="left">
						<label for="time_started">
							Time:
						</label>
					</td>
					<td class="right">
						
						<label for="is_all_day">
							<input type="checkbox" id="is_all_day" name="is_all_day" value="1"
								onclick="if(this.checked==true){ document.getElementById('time_started').value = ''; document.getElementById('time_ended').value = ''; document.getElementById('time_started').disabled = true; document.getElementById('time_ended').disabled = true; } else{ document.getElementById('time_started').disabled = false; document.getElementById('time_ended').disabled = false; }"
								/>
							
							This Is An All Day Event
						</label>
										
						<table id="eventtimes" cellspacing="0" cellpadding="0" style="margin-top: 10px ;">
						<tr>
							<td>
								<input 
									type="text" 
									id="time_started" 
									name="time_started" 
									value="" 
									maxlength="8" 
									class="time"  /><br />
							</td>
							<td valign="top" rowspan="2">
								&nbsp;&nbsp;-to-&nbsp;&nbsp;<br />
							</td>
							<td>
								<input 
									type="text" 
									id="time_ended" 
									name="time_ended" 
									value="" 
									maxlength="8" 
									class="time" 
									/><br />
							</td>
						</tr>
						<tr class="fieldnote">
							<td>
								From <em>(h:mm AM/PM)</em><br />
							</td>
							<td>
								To <em>(h:mm AM/PM)</em><br />
							</td>
						</tr>
						</table>
						
					</td>
				</tr>
				<tr>
					<td class="left">
						<label for="description">
							Description:		
						</label>
					</td>
					<td class="right">
						<textarea name="description" id="description" class="description"></textarea><br />				
					</td>
				</tr>
				<tr>
					<td class="left">
						<br />
					</td>
					<td class="right">
						<input type="submit" value="Add  Event" /><br />
					</td>
				</tr>
			</table>
		</div>
	</div>
</cfoutput>
</body>
</html>