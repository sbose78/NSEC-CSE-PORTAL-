<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.*" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>


<%@ page import="com.google.appengine.api.labs.taskqueue.Queue"%>
<%@ page import="com.google.appengine.api.labs.taskqueue.QueueFactory"%>

<%@ page import="static com.google.appengine.api.labs.taskqueue.TaskOptions.Builder.*"%>


<html>
  <H1 align="center" color="BLUE">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
  </H1>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br><br><br>
  </H2>

  <body>  

<%
    
		Queue queue = QueueFactory.getDefaultQueue();
queue.add(url("/email-queue-send.jsp").param("emailid", "sbose78@gmail.com").param("content","GOOD NIGHT and Sweet Dreams").param("subject","GODSPEED"))	;	

%>
<br><br>
<a href="/enterEmailFormQueue.jsp">ENTER ANOTHER EMAIL ADDRESS</a><BR><br><br>
<a href="/SIGNIN.jsp">HOME</a><BR>



	</body>
</html>