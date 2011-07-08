
<script type='text/javascript'>

function notEmpty(helperMsg){
	if(document.getElementById('n').value.length == 0 || document.getElementById('l').value.length == 0 || document.getElementById('e').value.length == 0 || document.getElementById('y').value.length == 0 || document.getElementById('c').value.length == 0){
		alert(helperMsg);
		
		return false;
	}
	return true;
}
</script>

<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script><script type="text/javascript">stLight.options({publisher:'cb1802af-537a-4be8-96c4-abfea7b3b89c'});</script>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.TGMC" %>
<%@ page import="NSEC.PMF" %>

<html>
  <H1 align="center" color="RED">  
   <MEDIUM>IBM – THE GREAT MIND CHALLENGE 2010</MEDIUM></H1>
   
   
  </H1>   
  <H2 align="center">~~~~~ The NETAJI SUBHASH ENGINEERING COLLEGE Chapter
  <br><br><br>
  </H2>

  <body>
  
  
 
   <br>
 <a href="/SIGNIN.jsp">HOME</a> 
 
 <br><br>
 <span class="st_twitter_large" displayText="Tweet"></span><span class="st_facebook_large" displayText="Facebook"></span><span class="st_ybuzz_large" displayText="Yahoo! Buzz"></span><span class="st_gbuzz_large" displayText="Google Buzz"></span><span class="st_email_large" displayText="Email"></span><span class="st_sharethis_large" displayText="ShareThis"></span>
<br><br>
  
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>

<p>Hello, <%= user.getNickname() %>! (You can <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>

.)</p>




    <form onsubmit="return notEmpty('ALL FIELDS ARE MANDANTORY')" action="/insertTgmc.jsp" method="post" >	
       
		
	YOUR NAME:<INPUT type="TEXT" name="NAME" id='n'><BR> <br> 	  
	
	<br> <a href="http://www-07.ibm.com/in/university/greatmind/tgmc.html">REGISTER AT THE IBM-TGMC for your IBM Display Name...</a><BR><BR>
	IBM DeveloperWorks DISPLAY NAME:<input type="TEXT" NAME="LOGIN" id='l'><BR><br>
	IBM LOGIN ID(EMAIL-ADDRESS used to login at IBM DeveloperWorks):<input type="text" NAME="EMAIL" id='e'><BR><br>

	COURSE:(BCA/MCA/M.TECH/B.TECH/):<input type="text" NAME="COURSE" id='c'><br><br>
	DEPT(BCA/MCA keep this space Blank):	<input NAME="DEPT" id='d' type="text" ><BR><br>
		
	YEAR(enter '1','2','3' or '4'):<input NAME="YEAR" id='y' type = "text" ><BR>
		 
	  
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
