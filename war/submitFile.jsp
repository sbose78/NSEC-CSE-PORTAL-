

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.Notes" %>
<%@ page import="NSEC.PMF" %>

<html>
  <H1 align="center" color="RED">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
  </H1>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br><br><br>
  </H2>

  <body>
   <input name="COLLEGE" type="image" src="/aba.jpg" height="100" width="100"  />
   <br>
 <a href="/SIGNIN.jsp">HOME</a> 
  
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>

<p>Hello, <%= user.getNickname() %>! (You can <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>

.)</p>

    <form  action="/insertFile.jsp" method="post" >       
	
	SUBJECT:<INPUT TYPE="TEXT" NAME="NAME"><br><br>
	TOPIC<INPUT TYPE="TEXT" NAME="TOPIC"><BR>
	SUBJECT(LAB/THEORY)<INPUT type="TEXT" name="SUBJECT"><BR>  	  
	TEACHER<INPUT type="text" name="TEACHER"><BR>	  
	
    ENTER THE URL <INPUT type="TEXT" value="" name="URL"> <BR>
<br><br>
	
	<div><input type="submit" value="Post DATA" /></div>
    </form>
<%
    } else {
%>
<p>Hello!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
</p>
<%
    }
%>	


<div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#appId=177020715650983&amp;xfbml=1"></script><fb:comments numposts="10" width="425" publish_feed="true"></fb:comments>



  </body>
</html>



