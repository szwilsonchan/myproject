package com.wilsondata;
import java.sql.*;

public class MyWilsonData 
{    
	public ResultSet getWilsonData(String sql) throws Exception     
	{          
		Connection conn=null; 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection("jdbc:oracle:thin:@192.168.248.3:1521:ora11","wilson","wilson");
		Statement stmt=conn.createStatement();
   		return stmt.executeQuery(sql);
	} 
	
	public void updWilsonData(String sql) throws Exception     
	{          
		Connection conn=null; 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection("jdbc:oracle:thin:@192.168.248.3:1521:ora11","wilson","wilson");
		Statement stmt=conn.createStatement();
   		stmt.executeUpdate(sql);
	}
}