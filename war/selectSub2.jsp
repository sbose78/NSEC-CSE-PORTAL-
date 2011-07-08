

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.Notes" %>
<%@ page import="NSEC.PMF" %>

<html>      <link type="text/css" rel="stylesheet" href="/style.css" />   

  <H2 align="center" color="RED">  
   <SMALL>NETAJI SUBHASH ENGINEERING COLLEGE</SMALL>
  </H2>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING </H2> <br>
  
  <H1 ALIGN = "CENTER"> SHARE A  <I> LINK </I> </H1><br>

  <body>

  
  <table>
  <tr>
	<td width="400"><a href="/SIGNIN.jsp">HOME</a></td>
	<td width="400"><a href="/selectSub.jsp">STUDY RESOURCES</a> </td>
	<td width="400"><a href="/IBM-TGMC-FB.html">IBM - TGMC 2010</a> </td>
	<td width="400"><a href="/enterEmailForm.jsp">SUBMIT eMAIL ADDRESS</a> </td>
 </tr>	
</table>	
  
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>

<p>Hello, <%= user.getNickname() %>! (You can <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>

.)</p>

    <form  action="/insertFile.jsp" method="post" >       
	   
		ENTER THE URL <INPUT type="TEXT" value="" name="URL"  size="100"> <BR>
	
		<BR> SELECT SUBJECT <BR>
		<table> <tr> <td>
		
		
		<input NAME="NAME" type="radio" value="Computer network">Computer network<BR>
		<input NAME="NAME" type = "radio" value="Software Engineering">Software Engineering<BR>
		<input NAME="NAME" type = "radio" value="Computer Graphics & Multimedia">Computer Graphics & Multimedia<BR>
		<input NAME="NAME" type = "radio" value="System Software and Administration">System Software and Administration<BR>
		<input NAME="NAME" type = "radio" value="Object Technology & UML">Object Technology & UML
		</td>
		<td >
		
		<br>
		<input NAME="NAME" type="radio" value="ALGORITHMS">ANALYISIS OF ALGORITHMS<BR>
		<input NAME="NAME" type = "radio" value="DBMS">DBMS<BR>
		<input NAME="NAME" type = "radio" value="OPERATING SYSTEM">OPERATING SYSTEMS<BR>
		<input NAME="NAME" type = "radio" value="MICROPROCESSORS">MICROPROCESSORS<BR>
		</td> </tr> </table>
		
		-----------------------------------------------------------------------------------	<br>	
		
		TOPIC:<INPUT TYPE="text" NAME="TOPIC" value="" size="60"> <br>
		
		------------------------------------------------------------------------------------ <br>
		
		(LAB/THEORY)<INPUT type="radio" name="SUBJECT" value="LAB">LAB  	  
						<INPUT type="radio" name="SUBJECT" value="THEORY">THEORY<BR>  	  
	    -------------------------------------------------------------------------------------	<br>					
						
		TEACHER/SOURCE<INPUT type="text" name="TEACHER" size="60"><BR>	  
		
	 
<br>
	
	<div><input type="submit" value="......SUBMIT FILE-LINK......." ></div>
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
  </body>
</html>



