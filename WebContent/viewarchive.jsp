<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/lib/prototype.js"></script>
<script type="text/javascript" src="js/src/scriptaculous.js?load=effects,controls"></script>
<script type="text/javascript" src="js/src/validation.js"></script>
<script type="text/javascript" src="js/function.js"></script>

<link rel="stylesheet" href="css/hclprobs.css"/>
<title>Archive Teaching Tools</title>
</head>
<jsp:useBean id="employeeInfo" class="org.hcl.employee.info.EmployeeInfo" scope="session"/>
<body>
<%
HttpSession jSession = request.getSession();
List<String> items = (List<String>)jSession.getAttribute("items");
%>
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
<div class="content">
	<fieldset class="greenfieldset">
	<div>
		<form method="get" id="archive_selection_form">
			<select id="archive_select" onchange="archive_option();">
				<option value="0">Most Recent</option>
				<option value="top30">Top 30</option>
				<option value="top60">Top 60</option>
				<option value="all">Show All</option>
			</select>
		</form>
	</div>
	<div id="dataTable" class="dataTable"></div>
	</fieldset>
</div>
<div class="footer_menu_div">
	<fieldset class="greenfieldset">
		<table>
		<tbody>
			<tr>
				<td>
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
</body>
</html>