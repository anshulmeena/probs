<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.hcl.sqlDB.DbQuery"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="js/lib/prototype.js"></script>
	<script type="text/javascript" src="js/src/scriptaculous.js?load=effects,controls"></script>
	<script type="text/javascript" src="js/src/validation.js"></script>
	<script type="text/javascript" src="js/function.js"></script>
	
	<link rel="stylesheet" href="css/hclprobs.css"/>
<title>Props items Cart</title>
<jsp:useBean id="employeeInfo" class="org.hcl.employee.info.EmployeeInfo" scope="session" />
</head>
<body>
<%
	HttpSession jSession = request.getSession();

	DbQuery dbclass = new DbQuery();
	dbclass.connectDb("props");

	String itemList = "";
	String tableHtml = null;
	String viewCart_Title = null;

	@SuppressWarnings("unchecked")
	List<String> items = (ArrayList<String>) jSession
			.getAttribute("items");
	if (items.size() != 0) {
		viewCart_Title = "Items in Cart";
		for (int i = 0; i < items.size(); i++) {
			itemList += items.get(i) + " , ";
		}
		int strln = itemList.lastIndexOf(",");
		itemList = itemList.substring(0, strln);
		ResultSet result = dbclass
				.exeQuery("Select id, subjects, title, type, age, branch from props where id in ("
						+ itemList + ") order by subjects");
		ResultSetMetaData metadata = result.getMetaData();
		int columCount = metadata.getColumnCount();
		String colname;
		int colnum = 6;
		tableHtml = "<table class=\"search_result_table\"><tbody><tr>";
		for (int i = 2; i <= colnum; i++) {
			String s = metadata.getColumnLabel(i);//Uper case first Letter of String 
			String columnNamae = s.substring(0, 1).toUpperCase()
					+ s.substring(1).toLowerCase();
			tableHtml += "<th>" + columnNamae + "</th>";
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
			}
		}
		tableHtml += "</tbody></table>";
	} else {
		viewCart_Title = "Empty Cart!!";
		tableHtml = "";
	}
%>
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
			<td style="text-align: right; width: 50%;">Items in chart: <span id="cartItem_count"><%=items.size()%> </span>&nbsp;</td>		
			</tr>
		</table>
	</fieldset>
</div>
<div class="content">
	<fieldset class="greenfieldset">
		<span>
			<%=viewCart_Title%>
		</span>
		<br />
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
					<td>&nbsp;&nbsp;</td>
					<td>
						<a href="checkout.jsp">Checkout</a>
					</td>
				</tr>
			</tbody>
		</table>
	</fieldset>
</div>
</body>
</html>