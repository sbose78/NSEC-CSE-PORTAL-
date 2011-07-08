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
	<form name="form1" action="/insertShortURL.jsp" method="post">
			
			LONG URL: http://<div><textarea name="url" rows="1" cols="400"></textarea></div>
		   
		 <div><input type="submit" value="SHORTEN URL" /></div>
	</form>
	
<%

}else { 
%> 
			<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">SIGN IN USING YOUR GOOGLE ACCOUNT</a>
<%			
}
%>

