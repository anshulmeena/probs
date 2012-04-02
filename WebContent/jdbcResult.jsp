<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Database Connection Testing</title>
</head>
<%
Connection connection = null;
Statement sqlStatement = null;
ResultSet resultSet = null;
String dbuser = "root";
String dbpass = "hcl123";
int i = 1;
%>
<body>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
}catch (Exception e){
	System.out.print("Exception"+e);
}
try{
	connection = DriverManager.getConnection("jdbc:mysql://localhost/employ_directory",dbuser,dbpass);
}catch(SQLException csql){
	System.out.print("Connection Exception"+csql);
}
try{
	sqlStatement = connection.createStatement();
	resultSet = sqlStatement.executeQuery("Select * from master");
}catch(SQLException qsql){
	System.out.print("Sql query exception"+qsql);
}%>
<table border="1">
<tbody><tr><th>ID</th><th>Host</th><th>User</th><th>Pass</th><th>abc</th><th>def</th><th>Email</th></tr>
<%while(resultSet.next()){%>
	<tr><td><%=i%></td><td><%=resultSet.getString(1)%></td>
	<td><%=resultSet.getString(2) %></td>
	<td><%=resultSet.getString(3) %></td>
	<td><%=resultSet.getString(4) %></td>
	<td><%=resultSet.getString(5) %></td>
	<td><%=resultSet.getString(13) %></td></tr>
	<%i++;}%>
</tbody>
</table>
</body>
</html>