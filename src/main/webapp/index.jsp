<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ page language="java" %>

<%@ page import="redis.clients.jedis.Jedis" %>



<%@ page import="org.apache.activemq.ActiveMQConnection" %>


<%@ page import="org.apache.activemq.ActiveMQConnectionFactory" %>
<%@ page import="javax.jms.Connection" %>


<%@ page import="javax.jms.ConnectionFactory" %>
<%@ page import="javax.jms.DeliveryMode" %>
<%@ page import="javax.jms.Destination" %>
<%@ page import="javax.jms.MessageProducer" %>
<%@ page import="javax.jms.Message" %>
<%@ page import="javax.jms.MessageConsumer" %>
<%@ page import="javax.jms.Session" %>
<%@ page import="javax.jms.TextMessage" %>

<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>

<%@ page import="java.io.*"%> 

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8" />

<title><%=request.getServletContext().getServerInfo() %></title>

</head>


<body>
<h1>


<%=request.getLocalAddr()%>:<%=request.getServerPort()%>
<%
HttpSession s = request.getSession();
%>
<br>

SessionID:<%=s.getId()%>
 
<br>
REDIS:

<%
 

String host="192.168.248.4";

        
int port=6379;

        
Jedis client=new Jedis(host,port);
        
client.auth("111111");
        
client.set("name","caicai");
        
String value=client.get("name");
        
out.print(value);
client.close();



%>

 
<br>
<%
	    javax.jms.Session mysession=null;
	    TextMessage text=null;

            ConnectionFactory factory = new ActiveMQConnectionFactory(ActiveMQConnection.DEFAULT_USER, ActiveMQConnection.DEFAULT_PASSWORD, "tcp://192.168.248.4:61616");
            Connection connection = factory.createConnection();
            connection.start();
            mysession = connection.createSession(Boolean.FALSE, Session.AUTO_ACKNOWLEDGE);
            Destination destination = mysession.createQueue("myactivemq1");
            MessageProducer producer = mysession.createProducer(destination);
            producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);
            
            text = mysession.createTextMessage("发送测试消息5");
            producer.send(text);

	    MessageConsumer consumer = mysession.createConsumer(destination);
            Message message = consumer.receive(1000 * 3);
            //Message message = consumer.receiveNoWait();
	    if (message != null)
            {
	    	text = (TextMessage) message;
	    	if (text != null)
	    	{
	    		out.print(" 接收：" + text.getText());
	    	}
             }
                  
             consumer.close(); 
	     mysession.close();
	     connection.close();      

%>

<%

//File myfile=new File("/var/tomcat/filestore/","serverinfo.txt");

//if(myfile.exists())
//{
//myfile.delete();
//}else{
//myfile.createNewFile();
//}

BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("/var/tomcat/filesvr/filestore/serverinfo.txt")),"utf-8"));
bw.write("服务器IP:");
bw.write(request.getLocalAddr());
bw.write("服务器端口:");  
String sp=String.valueOf(request.getServerPort());
bw.write(sp);
bw.flush();
bw.close();

%>
    
</h1>


<a href="getjobs.jsp">查看工作列表</a>
<img src="img/1.png" width="100"/>

</body>


</html>
