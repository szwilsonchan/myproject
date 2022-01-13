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
	MyWilsonData myData=null;
	myData = new MyWilsonData();
	myData.updWilsonData("update jobs set jname='Good Jobs'");
   	ResultSet rs=myData.getWilsonData("select * from jobs");
 
%>
 
<table bgcolor="#9999dd" border="1" width="500">
 
    <% while(rs.next()){ %>
 
    <tr>
 
        <td><%=rs.getString(1)%></td>
 
        <td><%=rs.getString(2)%></td>
 
 
    </tr>
 
    <% } %>
 
<table>
</body>


</html>
