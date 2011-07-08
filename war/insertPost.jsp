<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.*" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>
<%@ page import="NSEC.Discussion" %>

<html>
	<H1 align="center" color="BLUE">  <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG> </H1>   
	<H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING <br><br><br> </H2>

	<body>  
<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		PersistenceManager pm = PMF.get().getPersistenceManager();

		String topic = request.getParameter("TOPIC");
		String subject = request.getParameter("SUBJECT");
		String content= request.getParameter("CONTENT");
		
		
		
		

		Date date = new Date();
        Discussion discussion= new Discussion(user,content,subject,topic,date);
	
		
        try {
            pm.makePersistent(discussion);
        } finally {
            pm.close();
        }
		
		
		response.sendRedirect("/showFiles2.jsp?sub="+subject);
		
%>

<br>
YOUR CONTENT <%= content %> HAS BEEN POSTED...
<br>

	<form  action="/showFiles2.jsp" method="post" >       
	
	<INPUT type="hidden" name="sub" value="<%=subject%>" ><BR>  	  
		
	<div><input type="submit" value="CONTINUE...." /></div>
	
    </form>



<a href="/SIGNIN.jsp">HOME</a><BR>


	</body>
</html>