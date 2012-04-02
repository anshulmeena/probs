<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="org.apache.jasper.tagplugins.jstl.core.Remove"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout Teaching Tools</title>
</head>
<body>
<jsp:useBean id="employeeInfo" class="org.hcl.employee.info.EmployeeInfo" scope="session" />
<%
	request.getSession(false).invalidate();

	response.setHeader("Cache-Control", "no-cache");

	response.setHeader("Cache-Control", "no-store");

	response.setHeader("Expires", "0");

	response.setDateHeader("Expires", -1);

	response.sendRedirect("login.jsp");
%>
</body>
</html>