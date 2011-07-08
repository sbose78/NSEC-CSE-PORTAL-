<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.*" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>
<%@ page import="NSEC.URL2" %>

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
    if (user != null) 
	{
%>
<p>Hello, <%= user.getNickname() %>! (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
    }
	else{ }
		
%>

<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
	

	String topic = request.getParameter("TOPIC");
	String url = request.getParameter("URL");
	String subject = request.getParameter("SUBJECT");
	String teacher = request.getParameter("TEACHER");
	String name = request.getParameter("NAME");


		Date date = new Date();
        URL2 notes = new URL2(user,url,name,topic,teacher,date,0);
	
		
        try {
            pm.makePersistent(notes);
        } finally {
            pm.close();
        }
%>
<br><br>
<a href="/showFiles.jsp">SEE THE FILES IN THE DATABASE</a><BR>


	</body>
</html>