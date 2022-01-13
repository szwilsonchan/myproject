<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ page language="java" %>


<%@ page import="redis.clients.jedis.Jedis" %>
<%@ page import="java.sql.*" %>
<%@ page import="wilsondata.MyWilsonData" %>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8" />

<title><%=request.getServletContext().getServerInfo() %></title>

</head>


<body>
<h1>

</h1>




<%

	String uname="tony";
	String sname="shanghaishanghaishanghaishanghaishanghaishanghaishanghaishanghaishanghai,shanghaishanghaishanghaishanghaishanghaishanghaishanghaishanghaishanghai,shanghaishanghaishanghaishanghaishanghaishanghaishanghaishanghaishanghai";
	String syear= "2000";

	Connection conn=null; 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@192.168.248.3:1521:ora11","wilson","wilson");
	Statement stmt=conn.createStatement();

 	for (int i=18000;i<20000;i++)
	{
		stmt.executeUpdate("insert into schools(uname,sname,syear) values('"+ uname +"','"+ sname + String.valueOf(i) + "','"+ syear+"')");	
		//out.print("insert into schools(uname,sname,syear) values('"+ uname +"','"+ sname + String.valueOf(i) +"','"+ syear+"')");
	}

%>
 

</body>


</html>
