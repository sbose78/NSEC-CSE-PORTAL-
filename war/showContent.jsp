
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.*" %>

<%@ page import="javax.jdo.Query" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Topic" %>
<%@ page import="NSEC.Post" %>
<%@ page import="NSEC.PMF" %>
<%@ page import="com.google.appengine.api.datastore.Text"%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
<title>DISCUSSION BOARD</title>
<style type="text/css">
<!--
.style5 {
	font-style: italic;
	color: #000000;
	font-weight: bold;
}
.style6 {
	color: #CCCCCC;
	font-size: 24px;
}
.style7 {color: #330000}
.style8 {
	font-weight: bold;
	color: #330033;
	font-size: 18px;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>



<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
		String tid=request.getParameter("tid");
		String tname=request.getParameter("tname");
		if(tid==null){	
			response.sendRedirect("/showTopics.jsp");
		}
			
%>
<p>Hello, <%= user.getNickname() %>! (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>


<body>
 <h2 align="center">DISCUSSION BOARD</h2>
 <p align="center"><table width="999" height="35" border="0.005" align="center" bgcolor="#FFFFCC">
  <tr>
    <th scope="col"><a href="/SIGNIN.jsp">HOME</a></th>
    <th scope="col"><a href="/selectSub.jsp">STUDY RESOURCES </a></th>
    <th scope="col"><a href="/showTopics.jsp">FORUMS</a></th>
    <th scope="col"><a href="/IBM-TGMC-FB.html">IBM-TGMC 2010</a> </th>
    <th scope="col"><a href="/submitFile2.jsp">SHARE A <em>LINK</em></a></th>
    <th scope="col"><a href="/enterEmailForm.jsp">SUBMIT EMAIL ADDRESS TO DATABSE </a></th>
    <th scope="col">ABOUT</th>
  </tr>
</table>


	
 </p>
 <p align="center" class="style8">THREAD: (<%= tid %>) <%= tname %> :</p>
 <table width="1169" height="73" border="0.005" frame="box">
 
 
<%
		
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
	
	
		Query query = pm.newQuery(Post.class);
		query.setOrdering("date desc");
			
	query.setFilter("topicId == tid");
    //query.setOrdering("hireDate desc");
    query.declareParameters("String tid");
	
	
	
    //String query = "select from " + Data.class.getName() + " where NAME == 'NAYAN BOSE'";
    List<Post> post = (List<Post>) query.execute(tid);	
		
			
	
		
		if (!post.isEmpty()) {
			
			for (Post t : post){
				String cont= (t.getContent()).getValue();
			
%>

   <tr>
 <td width="80" align="left" bordercolor="#000000" bgcolor="#000033"> <span class="style6"><%=t.getAuthor() %> said,</span> &nbsp;</td>   
   </tr>
  
   <tr>
     <td width="100" height="60" bordercolor="#000033"> <em><strong><%= cont %> </strong></em>&nbsp;</td>
   </tr>
   
    
 
<%  		}
	}
	else{}
%>

</table>
 
 <form id="form1" name="form1" method="post" action="/insertContent.jsp">
   <p class="style5">&nbsp;</p>
   <blockquote>
     <p class="style5 style7"> COMMENT ON THIS THREAD</p>
    <div>
      <textarea name="content" cols="100" rows="10" wrap="physical"></textarea>
    </div>
       <p>
         <input type="submit" name="Submit" value="POST COMMENT " />
       </p>
 
   </p>
     <input type="hidden" name="tid" value="<%= tid %>" />
     <input type="hidden" name="tname" value="<%= tname %>" />
   </blockquote>
 </form>
 	
<%	
  }	
	else { 
	
		response.sendRedirect("/SIGNIN.jsp");
	}
%>


 <p>&nbsp;</p>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
</body>
</html>
