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
	
	<iframe
  style="width: 100%; height: 300px; border: none;"
  frameborder="0" allowtransparency="0" id="zeep_mobile_settings_panel"
  src="https://www.zeepmobile.com/subscription/settings?api_key=dcda5d9e-2c7c-4972-b477-d6508ec4911c&user_id=[your authenticated user]"
>
</iframe>

	
<%
}else {  }
%>

