<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.hcl.sqlDB.DbQuery"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.ResultSetMetaData"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Title Page</title>
</head>
<body>
	<%!
		String tableHtml;
		String subquery;
		int columnum;
	%>
	<%
		DbQuery dbquery = new DbQuery();
		dbquery.connectDb("props");
		subquery = "where Email= \"" + request.getParameter("email") + "\"";
		ResultSet result = dbquery.exeTableSqlQuery("requests", subquery, 1);
		String var = request.getParameter("var");
	
		ResultSetMetaData rsMetadata = result.getMetaData();
		columnum = rsMetadata.getColumnCount();
	
		tableHtml = "<table><tbody><tr>";
		for (int i = 1; i <= columnum; i++) {
			tableHtml += "<th>" + rsMetadata.getColumnName(i) + "</th>";
		}
		tableHtml += "</tr>";
	
		while (result.next()) {
			tableHtml += "<tr>";
			for (int i = 1; i <= columnum; i++) {
				tableHtml += "<td>" + result.getString(i) + "</td>";
			}
			tableHtml += "</tr>";
		}
		tableHtml += "</tbody></table>";
		dbquery.dbColse();
	%>
	<div>
		<%=tableHtml%>
	</div>
</body>
</html>