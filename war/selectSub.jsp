<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>
<%@ page import="java.lang.*" %>


<html>

   <link type="text/css" rel="stylesheet" href="/style.css" />
<TITLE align="center"> </TITLE>
 
  <H1 align="center" color="BLUE">  
   <SMALL>NETAJI SUBHASH ENGINEERING COLLEGE</SMALL>
   
   
   
  <br>     
  </H1>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br>
  </H2> 
  
<body>	

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();   
%>

<%
if( user !=null)
{
%>
	HELLO <%= user.getNickname() %>! 
	
	<p align="left"><a  href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)
	</p>
	
<table width="999" height="35" border="0.005" align="center" bgcolor="00000">
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
	<br><br><br>		
	<LARGE>SEE ALL THE FILES: <a  href="/showFiles.jsp">CLICK HERE TO SEE THE POPULATED LIST ! </a><LARGE>
	<br> 
	
	OR
	

	
	<form name="form1" action="/showFiles2.jsp" method="post">
	
	 SELECT THE APPROPRIATE SUBJECT....
	
		<br>
	<table>
	<tr> 
		<td>
		<B> SEM 6 </B><br><br>
			
		<input NAME="sub" type="radio" value="Computer network">Computer network<BR>
		<input NAME="sub" type = "radio" value="Software Engineering">Software Engineering<BR>
		<input NAME="sub" type = "radio" value="Computer Graphics & Multimedia">Computer Graphics & Multimedia<BR>
		<input NAME="sub" type = "radio" value="System Software and Administration">System Software and Administration<BR>
		<input NAME="sub" type = "radio" value="Object Technology & UML">Object Technology & UML
		</td>
		
		<td valign="top">	
		<br><B> SEM 5 ( MOST ACTIVE )</B><br>
		
		<br>
		<input NAME="sub" type="radio" value="ALGORITHMS">ANALYISIS OF ALGORITHMS<BR>
		<input NAME="sub" type = "radio" value="DBMS">DBMS<BR>
		<input NAME="sub" type = "radio" value="OPERATING SYSTEM">OPERATING SYSTEMS<BR>
		<input NAME="sub" type = "radio" value="MICROPROCESSORS">MICROPROCESSORS<BR>
		</td>	


			<td valign="top">
		
		<B> SEM 2 </B><br><br>
		<input NAME="sub" type = "radio" value="Introduction to Computing">Introduction to Computing<BR>
		</td>
		
	</tr>	
		
	<tr> <td>	
		<br><B> SEM 4 </B><br><br>
		
		<input NAME="sub" type="radio" value="Formal Language & Automata Theory">Formal Language & Automata Theory<BR>
		<input NAME="sub" type = "radio" value="Operation Research & Optimization Techniques">Operation Research <BR>
		<input NAME="sub" type = "radio" value="Advanced Computer Architecture">Advanced Computer Architecture<BR>
		
		</td>
		
		<td >		
		
		<B> SEM 3 </B><br><br>
		<input NAME="sub" type = "radio" value="Principles of Programming Language">Principles of Programming Language<BR>
		<input NAME="sub" type = "radio" value="Data Structure & Algorithms">Data Structure & Algorithms<BR>
   		<input NAME="sub" type = "radio" value="Computer Organisation">Computer Organisation<BR>
		
		</td>
	</tr>	
			
		</table>
	  
	  <br><br>
      <div align="center"><input type="submit" value="....ENTER THE RESOURCE POOL.... " /></div>
	  
	  
	</form>
    
<%	
}

else	
{

%>


<p>Hello!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">SIGN IN USING YOUR GOOGLE ACCOUNT</a>
TO ACCESS THE FILES</p>

<%


 }

 %>	

	</body>

</html>

