package org.hcl.html.display;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FullHtmlTable
 */
public class FullHtmlTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//HTML code for table
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter htmlOut = response.getWriter();
		String tableName = request.getParameter("tableName");
		String subquery = request.getParameter("subquery");
		int pageNumber = Integer.parseInt(request.getParameter("pageNum"));
		
		//System.out.println("This is doGet on FullHtmlTable");
		
		try {
			HtmlDisplay displayTable = new HtmlDisplay();
			String tableHtml = displayTable.completeHtmlTable(tableName, subquery, pageNumber);
			htmlOut.println(tableHtml);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
