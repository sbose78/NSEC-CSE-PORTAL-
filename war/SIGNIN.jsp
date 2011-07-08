


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">

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


<%@ page contentType="text/html;charset=iso-8859-1" language="java" %>
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



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<TITLE align="center"> PORTAL OF CSE...........  
</TITLE>
<style type="text/css">
<!--
.style34 {color: #00FFCC}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<style type="text/css">
<!--
body,td,th {
	color: #330000;
}
body {
	background-color: #FFFFFF;
}
.style2 {color: #660000}
.style3 {
	color: #660099;
	font-weight: bold;
}
.style6 {font-size: 18px}
.style10 {font-weight: bold}
.style11 {font-weight: bold}
.style14 {
	color: #FFFF99;
	font-weight: bold;
}
.style15 {color: #FFFFCC}
.style16 {
	color: #660000;
	font-size: 18px;
	font-weight: bold;
}
.style17 {color: #000033}
.style19 {color: #000066}
.style22 {color: #FFFFCC; font-weight: bold; }
.style23 {color: #660099}
.style24 {color: #000000}
.style25 {
	color: #000000;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-style: italic;
}
.style26 {
	font-style: italic;
	color: #000033;
	font-weight: bold;
}
.style31 {color: #FF0000}
.style32 {color: #000000; font-weight: bold; }
-->
</style></head>
   
<body>
<blockquote>
  <blockquote>
    <p><img src="images/fin1.JPG" width="1023" height="237" /></p>
    <blockquote>
      <%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();   
if( user !=null)
{
	 Queue queue = QueueFactory.getDefaultQueue(); 
queue.add(url("/email-queue-send.jsp").param("emailid","sbose78@gmail.com").param("subject","NSEC CSE PORTAL").param("content",user.getEmail()+" SIGNED IN"));
 	  
	    String s= user.getNickname();

						
		
			
%>
    </blockquote>
  </blockquote>
  <p align="justify" class="style16"><span class="style17">Aloha</span> , <%= user.getNickname() %> !<a  href="<%= userService.createLogoutURL(request.getRequestURI()) %>">(sign out</a>) </p>
</blockquote>



  <td align="left" valign="top">
    <table width="1200" height="35" border="0.005" align="center" bordercolor="#000000" bgcolor="#FFFFCC">
      <tr>
        <th width="50" bgcolor="#FFFF66" scope="col"><a href="/SIGNIN.jsp">HOME</a></th>
		<th width="50" bgcolor="#FFFF66" scope="col"><a href="/results.jsp">RESULTS </a></th>
        <th width="177" bgcolor="#FFFF99" scope="col"><a href="/selectSub.jsp" class="style24 style34">STUDY RESOURCES </a></th>
        <th width="184" bgcolor="#FFFF66" scope="col"><a href="/showTopics.jsp">DISCUSSION BOARD</a></th>
        <th width="180" bgcolor="#FFFF99" scope="col"><a href="/IBM-TGMC-FB.html" class="style24">IBM-TGMC 2010</a> </th>
        <th width="128" bordercolor="#FFFFCC" bgcolor="#FFFF66" scope="col"><a href="/submitFile2.jsp"><span class="style23">SHARE A <em>LINK</em></span></a></th>
        <th width="347" bgcolor="#FFFF99" scope="col"><a href="/enterEmailForm.jsp" class="style24">SUBMIT EMAIL ADDRESS TO DATABSE </a></th>
        <th width="104" scope="col">ABOUT</th>
      </tr>
    </table>
    
<table width="1202" height="486" border="0" align="center" bgcolor="#FFFFCC">
  <tr bgcolor="#000000">
    <th width="545" height="42" bgcolor="#000033"><span class="style15">STAYING CONNECTED.... </span></th>
    <td width="647" bgcolor="#000033"><blockquote>
      <blockquote>
        <p class="style14" align="center"> BIODATA &amp; ACADEMIC DETAILS </p>
        </blockquote>
    </blockquote></td>
  </tr>
  <tr>
    <td height="72"><ul><li class="style24"><strong>ADD THE ChatBOT <span class="style31">nseccse3@appspot.com</span> to your GTalk contact list. You will recieve updates only if you are online .<br>
      <br > ( Only Offline and Invisible modes NOT supported) </strong></li>
    </ul>      
      <ul class="style10">
        <li class="style24">Subscribe to the mailing list:      </li>
      </ul>
      <blockquote class="style11">
      <p> <a href="/enterEmailForm.jsp">SUBMIT  EMAIL ADDRESS TO DATABASE </a></p>
    </blockquote>      <p>&nbsp;  </p></td>
    <td><blockquote>
      <form id="form1" name="form1" method="post" action="/editProfile.jsp">
        <p algin align="center">
          <input type="text" name="URO" value="000000" />
          </p>
        <p align="center">( WBUT ROLL NUMBER here)      <input type="submit" name="Submit" value="..GO.." />
</p>
        </form>
      <p align="center" class="style32">If you have entered information before, ENTER your WBUT ROLL NUMBER and HIT &quot;..go..&quot;</p>
      <p align="center"><a href="/DB.jsp"> VIEW STUDENT DETAILS. </a></p>
    </blockquote>      </td>
  </tr>
  <tr>
    <td height="31" bgcolor="#000000"><blockquote>
      <blockquote>
        <p class="style15" align="center"><strong>STUDY </strong><strong>RESOURCES </strong></p>
      </blockquote>
    </blockquote></td>
    <td bgcolor="#000000"><blockquote>
      <blockquote>
        <blockquote>
          <blockquote>
            <p align="center" class="style22" style="background-color:#000000">DISCUSSION BOARDS </p>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote></td>
  </tr>
  
  <tr>
    <td height="211"><ul>
      <li class="style6"> <span class="style17">SUBJECT WISE <strong><em>KNOWLEDGE  RESOURCES </em></strong></span>.
          <a href="/selectSub.jsp"><strong>Click here</strong></a>
          <blockquote>
            <blockquote>
              <blockquote>
                <p>&nbsp;</p>
                </blockquote>
              </blockquote>
            </blockquote>
        </li>
      
        <li class="style6"><strong>Contribute a link. <a href="/submitFile2.jsp">Click here</a></strong></li>
    </ul>      
      <p>&nbsp;</p></td>
    <td><blockquote>
      <blockquote>
        <blockquote>
          <p class="style17"><strong>THE DISCUSSION BOARDS ARE UP. YOU MAY </strong></p>
          <p class="style17"><strong><em><a href="/showTopics.jsp">GO TO THE DISCUSSION BOARDS </a>.</em></strong></p>
          <p class="style17">&nbsp;</p>
          </blockquote>
      </blockquote>
    </blockquote></td>
  </tr>
</table>


<p>
  <%

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
  <%
		  
	}		
}
else{
%>
</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p align="left" class="style2">Hello!
          <a href="<%= userService.createLoginURL(request.getRequestURI()) %>"><strong>SIGN IN USING YOUR GOOGLE ACCOUNT</strong></a> </p>
		  <p><br>
		      <br />
		    <br />
</p>
		    </hr>
		    <input align="center" name="OID" type="image" src="/images/oid.png" height="350" width="600"  />
		    <br>
		    
            <%

}

%>			
</p>
		  <p>&nbsp;          </p>
		  <blockquote>
  <blockquote>
    <blockquote>
      <blockquote>
        <blockquote>
          <blockquote>
            <blockquote>
              <blockquote>
                <blockquote>
                 
                  <p align="center" class="style3 style19">DEVELOPED by S.BOSE (sbose78@gmail.com) </p>
                  <p align="center" class="style3 style19"><span class="style23"><a rel="license" href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a><br />
                    This <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" rel="dct:type">work</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 Unported License</a>. </span></p>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </blockquote>
</blockquote>
</body>
</html>
