<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.hcl.sqlDB.DbQuery"%>
<jsp:useBean id="employeeInfo" class="org.hcl.employee.info.EmployeeInfo" scope="session" />
<%
	String tableHtml;
	String email = employeeInfo.getEmployeeEmail1();
	String var = request.getParameter("value");
	String query = null;

	if (var.equals("all")) {
		query = "Select Date_Needed 'Date Needed', Title, Type, From_Branch 'Branch From', Branch 'Branch To', Date_Returned 'Status' from requests where Email='"
				+ email + "' order by ID desc";
	} else if (var.equals("top30")) {
		query = "Select Date_Needed 'Date Needed', Title, Type, From_Branch 'Branch From', Branch 'Branch To', Date_Returned 'Status' from requests where Email='"
				+ email + "' order by ID desc limit 0, 30";
	} else if (var.equals("top60")) {
		query = "Select Date_Needed 'Date Needed', Title, Type, From_Branch 'Branch From', Branch 'Branch To', Date_Returned 'Status' from requests where Email='"
				+ email + "' order by ID desc limit 0, 60";
	} else {
		query = "Select Date_Needed 'Date Needed', Title, Type, From_Branch 'Branch From', Branch 'Branch To', Date_Returned 'Status' from requests where Email='"
				+ email + "' order by ID desc limit 0, 10";
	}

	DbQuery dbconnect = new DbQuery();
	dbconnect.connectDb("props");
	ResultSet result = dbconnect.exeQuery(query);
	ResultSetMetaData metadata = result.getMetaData();
	int colnumCount = metadata.getColumnCount();
	tableHtml = "<table class=\"search_result_table\"><tbody><tr>";
	for (int i = 1; i <= colnumCount; i++) {
		tableHtml += "<th>" + metadata.getColumnLabel(i) + "</th>";
	}
	while (result.next()) {
		String id = "tr" + result.getString(1);
		tableHtml += "<tr id=" + id + ">";
		for (int j = 1; j <= colnumCount; j++) {
			tableHtml += "<td>" + result.getString(j) + "</td>";
		}
	}
	tableHtml += "</tbody></table>";
%>

<%=tableHtml%>

<%
	dbconnect.dbColse();
%>

