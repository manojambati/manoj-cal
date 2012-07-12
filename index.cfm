
<!---<cflocation url="index.cfm?action=calender" addtoken="no">--->

<cfparam name="URL.action" default="calender">

<cfif isDefined('URL.action') AND URL.action EQ 'calender'>
	<h1><a href="index.cfm?action=addEvent">event</a></h1>
	<cfinclude template="cal.cfm">
<cfelseif isDefined('URL.action') AND URL.action EQ 'addEvent'>
	<cfinclude template="event.cfm">
</cfif> 