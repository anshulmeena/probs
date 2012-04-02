<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Teaching Tools</title>
<script type="text/javascript" src="js/lib/prototype.js"></script>
<script type="text/javascript" src="js/src/scriptaculous.js?load=effects,controls"></script>
<script type="text/javascript" src="js/src/validation.js"></script>
<script type="text/javascript" src="js/function.js"></script>

<link rel="stylesheet" href="css/hclprobs.css"/>
<style type="text/css">
</style>
</head>
<jsp:useBean id="employeeInfo" class="org.hcl.employee.info.EmployeeInfo" scope="session" />
<%
HttpSession jSession = request.getSession();
List<String> items = (List<String>)jSession.getAttribute("items");
%>
<body>
<div class="header_div">
	<fieldset class="greenfieldset">
		<table style="width: 100%">
			<tr>
				<td style="text-align: left; width: 50%;">Date: <%=jSession.getAttribute("date") %></td>
				<td style="text-align: right; width: 50%;"><a href="logout.jsp">Logout</a></td>
			</tr>
			<tr>
				<td style="text-align: left; width: 50%;">Welcome: <%=employeeInfo.getEmployeeNameFirst() + " "
						+ employeeInfo.getEmployeeNameLast()%></td>
				<td style="text-align: right; width: 50%;">Items in chart: <span id="cartItem_count"><%=items.size()%> </span>&nbsp;</td>		
			</tr>
		</table>
	</fieldset>
</div>
<div class="clear"></div>
<div class="content">
	<fieldset class="greenfieldset">
	<form id="searchToolForm" action="search.jsp" method="get">
		<table border="0">
			<tr>
				<td class="field-label">Subject:</td>
				<td>
					<input type="text" id="searchsubject" name="subject" class="dexagogoinput"/>
					<div id="autosubject_div"  class="autocomplete"></div>
				</td>
				<td></td>
				<td class="field-label">Title:</td>
				<td colspan="4">
					<input type="text" id="searchtitle" name="title" class="dexagogoinputextra"/>
					<div id="autotitle_div" class="autocomplete"></div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td class="field-label">Type:</td>
				<td>
					<input type="text" id="searchtype" name="type" class="dexagogoinput"/>
					<div id="autotype_div" class="autocomplete" style=""></div>
				</td>
				<td></td>
				<td class="field-label">Branch:</td>
				<td>
					<input type="text" id="searchbranch" name="branch" class="dexagogoinput"/>
					<div id="autobranch_div" class="autocomplete" style=""></div>
				</td>
				<td></td>
				<td class="field-label">Age:</td>
				<td>
					<input type="text" id="searchage" name="age" class="dexagogoinput"/>
					<div id="autoage_div" class="autocomplete" style=""></div>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="Search" id="submit"/></td>
				<td><input type="button" value="Reset" onclick="$('searchToolForm').reset(); $('searchsubject').focus();" /></td>
				<td></td>
			</tr>
		</table>
	</form>
	<span id="search_result" class="search_result"></span>
	</fieldset>
</div>
<div class="footer_menu_div">
	<fieldset class="greenfieldset">
		<table>
			<tbody>
				<tr>
					<td id="view_cart">
						<a href="viewcart.jsp">View Cart</a>
					</td>
					<td>&nbsp;&nbsp;</td>
					<td>
						<a href="searchTools.jsp">Search Item</a>
					</td>
					<td>&nbsp;&nbsp;</td>
					<td>
					<a href="viewarchive.jsp">View Archive</a>
					</td>
				</tr>
			</tbody>
		</table>
	</fieldset>
</div>
<script type="text/javascript">
Event.observe(window, 'load', function() {
	$("searchsubject").focus();
});
new Ajax.Autocompleter("searchsubject", "autosubject_div", "searchToolAutocomplete.jsp?Action=su",{
	minChars: 1
});
new Ajax.Autocompleter("searchtitle", "autotitle_div", "searchToolAutocomplete.jsp?Action=ti",{
	minChars: 1
});
new Ajax.Autocompleter("searchtype", "autotype_div", "searchToolAutocomplete.jsp?Action=ty",{
	minChars: 1
});
new Ajax.Autocompleter("searchbranch", "autobranch_div", "searchToolAutocomplete.jsp?Action=br",{
	minChars: 1 
});
new Ajax.Autocompleter("searchage", "autoage_div", "searchToolAutocomplete.jsp?Action=ag",{
	minChars: 1
});
</script>
</body>
</html>