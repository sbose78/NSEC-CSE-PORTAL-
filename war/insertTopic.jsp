<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.*" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>
<%@ page import="NSEC.Topic" %>

<html>
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) 
	{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Date date = new Date();
		String topic1 = request.getParameter("topic");
		String content=request.getParameter("content");
		String creator=request.getParameter("creator");
		
		Topic topic=new Topic(user, topic1, "GENERAL",creator , date);
		
        try {
            pm.makePersistent(topic);
        }
		finally {
            pm.close();
        }
		
		pm = PMF.get().getPersistenceManager();
		
		response.sendRedirect("/showTopics.jsp");
	}
	else {
	
	}
		
%>

<a href="/SIGNIN.jsp">HOME</a><BR>



	</body>
</html>