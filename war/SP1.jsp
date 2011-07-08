
<script type='text/javascript'>

function notEmpty(helperMsg){
	if(document.getElementById('n').value.length == 0 || document.getElementById('uro').value.length == 0 || document.getElementById('ure').value.length == 0){
		alert(helperMsg);
		
		return false;
	}
	return true;
}
</script>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>

<html>

   <link type="text/css" rel="stylesheet" href="/style.css" />   


  <H1 align="center" color="RED">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
   <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
   
  </H1>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING.....
  <br><br><br>
  </H2>

  <body>
  
  
  <br>
<table>
  <tr>
	<td width="400"><a href="/SIGNIN.jsp">HOME</a></td>
	<td width="400"><a href="/selectSub.jsp">STUDY RESOURCES</a> </td>
	<td width="400"><a href="/IBM-TGMC-FB.html">IBM - TGMC 2010</a> </td>
	<td width="400"><a href="/enterEmailForm.jsp">SUBMIT eMAIL ADDRESS</a> </td>
 </tr>	
</table>	<br>
  
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
	
		String uro=request.getParameter("URO");
		if(uro==null){
		response.sendRedirect("/SIGNIN.jsp");
		}
%>

<p>Hello, <%= user.getNickname() %>! (You can <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>

.)</p>



    <form onsubmit="return notEmpty('NAME, UNIVERSITY ROLL NUMBER and UNIVERSITY REGISTRATION NUMBER ARE MANDATORY FIELDS')" action="/Save" method="post" >	
       
	
	
    UNIVERSITY ROLL NO. <%= request.getParameter("URO") %>
	<INPUT type="HIDDEN" id ='uro'  value= <%=request.getParameter("URO")%> name="URO"> <BR>
	
	NAME<INPUT type="TEXT" name="NAME" id='n'><BR>  	  
	UNIVERSITY REGISTRATION NO.<INPUT  id ='ure' name="URE"><BR>	  
	DATE OF BIRTH: <INPUT TYPE="TEXT" NAME="DOB"><BR>
	BLOOD GROUP: <INPUT TYPE="TEXT" NAME="BG"><BR>
	GENDER: <INPUT TYPE="TEXT" NAME="GEN"><BR>
	PHONE: <INPUT TYPE="TEXT" NAME="PHONE"><BR>
        EMAIL-ADDRESS:<INPUT TYPE="TEXT" NAME="EMAIL"><BR>

	PERCENTAGE- 10TH BOARD EXAM:<INPUT TYPE="TEXT" NAME="P10"><BR>
	BOARD:<INPUT TYPE="TEXT" NAME="BOARD1"><BR>

	PERCENTAGE- 12TH BOARD EXAM:<INPUT TYPE="TEXT" NAME="P12"><BR>
	BOARD:<INPUT TYPE="TEXT" NAME="BOARD2"><BR>

	JEE/AIEEE/OTHERS RANK:<INPUT TYPE="TEXT" NAME="RANK"><BR>

	DEGREE GRADE POINT AVERAGE:<INPUT TYPE="TEXT" NAME="DGPA"><BR>

	  
	  
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



