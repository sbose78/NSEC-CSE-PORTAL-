<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<html>
  <H1 align="center" color="RED">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
   <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
   
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
    if (user != null) {
%>

<p>Hello, <%= user.getNickname() %>! (You can <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>

.)</p>



    <form action="/chatMail.jsp" method="post" >	
       
	
	<br>
    YOUR CHAT MESSAGE<INPUT type="TEXT" name="CHAT" width="1000"><BR>
	  
      <div><input type="submit"   value="Post DATA" /></div>
    </form>
	



<%
    } else {
%>
<p>Hello!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
to include your name with the DATA you post.</p>
<%
    }
%>
	
	</body>
</html>