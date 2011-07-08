

<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script><script type="text/javascript">stLight.options({publisher:'cb1802af-537a-4be8-96c4-abfea7b3b89c'});</script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.*" %>

<%@ page import="javax.jdo.Query" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.URL2" %>
<%@ page import="NSEC.Discussion" %>
<%@ page import="NSEC.PMF" %>

<html>
	<link type="text/css" rel="stylesheet" href="/style.css" />
  <H2 align="center" color="BLUE">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
  </H2>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br>
  </H2><br><br><table width="999" height="35" border="0.005" align="center" bgcolor="00000">
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
  <br><br>
  
  
  
  
  
177020715650983


<table>

<td width="700"></td>
<td>


</td></table> 
  

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
	String sub = request.getParameter("sub");
	
    if (user != null) 
	{
		
		if(sub==null)  response.sendRedirect("/selectSub.jsp");

	
%>
<p>Hello, <%= user.getNickname() %>! (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>

<%
		
	 
		PersistenceManager pm = PMF.get().getPersistenceManager();
	
	
		Query query = pm.newQuery(URL2.class);
		query.setFilter("NAME == subParam");
		query.setOrdering("date desc");
		query.declareParameters("String subParam");
	
	
	
		//String query = "select from " + Data.class.getName() + " where NAME == 'NAYAN BOSE'";
		List<URL2> notes = (List<URL2>) query.execute(sub);
	
		if (notes.isEmpty()) {
%>
<p> THERE ARE NO FILES UPLOADED FOR : <%=sub%>   :-( 
 <br>KEEP VISITING nseccse3.appspot.com FOR UPDATES   :-)   HAVE A GOOD DAY !!! </p>
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
%></table>
<%	
		}	
		//pm.close();
    	//pm = PMF.get().getPersistenceManager();
	
	
		query = pm.newQuery(Discussion.class);
		query.setFilter("subject == subParam");
		query.setOrdering("date desc");
		query.declareParameters("String subParam");
	
		List<Discussion> discussions = (List<Discussion>) query.execute(sub);
%>

<div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#appId=177020715650983&amp;xfbml=1"></script><fb:comments numposts="10" width="425" publish_feed="true"></fb:comments>

<br><br>
<%
	}
	else
	{
%>


<br><br>	<a href="<%= userService.createLoginURL(request.getRequestURI()) %>"> SIGN IN USING YOUR GOOGLE ACCOUNT</a>
<%	
	}	
%>
	</body>
</html>