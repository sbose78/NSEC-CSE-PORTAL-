
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>
<%@ page import="NSEC.Notes" %>
<%@ page import="NSEC.URL" %>

<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.*" %>

<%@ page import="javax.jdo.Query" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Topic" %>
<%@ page import="NSEC.URL" %>
<%@ page import="NSEC.Discussion" %>
<%@ page import="NSEC.PMF" %>


<%
	
	
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String ids=request.getParameter("u");
		Long id=Long.parseLong(ids);
		
		URL u  = pm.getObjectById(URL.class,id);
		
		response.sendRedirect("http://"+u.getURL());
		pm.close();
		
		
		
	
%>
	</body>
</html>
		
		
		
		
%>		