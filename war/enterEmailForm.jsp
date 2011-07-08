<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.*" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>


<html>
  <H2 align="center" color="RED">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
  </H2>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br>
  </H2>

  <body>
  <table width="999" height="35" border="0.005" align="center" bgcolor="#FFFFCC">
  <tr>
    <th scope="col"><a href="/SIGNIN.jsp">HOME</a></th>
    <th scope="col"><a href="/selectSub.jsp">STUDY RESOURCES </a></th>
    <th scope="col"><a href="/showTopics.jsp">DISCUSSION BOARD</a></th>
    <th scope="col"><a href="/IBM-TGMC-FB.html">IBM-TGMC 2010</a> </th>
    <th scope="col"><a href="/submitFile2.jsp">SHARE A <em>LINK</em></a></th>
    <th scope="col"><a href="/enterEmailForm.jsp">SUBMIT EMAIL ADDRESS TO DATABSE </a></th>
    <th scope="col">ABOUT</th>
  </tr>
</table>
  <%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();   
	if(user!=null){
	
%>
  
  <br><br>
  
<p>Hello, <%= user.getNickname() %>! (You can <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>

.)</p>

<STRONG>YOU SHALL RECIEVE NOTIFICATIONS IN THE EMAIL-ADDRESS YOU ENTER <STRONG>.<br><br>


    <form  action="/insertEmail.jsp" method="post" >       
		
	ENTER EMAIL:<INPUT TYPE="TEXT" NAME="emailid">
	
	
	<input type="submit" value="Post DATA" >
	
    </form>
<p>Hello!

<% }else{ %>

<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>

<% } %>
</p>
  </body>
</html>



