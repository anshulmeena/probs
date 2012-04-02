/**
 * 
 */
package org.hcl.html.display;

import java.sql.*;
/**
 * @author anshulmeena
 * 
 * <p>Class for printing predefined HTML</p>
 *
 */
public class HtmlDisplay {
	
	Connection propsConnection;
	Statement propsStatement;
	ResultSet propsResultset = null;
	ResultSetMetaData resultsetMetaData = null;
	String url = "jdbc:mysql://localhost/props";
	String dbuser = "root";
	String dbpasswd = "hcl123";

	/**
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * 
	 */
	public HtmlDisplay() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		propsConnection = DriverManager.getConnection(url, dbuser,dbpasswd);
		propsStatement = propsConnection.createStatement();
	}

	/**
	 * HTML Table with independent rows and columns
	 * 
	 * @param String Table Name
	 * @param String Page Number
	 * @return String 
	 * @throws SQLException 
	 */
	public String completeHtmlTable(String tableName, String subQuery, int pageNum) throws SQLException{
		
		int recordLimit = 8;
		int numColumn;
		int recordNum = 1;
		if(subQuery != null || subQuery != ""){
			subQuery =" where Email =\""+subQuery+"\"";
		}else {
			subQuery ="";
		}
		//int pageNumber = pageNum;
		int startNumber = (recordLimit*pageNum)-recordLimit;
		String returnTableHtml = "";
		String sqlQuery = "Select ID, User, Email, Type, Title from " + tableName + subQuery + " order by id limit "+ startNumber +", "+recordLimit;
		try {
			propsResultset = propsStatement.executeQuery(sqlQuery);
			resultsetMetaData = propsResultset.getMetaData();
			numColumn = resultsetMetaData.getColumnCount();
			returnTableHtml = "<table><tbody><tr>";
			for (int j = 1; j <= numColumn; j++){
				returnTableHtml += "<th>"+resultsetMetaData.getColumnName(j)+"</th>";
			}
			returnTableHtml += "</tr><tr>";
			while (propsResultset.next()) {
				//tableHtml +="<tr><td>"+recordNum+"</td>";
				for (int i = 1; i <= numColumn; i++){
					returnTableHtml += "<td>"+propsResultset.getString(i)+"</td>";
					}
				returnTableHtml +="</tr>";
				recordNum++;
			}
			returnTableHtml += "</tbody></table>";
		}catch(SQLException mysqlException){
			mysqlException.printStackTrace();
		}finally{
			if(propsResultset != null){
				try{
					propsResultset.close();
				}catch (Exception e) {}
			}
			if(propsStatement != null){
				try{
					propsStatement.close();
				}catch (SQLException e) {
				}
			}
			if(propsConnection != null){
				try{
					propsConnection.close();
				}catch (SQLException e) {
				}
			}
		}
		return returnTableHtml;
	}
}