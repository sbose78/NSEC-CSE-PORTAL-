

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

  
 <table width="999" height="35" border="0.005" align="center" bgcolor="00000">
  <tr>
    <th scope="col"><a href="/SIGNIN.jsp">HOME</a></th>
    <th scope="col"><a href="/selectSub.jsp">STUDY RESOURCES </a></th>
    <th scope="col">FORUMS</th>
    <th scope="col"><a href="/IBM-TGMC-FB.html">IBM-TGMC 2010</a> </th>
    <th scope="col"><a href="/submitFile2.jsp">SHARE A <em>LINK</em></a></th>
    <th scope="col"><a href="/enterEmailForm.jsp">SUBMIT EMAIL ADDRESS TO DATABSE </a></th>
    <th scope="col">ABOUT</th>
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
	
	SUBJECT....
	
		<br>
	<table>
	<tr> 
		<td>
		<B> SEM 6 </B><br><br>
			
		<input NAME="NAME" type="radio" value="Computer network">Computer network<BR>
		<input NAME="NAME" type = "radio" value="Software Engineering">Software Engineering<BR>
		<input NAME="NAME" type = "radio" value="Computer Graphics & Multimedia">Computer Graphics & Multimedia<BR>
		<input NAME="NAME" type = "radio" value="System Software and Administration">System Software and Administration<BR>
		<input NAME="NAME" type = "radio" value="Object Technology & UML">Object Technology & UML
		</td>
		
		<td valign="top">	
		<br><B> SEM 5 </B><br>
		
		<br>
		<input NAME="NAME" type="radio" value="ALGORITHMS">ANALYISIS OF ALGORITHMS<BR>
		<input NAME="NAME" type = "radio" value="DBMS">DBMS<BR>
		<input NAME="NAME" type = "radio" value="OPERATING SYSTEM">OPERATING SYSTEMS<BR>
		<input NAME="NAME" type = "radio" value="MICROPROCESSORS">MICROPROCESSORS<BR>
		</td>	


			<td valign="top">
		
		<B> SEM 2 </B><br><br>
		<input NAME="NAME" type = "radio" value="Introduction to Computing">Introduction to Computing<BR>
		</td>
		
	</tr>	
		
	<tr> <td>	
		<br><B> SEM 4 </B><br><br>
		
		<input NAME="NAME" type="radio" value="Formal Language & Automata Theory">Formal Language & Automata Theory<BR>
		<input NAME="NAME" type = "radio" value="Operation Research & Optimization Techniques">Operation Research <BR>
		<input NAME="NAME" type = "radio" value="Advanced Computer Architecture">Advanced Computer Architecture<BR>
		
		</td>
		
		<td >		
		
		<B> SEM 3 </B><br><br>
		<input NAME="NAME" type = "radio" value="Principles of Programming Language">Principles of Programming Language<BR>
		<input NAME="NAME" type = "radio" value="Data Structure & Algorithms">Data Structure & Algorithms<BR>
   		<input NAME="NAME" type = "radio" value="Computer Organisation">Computer Organisation<BR>
		
		</td>
	</tr>	
			
		</table>
	  
		
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
	
	
			<div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#appId=177020715650983&amp;xfbml=1"></script><fb:comments numposts="10" width="425" publish_feed="true"></fb:comments>

	
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



