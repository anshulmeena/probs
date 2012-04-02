<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.DateFormat"%>
<%@ page import="org.hcl.html.display.HtmlDisplay"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="org.hcl.employee.info.EmployeeInfo"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.text.SimpleDateFormat"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teaching Tools web GUI</title>
</head>
<body>
<div id="greetingNote">
<% 
	Date todayDate = new Date();
	SimpleDateFormat simpleDateFormat =  new SimpleDateFormat("EEE MMM dd");
	EmployeeInfo employeeInfo = (EmployeeInfo) session.getAttribute("EmployeeInfo");
	HtmlDisplay displayTable = new HtmlDisplay();
%>
Date: <%=simpleDateFormat.format(todayDate)%><br />
Name: <%= employeeInfo.getEmployeeNameFirst()+" "+employeeInfo.getEmployeeNameLast()%><br />
Branch: <%=employeeInfo.getEmployeeBranch() %><br />
<br />
</div>
<div id="htmlTable">
<%=displayTable.completeHtmlTable("requests",employeeInfo.getEmployeeEmail1(),1) %>
<form action="htmltable">
	<input name="tableName" type="text"></input>
	<input name="pageNum" type="text""></input>
	<input name="subQuery" type="text""></input>
	<input type="submit" value="Submit"/>
</form>
</div>
</body>
</html>