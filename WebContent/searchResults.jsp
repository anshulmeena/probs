<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.hcl.sqlDB.DbQuery"%>
<%
	String tableHtml;

	HttpSession jSession = request.getSession();
	@SuppressWarnings("unchecked")
	//suppress warning 
	List<String> items = (ArrayList<String>) jSession
			.getAttribute("items");

	String subject = request.getParameter("subject");
	String title = request.getParameter("title");
	String type = request.getParameter("type");
	String branch = request.getParameter("branch");
	String age = request.getParameter("age");

	String query = "Select id, subjects, title, type, age, branch from props where subjects like '%"
			+ subject
			+ "%' and title like '%"
			+ title
			+ "%' and type like '%"
			+ type
			+ "%' and branch like '%"
			+ branch + "%' and age like '%" + age + "%' order by id";

	DbQuery dbconnect = new DbQuery();
	dbconnect.connectDb("props");
	ResultSet result = dbconnect.exeQuery(query);
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
			//First letter capitalize
			//String s = result.getString(j);
			//String columnvalue = s.substring(0,1).toUpperCase() + s.substring(1).toLowerCase();
			tableHtml += "<td>" + result.getString(j) + "</td>";
		}
		String rowid = result.getString(1);
		//Button text based on the Item is in the cart or not
		if (items.contains(rowid)) {
			//System.out.println("Matching Rowid: "+items.get(1));
			tableHtml += "<td><button id=\"button"
					+ result.getString(1)
					+ "\" onclick=\"removefromcart('addtocart.jsp?action=remove&rowid="
					+ rowid + "');\">Remove</button></td></tr>";
		} else {
			//System.out.println("NonMatching Rowid: "+items.get(1));
			tableHtml += "<td><button id=\"button"
					+ result.getString(1)
					+ "\" onclick=\"addtocart('addtocart.jsp?action=add&rowid="
					+ rowid + "');\">Add to Cart</button></td></tr>";
		}
	}
	tableHtml += "</tbody></table>";
%>
<%=tableHtml%>
<%
	dbconnect.dbColse();
%>

