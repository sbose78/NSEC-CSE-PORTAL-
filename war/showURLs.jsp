
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
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
<%@ page import="NSEC.Discussion" %>
<%@ page import="NSEC.PMF" %>

<%
			PersistenceManager pm = PMF.get().getPersistenceManager();
			
		Query query = pm.newQuery(URL.class);
		
	
	
		pm = PMF.get().getPersistenceManager();
		
		
		query = pm.newQuery(URL.class);
		query.setOrdering("date desc");
		
		List<URL> urls = (List<URL>) query.execute();
		
		
		
		for (URL u : urls){
			
%>
			<br><br> <a href="<%= u.getURL() %>">CLICK HERE <%=u.getId()%></a>  <br>
			<iframe src="/recommend.jsp?id=<%=u.getId()%>"
				scrolling="no" frameborder="0"
				style="border:none; width:350px; height:30px">
			</iframe> 

<%
		}
		
		pm.close();
%>		
		