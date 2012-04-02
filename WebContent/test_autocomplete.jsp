<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Teaching Tools</title>
<script type="text/javascript" src="js/lib/prototype.js"></script>
<script type="text/javascript" src="js/src/scriptaculous.js"></script>
<script type="text/javascript" src="js/src/effects.js"></script>
<script type="text/javascript" src="js/src/validation.js"></script>
<script type="text/javascript" src="js/function.js"></script>

<style type="text/css">
div.autocomplete {
	position:relative;
	background-color:white;
	border:1px solid #888;
	overflow: hidden;
	width:202px;
}
div.autocomplete ul {
  list-style-type:none;
  margin:0;
  padding:0;
}
div.autocomplete ul li.selected { 
	background-color: #CCFF99;
}
div.autocomplete ul li {
  list-style-type:none;
  display:block;
  margin:0;
  padding:2px;
  height:22px;
  cursor:pointer;
}
</style>
</head>
<jsp:useBean id="employeeInfo" class="org.hcl.employee.info.EmployeeInfo" scope="session" />
<%
Date date = new Date();
SimpleDateFormat dateForamt = new SimpleDateFormat("EEE MMM dd");
%>
<body>
					<input type="text" id="searchsubject" name="subject" class="required" autocomplete="off"/>
					<div id="autosubject_div"  class="autocomplete"></div>
<div class="header_div">
	<fieldset class="greenfieldset">
		<table style="width: 100%">
			<tr>
				<td style="text-align: left; width: 50%;">Date: <%= dateForamt.format(date) %></td>
				<td style="text-align: right; width: 50%;"><a href="logout.jsp">Logout</a></td>
			</tr>
			<tr><td>Name: <%= employeeInfo.getEmployeeNameFirst() +" "+employeeInfo.getEmployeeNameLast()%></td></tr>
		</table>
	</fieldset>
</div>

<div class="content">
	<fieldset class="greenfieldset">
	<form id="searchToolForm">
		<table>
			<tr>
				<td class="field-label">Subject:</td>
				<td>
					<input type="text" id="searchsubject" name="subject" class="required"/>
					<div id="autosubject_div"  class="autocomplete"></div>
				</td>
				<td></td>
				<td class="field-label">Title:</td>
				<td>
					<input type="text" id="searchtitle" name="title" class="required"/>
					<span id="indicator1" style="display: none">
					  <img src="images/spinner.gif" alt="Working..." />
					</span>
					<div id="autotitle_div" class="autocomplete" style=""></div>
				</td>
			</tr>
			<tr>
				<td class="field-label">Type:</td>
				<td>
					<input type="text" id="searchtype" name="type" class="required"/>
					<div id="autotype_div" class="autocomplete" style=""></div>
				</td>
				<td></td>
				<td class="field-label">Branch:</td>
				<td>
					<input type="text" id="searchbranch" name="branch" class="required"/>
					<div id="autobranch_div" class="autocomplete" style=""></div>
				</td>
				<td></td>
				<td class="field-label">Age:</td>
				<td>
					<input type="text" id="searchage" name="age" class="required"/>
					<div id="autoage_div" class="autocomplete" style=""></div>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="Search"/></td>
				<td><input type="button" value="Reset" onclick="login_validation.reset(); return false" /></td>
				<td></td>
			</tr>
		</table>
	</form>
	<div id="search_result" style="display: none;"></div>
	<div>
		Subject: <%=request.getParameter("subject") %><br />
		Title: <%=request.getParameter("title") %><br />
		Type: <%=request.getParameter("type") %><br />
		Branch: <%=request.getParameter("branch") %><br />
		Age: <%=request.getParameter("age") %><br />
	</div>
	</fieldset>
</div>
<div class="footer_menu_div">
	<fieldset class="greenfieldset">
		<table>
			<tbody>
				<tr>
					<td>View Cart</td>
					<td>
						<a href="searchTools.jsp">Search Item</a>
						</td>
					<td>
					<a href="viewArchive.jsp">View Archive</a>
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
new Ajax.Autocompleter("searchsubject", "autosubject_div", "autolist.jsp",{
	minChars: 2
});
new Ajax.Autocompleter("searchtitle", "autotitle_div", "autolist.jsp",{
	minChars: 2
});
new Ajax.Autocompleter("searchtype", "autotype_div", "autolist.jsp",{
	minChars: 2 
});
new Ajax.Autocompleter("searchbranch", "autobranch_div", "autolist.jsp",{
	minChars: 2 
});
new Ajax.Autocompleter("searchage", "autoage_div", "autolist.jsp",{
	minChars: 1
});

</script>
</body>
</html>