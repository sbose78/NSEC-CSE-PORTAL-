



<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script><script type="text/javascript">stLight.options({publisher:'cb1802af-537a-4be8-96c4-abfea7b3b89c'});</script>

<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.*" %>

<%@ page import="javax.jdo.Query" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Topic" %>
<%@ page import="NSEC.Discussion" %>
<%@ page import="NSEC.PMF" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>DISCUSSION BOARDS</title>
<style type="text/css">
<!--
.style1 {color: #CCCCCC}
.style2 {font-family: Geneva, Arial, Helvetica, sans-serif}
-->
</style>
</head>
<body>




<h1 align="center" class="style2">DISCUSSION BOARD </h1>




<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {

%>


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


<p>Hello, <%= user.getNickname() %>! (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>




<form id="form1" name="form1" method="post" action="/insertTopic.jsp" >
  <p align="center"><strong>TOPIC</strong>
    <input type="text" name="topic" width="1000" maxlength="1000" />
  </p>
     <label></label>
  <p align="center">
    <label>
    <input type="submit" name="Submit" value="CREATE THE NEW TOPIC" width="" />
    </label></p>
</form>



<%
		
	 
		PersistenceManager pm = PMF.get().getPersistenceManager();
	
	
		Query query = pm.newQuery(Topic.class);
		query.setOrdering("date desc");
			
	
	
		//String query = "select from " + Data.class.getName() + " where NAME == 'NAYAN BOSE'";
		List<Topic> topic = (List<Topic>) query.execute();
	
		if (topic.isEmpty()) {
%>

<BR> NO TOPICS CREATED. <br>

<%      }  
else {	 
 %>
 


<table width="1030" height="124" border="0.005" align="center">
  <tr bgcolor="#000033">
    <th width="316" height="50" scope="col"><span class="style1">TOPIC</span></th>
    <th width="249" scope="col"><span class="style1">AUTHOR</span></th>
    <th width="226" scope="col"><span class="style1">DATE </span></th>
    <th width="221" scope="col"><span class="style1">REPLIES</span></th>
  </tr>
  
 <% 
  
				for (Topic t : topic){


 %>
  <tr>
    <td height="68">
	<a href="/showContent.jsp?tid=<%=t.getId()%>&tname=<%= t.getTopicName() %>" ><%=	t.getTopicName()  %></a></td>
	
	</td>
    <td><%= t.getAuthor() %>&nbsp;</td>
    <td> <%= t.getDate() %>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<%
	           }
	}
}	
	else{  

		response.sendRedirect("/SIGNIN.jsp");
	}
%>  
  
</table>
<p> <p align="center" class="style23"><a rel="license" href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a><br />This <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" rel="dct:type">work</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 Unported License</a>. </p> </p>
</body>
</html>
