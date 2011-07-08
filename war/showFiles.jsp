<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script><script type="text/javascript">stLight.options({publisher:'cb1802af-537a-4be8-96c4-abfea7b3b89c'});</script>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>
<%@ page import="NSEC.URL2" %>

<html>

  <H3 align="center" color="BLUE">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
  </H3>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br><br><br>
  </H2>
  
  <br><br><table width="999" height="35" border="0.005" align="center" bgcolor="00000">
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
	
	
  
  <body> 
  <br><br>
  <span class="st_twitter_large" displayText="Tweet"></span><span class="st_facebook_large" displayText="Facebook"></span><span class="st_ybuzz_large" displayText="Yahoo! Buzz"></span><span class="st_gbuzz_large" displayText="Google Buzz"></span><span class="st_email_large" displayText="Email"></span><span class="st_sharethis_large" displayText="ShareThis"></span>

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>
<p>Hello, <%= user.getNickname() %>! (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
    
	
		
%>

<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    String query = "select from " + URL2.class.getName()+" order by date desc"  ;
    List<URL2> notes = (List<URL2>) pm.newQuery(query).execute();
    if (notes.isEmpty()) {
%>
<p> THIS HAS TO BE FILLED YET </p>


<%
    } 
	else
	{
	
%>

<table frame="box" width="1200">

  <tr>
    <th>TOPIC</th>
	<th>IS THE LINK COOL?</th>
    <th>URL</th>
    <th>SOURCE</th>
	<th>DATE</th>
	<th> POSTED BY </th>
  </tr>

  <%
        for (URL2 n : notes)
		{
%>
<tr>
   <td valign="middle"><%= n.getTopic() %></td>
   
    <td valign="middle" align="right">  
	
	<iframe src="/recommend.jsp?id=<%=n.getId()%>"
				scrolling="no" frameborder="0"
				style="border:none; width:150px; height:30px">
			</iframe> 
	
	</td>
   
	<td valign="middle"><a href="<%= n.getURL() %>"> CLICK HERE  </a></td>
    <td valign="middle"><%=n.getTeacher() %> </td>
    <td valign="middle"><%= n.getDate() %></td>
	<td valign="right"><%= n.getAuthor() %></td>
	
	
</tr>
<%
        }
    }	
    pm.close();
%> </table>

<%	
  }
  else
  {
%>
		<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">SIGN IN USING YOUR GOOGLE ACCOUNT</a>
<%	
  }	
%>
<br>
 
<iframe src="http://www.facebook.com/widgets/like.php?href=http://nseccse3.appspot.com/showFiles.jsp"
        scrolling="no" frameborder="0"
        style="border:none; width:550px; height:80px"></iframe>

	</body>
</html>