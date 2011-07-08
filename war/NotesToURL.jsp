
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
		
		//Date date = new Date();
		
		URL url;
		
		Query query = pm.newQuery(Notes.class);
		query.setOrdering("date desc");
		
		List<Notes> notes = (List<Notes>) query.execute();
	
		for (Notes n : notes)
		{
			url=new URL(n.getAuthor(),n.getURL(),n.getDate(),0);			
			pm.makePersistent(url);					
		}
		pm.close();	
		
				
		
%>		