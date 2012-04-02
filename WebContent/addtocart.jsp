<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.hcl.sqlDB.DbQuery"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean id="employeeInfo" class="org.hcl.employee.info.EmployeeInfo" scope="session" />
<%
String rowid = request.getParameter("rowid"); 
String action = request.getParameter("action"); 

HttpSession jSession = request.getSession();
@SuppressWarnings("unchecked")//suppress warning 
List<String> items = (ArrayList<String>)jSession.getAttribute("items");

String responseString = null;
int itemsinCart =  items.size();

if(action.equals("add")){
	itemsinCart++;
	responseString = "Acction: Add \n";
	responseString += "carid: "+rowid+"\n";
	if ((rowid != null) && (!rowid.trim().equals(""))) {
		items.add(rowid);
	}else{
		responseString = "Add action can not be completed.";
	}	
}else if(action.equals("remove")){
	itemsinCart = itemsinCart - 1;
	if ((rowid != null) && (!rowid.trim().equals(""))) {
		items.remove(rowid);
	}else{
		responseString = "Remove action can not be completed.";
	}	
}else{
	responseString = "Add/Remove action can not be completed.";
}
%>
<%=itemsinCart %>


