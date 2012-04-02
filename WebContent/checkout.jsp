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
	<script type="text/javascript" src="js/anshul_cal/anshul_cal.js"></script>

	<link rel="stylesheet" href="css/hclprobs.css"/>
	<link rel="stylesheet" href="css/anshul_cal_style.css"/>
<title>Props Cart</title>
<jsp:useBean id="employeeInfo" class="org.hcl.employee.info.EmployeeInfo" scope="session"/>
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
	List<String> items = (ArrayList<String>) jSession.getAttribute("items");
	if (items.size() != 0) {
		viewCart_Title = "Teaching Tools Request form";
		for (int i = 0; i < items.size(); i++) {
			itemList += items.get(i) + " , ";
		}
		int strlin = itemList.lastIndexOf(",");
		itemList = itemList.substring(0, strlin);
		ResultSet result = dbclass.exeQuery("Select id, subjects, title, type from props where id in ("+ itemList + ") order by subjects");
		ResultSetMetaData metadata = result.getMetaData();
		int columCount = metadata.getColumnCount();
		String colname;
		tableHtml = "<table class=\"search_result_table\"><tbody><tr>";
		for (int i = 2; i <= columCount; i++) {
			String s = metadata.getColumnLabel(i);//Uper case first Letter of String 
			String columnNamae = s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
			tableHtml += "<th>" + columnNamae + "</th>";
		}
		while (result.next()) {
			String id = "tr" + result.getString(1);
			tableHtml += "<tr id=" + id + ">";
			for (int j = 2; j <= columCount; j++) {
				tableHtml += "<td>" + result.getString(j) + "</td>";
			}
		}
		tableHtml += "</tbody></table>";
	} else {
		viewCart_Title = "<strong>Error: Empty cart please select at least 1 Teaching tool for checkout.</strong>";
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
<span><%=viewCart_Title%></span><br />
<div class="dataTable"><%=tableHtml%></div>
<br />
<form id="checkout_form">
<table>
	<tbody>
		<tr>
			<td>Please Select the branch <br />where you need this item<span class="required_field">* </span></td>
			<td>
				<select name="branch" class="required">
					<option></option>
					<option value="cen">Central</option>
					<option value="eco">East Columbia</option>
					<option value="elk">Elkridge</option>
					<option value="gle">Glenwood</option>
					<option value="mil">Miller</option>
					<option value="sav">Savage</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>First Name<span class="required_field">* </span></td>
			<td><input type="text" name="firstname" value="<%=employeeInfo.getEmployeeNameFirst() %>" class="required"/></td>
		</tr>
		<tr>
			<td>Last Name<span class="required_field">* </span></td>
			<td><input type="text" name="lastname" value="<%=employeeInfo.getEmployeeNameLast() %>" class="required" /></td>
		</tr>
		<tr>
			<td>Email<span class="required_field">* </span></td>
			<td><input type="text" name="email" value="<%=employeeInfo.getEmployeeEmail1() %>" class="required" /></td>
		</tr>
		<tr>
			<td>Start Date<span class="required_field">* </span></td>
			<td><input id="anshul_cal_input_1" type="text" name="startdate" class="required"/></td>
		</tr>
		<tr>
			<td>End Date<span class="required_field">* </span></td>
			<td><input id="anshul_cal_input_2" type="text" name="enddate" class="required"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="Submit" /> <input type="reset" value="Reset" onclick="$('checkout_form').reset();"/></td>
			<td></td>
		</tr>
	</tbody>
</table>
</form>
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
<script type="text/javascript">
	Event.observe(window, 'load', function() {
		var input_cal1, input_cal2;
		input_cal1 = new anshul_cal('popup_table', 'popup', document.getElementById('anshul_cal_input_1'));
		input_cal2 = new anshul_cal('popup_table', 'popup', document.getElementById('anshul_cal_input_2'));
		//console.log(input_cal1);//Monitor Cal JS Event
		});
	var checkout_validation = new Validation('checkout_form', {
		immediate : true,
		stopOnFirst : true,
		focusOnError : false
	}//Pay attention to options USEFULLLLLL
	);
	//console.log(checkout_validation);//Monitor JS Event
</script>
</body>
</html>