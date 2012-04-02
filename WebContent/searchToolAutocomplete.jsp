<%@page import="java.sql.*"%>
<%@page import="org.hcl.sqlDB.DbQuery"%>

<%
DbQuery dbconnect = new DbQuery();
dbconnect.connectDb("props");
String action = request.getParameter("Action");

String subject = request.getParameter("subject");
String title = request.getParameter("title");
String type = request.getParameter("type");
String age = request.getParameter("age");
String branch = request.getParameter("branch");

String list;
list = "<ul>";
if(action.equals("su")){
	ResultSet result = dbconnect.exeQuery("select Distinct subjects from props where subjects like '%"+subject+"%' order by subjects");
	ResultSetMetaData rsMetadata = result.getMetaData();
	int columnum = rsMetadata.getColumnCount();
	while(result.next()){
			list += "<li>"+result.getString("subjects")+"</li>";
	}
}else if(action.equals("ti")){
	ResultSet result = dbconnect.exeQuery("select Distinct title from props where title like '%"+title+"%' order by title");
	ResultSetMetaData rsMetadata = result.getMetaData();
	int columnum = rsMetadata.getColumnCount();
	while(result.next()){
			list += "<li>"+result.getString("title")+"</li>";
	}
}else if(action.equals("ty")){
	ResultSet result = dbconnect.exeQuery("select Distinct type from props where type like '%"+type+"%' order by type");
	ResultSetMetaData rsMetadata = result.getMetaData();
	int columnum = rsMetadata.getColumnCount();
	while(result.next()){
			list += "<li>"+result.getString("type")+"</li>";
	}
}else if(action.equals("br")){
	ResultSet result = dbconnect.exeQuery("select Distinct branch from props where branch like '%"+branch+"%' order by branch");
	ResultSetMetaData rsMetadata = result.getMetaData();
	int columnum = rsMetadata.getColumnCount();
	while(result.next()){
			list += "<li>"+result.getString("branch")+"</li>";
	}
}else if(action.equals("ag")){
	ResultSet result = dbconnect.exeQuery("select Distinct age from props where age like '%"+age+"%' order by age");
	ResultSetMetaData rsMetadata = result.getMetaData();
	int columnum = rsMetadata.getColumnCount();
	while(result.next()){
			list += "<li>"+result.getString("age")+"</li>";
	}
}else{
	System.out.println("Else Action:"+action);
}
list += "<ul>";
%>
<%=list %>

<%
dbconnect.dbColse();
%>



