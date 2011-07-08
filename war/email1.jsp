<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>

<%@ page import="javax.jdo.Query" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="javax.mail.*"%>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>

<html>
 <H1 align="center" color="BLUE">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
  </H1>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br><br><br>
  </H2>

  <body>

  <br>
  <a href="/SIGNIN.jsp">HOME</a>

  <%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();   
if( user !=null)
{
%>
	HELLO <%= user.getNickname() %>! 
	
	<p align="left"><a  href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)
	</p>
	<br><br>
	<form name="form1" action="/email-queue-dig.jsp" method="post">
			SET RANGE <br>FROM <input name="START" type="text"><br>TO<input name="FINISH" type="text"><br>
			SUBJECT:	<div><input name="subject" type="text"></div>
			EMAIL BODY:<div><textarea name="content" rows="3" cols="100"></textarea></div>
		   
		 <div><input type="submit" value="SEND EMAIL" /></div>
	</form>
	
<%

}else {  }
%>

