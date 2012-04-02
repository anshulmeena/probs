<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.hcl.sqlDB.DbQuery"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hcl.employee.info.EmployeeInfo"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="java.util.UUID"%>
<jsp:useBean id="employeeInfo" class="org.hcl.employee.info.EmployeeInfo" scope="session" />
<%
	Date date = new Date();
	SimpleDateFormat dateForamt = new SimpleDateFormat("EEE MMM dd");
	//String Token = UUID.randomUUID().toString();//Uinversal Uniqe ID; NOT using, USING SESSION ID
	if (request.getParameter("email") != null && request.getParameter("email") != "") {
		DbQuery dbquery = new DbQuery();
		dbquery.connectDb("employee_directory");
		//Session ID for login auth. users
		HttpSession jSession = request.getSession(true);
		//Array list for the shopping cart
		List<String> items = new ArrayList<String>();
		jSession.setAttribute("items", items);//session list for items
		jSession.setAttribute("date", dateForamt.format(date));

		employeeInfo.setToken(jSession.getId());
		employeeInfo.setEmployeeEmail1(request.getParameter("email"));

		String subquery = " where Email = \"" + employeeInfo.getEmployeeEmail1() + "\"";

		ResultSet resultset = dbquery.exeSqlQuery("master", subquery);

		while (resultset.next()) {
			employeeInfo.setEmployeeNameFirst(resultset.getString("First"));
			employeeInfo.setEmployeeNameLast(resultset.getString("Last"));
			employeeInfo.setEmployeeTitle(resultset.getString("Title"));
			employeeInfo.setEmployeeBranch(resultset.getString("Branch"));
			employeeInfo.setEmployeeEmail1(resultset.getString("Email"));
			employeeInfo.setEmployeeDepartment(resultset.getString("Department"));
			employeeInfo.setEmployeeAIM(resultset.getString("AIM"));
			employeeInfo.setEmployeeStatus(resultset.getString("Status"));
		}

		dbquery.dbColse();
%>
<jsp:forward page="secondPage.jsp">
	<jsp:param value="<%=employeeInfo.getToken()%>" name="Token" />
</jsp:forward>
<%
	} else {
		response.sendRedirect("login.jsp");
	}
%>