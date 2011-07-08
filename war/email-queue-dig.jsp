<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.*" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %> 

<%@ page import="javax.jdo.*" %>
<%@ page import="javax.jdo.Query" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="javax.mail.*"%>
<%@ page import="NSEC.PMF" %>
<%@ page import="NSEC.Emails" %>


<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.jdo.Query" %>
<%@ page import="javax.mail.Session" %>

<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="javax.mail.*"%>

<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.internet.AddressException"%>

<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Session"%>


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
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    
%>

<%
    
		PersistenceManager pm = PMF.get().getPersistenceManager();

    String query = "select from " + Emails.class.getName() ;
	
	Query q = pm.newQuery(query);
	
	String sub=request.getParameter("subject");
	String content=request.getParameter("content");
    List<Emails> emails = (List<Emails>) q.execute();
	
    if (!emails.isEmpty()) 
	{
			Queue queue = QueueFactory.getDefaultQueue();
		for (Emails e : emails) 
		{     queue.add(url("/email-queue-send.jsp").param("emailid", e.getEmailid()).param("subject",sub).param("content",content));
		
%>
<br><br>
<%=e.getEmailid()%>

<%
		}
	}	

	else{
	
	}
	
%>
<br><br>

<a href="/SIGNIN.jsp">HOME</a><BR>



	</body>
</html>