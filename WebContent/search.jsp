<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.hcl.sqlDB.DbQuery"%>
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
	String tableHtml;
	HttpSession jSession = request.getSession();
	@SuppressWarnings("unchecked")
	//suppress warning 
	List<String> items = (ArrayList<String>) jSession
			.getAttribute("items");

	String subject = request.getParameter("subject");
	String title = request.getParameter("title");
	String type = request.getParameter("type");
	String branch = request.getParameter("branch");
	String age = request.getParameter("age");
	String sort = request.getParameter("sort");

	String query = "Select id, subjects, title, type, age, branch from props where subjects like '%"
			+ subject
			+ "%' and title like '%"
			+ title
			+ "%' and type like '%"
			+ type
			+ "%' and branch like '%"
			+ branch
			+ "%' and age like '%"
			+ age
			+ "%' order by "
			+ sort + " asc";

	DbQuery dbconnect = new DbQuery();
	dbconnect.connectDb("props");
	ResultSet result = dbconnect.exeQuery(query);
	ResultSetMetaData metadata = result.getMetaData();
	int columCount = metadata.getColumnCount();
	String colname;
	int colnum = 6;

	tableHtml = "<table class=\"search_result_table\"><tbody><tr>";
	for (int i = 2; i <= colnum; i++) {
		String s = metadata.getColumnLabel(i);//Uper case first Letter of String 
		String columnNamae = s.substring(0, 1).toUpperCase()
				+ s.substring(1).toLowerCase();
		tableHtml += "<th><a href=\"search.jsp?subject=" + subject
				+ "&title=" + title + "&type=" + type + "&branch"
				+ branch + "&age=" + age + "&sort=" + columnNamae
				+ "\">" + columnNamae + "</a></th>";
	}
	tableHtml += "<th>Add to Cart</th></tr>";
	while (result.next()) {
		String id = "tr" + result.getString(1);
		tableHtml += "<tr id=" + id + ">";
		for (int j = 2; j <= colnum; j++) {
			tableHtml += "<td>" + result.getString(j) + "</td>";
		}
		String rowid = result.getString(1);
		if (items.contains(rowid)) {
			tableHtml += "<td><button id=\"button"
					+ result.getString(1)
					+ "\" onclick=\"removefromcart('addtocart.jsp?action=remove&rowid="
					+ rowid + "');\">Remove</button></td></tr>";
		} else {
			tableHtml += "<td><button id=\"button"
					+ result.getString(1)
					+ "\" onclick=\"addtocart('addtocart.jsp?action=add&rowid="
					+ rowid + "');\">Add to Cart</button></td></tr>";
		}
	}
	tableHtml += "</tbody></table>";
%>
<%
	dbconnect.dbColse();
%>
<body>
<div class="header_div">
	<fieldset class="greenfieldset">
		<table style="width: 100%">
			<tr>
				<td style="text-align: left; width: 50%;">Date: <%=jSession.getAttribute("date")%></td>
				<td style="text-align: right; width: 50%;"><a href="logout.jsp">Logout</a></td>
			</tr>
			<tr>
				<td style="text-align: left; width: 50%;">Welcome: <%=employeeInfo.getEmployeeNameFirst() + " "
					+ employeeInfo.getEmployeeNameLast()%></td>
				<td style="text-align: right; width: 50%;">Items in chart: <a href="viewcart.jsp"><span id="cartItem_count"><%=items.size()%> </span></a>&nbsp;</td>		
			</tr>
		</table>
	</fieldset>
</div>
<div class="content">
	<fieldset class="greenfieldset">
	<div class="dataTable">
		<%=tableHtml%>
	</div>
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
</body>
</html>