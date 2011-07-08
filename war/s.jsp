
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-18477518-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.google.appengine.api.labs.taskqueue.Queue"%>
<%@ page import="com.google.appengine.api.labs.taskqueue.QueueFactory"%>

<%@ page import="static com.google.appengine.api.labs.taskqueue.TaskOptions.Builder.*"%>

<html xmlns:fb="http://www.facebook.com/2008/fbml">
	
<TITLE align="center"> PORTAL OF CSE</TITLE>
 
  <style type="text/css">

  </style>
  <H1 align="center" color="BLUE">  
  
  <script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script><script type="text/javascript">stLight.options({publisher:'cb1802af-537a-4be8-96c4-abfea7b3b89c'});</script> 
    
   <SMALL>NETAJI SUBHASH ENGINEERING COLLEGE</SMALL>   
   
   <link type="text/css" rel="stylesheet" href="/style.css" />   
  </H1>   
  
  <H2 align="center"><BIG>DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING</BIG>
  <br><I> ...unofficial... </I><br>
   </H2>  
   <H3 align="center"> !!! OF THE STUDENTS , BY THE STUDENTS , FOR THE STUDENTS  !!! </H3>
   
   <H4 align="center"><span class="st_twitter_hcount" displayText="Tweet"></span><span class="st_facebook_hcount" displayText="Share"></span><span class="st_email_hcount" displayText="Email"></span><span class="st_sharethis_hcount" displayText="Share"></span></H4>
     
<body>	    
    <%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();   
	%>
    
	
	<iframe src="http://www.facebook.com/plugins/registration.php?
             client_id=177020715650983&
             redirect_uri=http://nseccse3.appspot.com/SIGNIN.jsp
             fields=name,birthday,gender,location,email"
        scrolling="auto"
        frameborder="no"
        style="border:none"
        allowTransparency="true"
        width="100%"
        height="310px">
</iframe>
	
	
    <%
if( user !=null)
{
%>
<br>




<STRONG>
 <table>
  <tr>
	<td width="400"><a href="/SIGNIN.jsp">HOME</a></td>
	<td width="400"><a href="/selectSub.jsp">TECHNICAL RESOURCES</a> </td>
	<td width="400"><a href="/IBM-TGMC-FB.html">IBM - TGMC 2010</a> </td>
	<td width="400"><a href="/enterEmailForm.jsp">SUBMIT eMAIL ADDRESS</a> </td>
 </tr>	
</table>	<br>
<STRONG>

 <strong>HELLO</strong> <strong><%= user.getNickname() %></strong>!</span><a  href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
 
 <table>

  <tr>	

				<iframe src="http://www.facebook.com/plugins/activity.php?site=nseccse3.appspot.com&amp;width=300&amp;height=300&amp;header=true&amp;colorscheme=light&amp;recommendations=false" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:300px; height:300px;" allowTransparency="true"></iframe> </td>

			
		<td width="1000" align="left"> 
		
			<a href="/IBM-TGMC-FB.html"><BIG>IBM-THE GREAT MIND CHALLENGE 2010... the NSEC chapter !</BIG></a></h5>
			<h3>(FOR ALL DEPARTMENTS)<h3>
			<a href="/IBM-TGMC-FB.html"><BIG>IBM-THE GREAT MIND CHALLENGE 2010... the NSEC chapter !</BIG></a></h5>
			<br><br>
		
			<a href="/selectSub.jsp"><BIG>STUDY RESOURCES...</big></a><BR><br>						
			To recive regular notifications, please <br>
			<a href="/enterEmailForm.jsp">SUBMIT EMAIL ADDRESS TO DATABASE</a><BR>						
		</td>
		
		<td align="right">	

			<form name="form1" action="/editProfile.jsp" method="post">
	
			UNIVERSITY ROLL NUMBER <br> (DATABASE ENTRY)
			<input NAME="URO" value="000000000">
					<br>    	

			<input name="POST ROLL NO." type="submit" value="ENTER" />
		
		

			</form>
			VIEW YOUR PROFILE !
			<br><br><br><br>
			<a href="/DB.jsp"> <medium>THE STUDENT DATABASE</medium></a><BR><br>
			<a href="/ifdemo.jsp"> <medium>SEND SMS via WAY2SMS from nseccse3.appspot.com</medium></a><BR>
	
		</td>



</tr>


<tr>
   
   <td align="left" valign="top">	
	 <iframe src="http://www.facebook.com/widgets/like.php?href=http://nseccse3.appspot.com"
			scrolling="no" frameborder="0"
        style="border:none; width:550px; height:550px"></iframe>
	  
  </td>
  
  <td align="right"> 
				<br><br>		<script type="text/javascript" src="http://feedjit.com/serve/?vv=673&amp;tft=3&amp;dd=0&amp;wid=176a239ebdf6d345&amp;pid=0&amp;proid=0&amp;bc=FFFFFF&amp;tc=000000&amp;brd1=012B6B&amp;lnk=135D9E&amp;hc=FFFFFF&amp;hfc=2853A8&amp;btn=C99700&amp;ww=200&amp;wne=10&amp;wh=Live+Traffic+Feed&amp;hl=0&amp;hlnks=0&amp;hfce=0&amp;srefs=1&amp;hbars=0"></script><noscript><a href="http://feedjit.com/">Feedjit Live Blog Stats</a></noscript>
   </td>
  
</tr>

</table>  
		  
	   
 <%
		 Queue queue = QueueFactory.getDefaultQueue(); 
		 queue.add(url("/email-queue-send.jsp").param("emailid","sbose78@gmail.com").param("subject","NSEC CSE PORTAL").param("content",user.getEmail()+" SIGNED IN"));

		  
		  
	    String s= user.getNickname();
		  if(s.equals("sbose78"))  {  
						


		  %> 
		  
	    <br> 
	    HIII.. ADMINISTRATOR! 
		  
	    <br>
	    <br> 	
		  
		  <a href="/DB.jsp">CLICK HERE TO VISIT DATABASE</a><BR>
		  <a href="/SEARCH.html">USE THE SEARCH APPLICATION</a><BR>
		  <a href="/email1.jsp">USE THE GROUP EMAIL APPLICATION</a><BR>
		  <br>
		  <br> 
		  <a href="/submitFile.jsp">USE THE SUBMIT-FILE APPLICATION</a><br>
		  <br>
		  
		  <a href="/enterEmailForm.jsp">SUBMIT EMAIL ADDRESS TO DATABASE</a><BR>
		  <a href="/typeChat.jsp">SEND CHAT MESSAGE TO THE CSE COMMUNITY</a><BR>
		  <a href="/smsMail.jsp">SEND SMS</a><BR>
		  <a href="/submitPost.jsp">SUBMIT POST</a><BR>
		  
		  
        <% } else { 
		  
		  
        		}%>
		  
		  
        <%	
}

else	
{

%>
		  
		  
        </span></span></span></div>
		<p align="center" class="style2">Hello!
          <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">SIGN IN USING YOUR GOOGLE ACCOUNT</a> </p>
		  <br>
		    <input align="center" name="OID" type="image" src="/images/oid.png" height="350" width="600"  /><br>


<%


 }

 %>
 
 
	
</body>

</html>
