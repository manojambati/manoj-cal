<cfscript>

	function createCalendar(curMonth,curYear) {
		var outString = "";
		var firstDay = CreateDate(curYear, curMonth, 1);
		var firstDayDigit = DayOfWeek(FirstDay);
		var i = 1;
		var h = 1;
		var height = 70;
		var width = 100;
	
		if(arrayLen(arguments) gte 3) height = arguments[3];
		if(arrayLen(arguments) gte 4) width = arguments[4];	    
		
		outString = "<table border='0' cellpadding='5' cellspacing='3'><tr><td class='header'><a class='navmonth' href='index.cfm?action=calender&thisMonth=#month(dateadd('M',-1,firstDay))#&thisYear=#year(dateadd('Y',-1,firstDay))#'>Prev</a></td><td class='header' align=center colspan='5'  ";
		outString = outString & ">#DateFormat(firstDay, 'mmmm yyyy')#</td><td class='header'><a class='navmonth' href='index.cfm?action=calender&thisMonth=#month(dateadd('M',1,firstDay))#&thisYear=#year(dateadd('Y',1,firstDay))#'>Next</a></td></tr>";
		outString = outString & "<tr><td class='subheader'>Sun</td><td class='subheader'>Mon</td><td class='subheader'>Tue</td><td class='subheader'>Wed</td><td class='subheader'>Thu</td><td class='subheader'>Fri</td><td class='subheader'>Sat</td></tr>";
		
		// if it isn't sunday, then we need to if space over to start on the corrent day of week
		if (firstDayDigit neq 1) {
			for (h=1; h lt DayOfWeek(FirstDay); h = h+1) {
				outString = outString & "<td>&nbsp;</td>";
			}
		}
		
		// loop thru all the dates in this month
		for (i=1; i lte DaysInMonth(firstDay); i = i+1) {
			//is it Sunday? if so start new row.
			if (DayOfWeek(CreateDate(curYear, curMonth, i)) eq 1) {
				outString = outString & "<tr>";
			}
			// insert a day
			outString = outString & "<td align='left' valign='top' width='#width#px' ";
			if(CreateDate(curYear, curMonth, i) eq CreateDate(year(now()),month(now()),day(now()))){
				outString = outString & "class='day-current'";
			}else{
				outString = outString & "style='background-color: whitesmoke' ";
			}
			outString = outString & "height='#height#'><a href='index.cfm?action=addEvent&thisDate=#curMonth#/#i#/#curYear#'>#i#</a><br></td> ";
			
			// is it the last day of the month?  if so, fill row with blanks.
			if (i eq DaysInMonth(firstDay)) {
				for (h=1; h lte (7-DayOfWeek(CreateDate(curYear, curMonth, i))); h = h+1) {
					outString = outString & "<td>&nbsp;</td>";
				}
			}
			if (DayOfWeek(CreateDate(curYear, curMonth, i)) eq 7){
				outString = outString & "</tr>";
			}
		}
		outString=outString & "</table>";
		return outString;
	}
	
</cfscript>

<style type="text/css">
	body { font-family: sans-serif; font-size: 13px;}
	td { font-family: sans-serif; font-size: 13px; }
	a { color: #000000; }
	a.navmonth { color: #FFFFFF; font-weight: bold;}
	.day-current { background-color: #e1e1e1; }
	.day-event { background-color: #E1ECED; }
	.header { background-color: #717171; color: #FFFFFF; font-size: .95 em; font-weight: bold; text-align: center; }
	.subheader { background-color: #aaaaaa; color: #FFFFFF; font-weight: bold; text-align: center; }
</style>

<cfparam name="url.thisMonth" default="#month(now())#">
<cfparam name="url.thisYear" default="#year(now())#">

<cfoutput>#createCalendar(url.thisMonth,url.thisYear)#</cfoutput>

