
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
<%@ page import="NSEC.Discussion" %>
<%@ page import="NSEC.PMF" %>


<%
	
		 UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();   
		
		
if( user !=null)
{
%>
	HELLO <%= user.getNickname() %>! 
<%

	
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		Date date = new Date();
		
		URL url=new URL(user,request.getParameter("url"),date,0);
		
		pm.makePersistent(url);					
		
		pm.close();	
		
		pm = PMF.get().getPersistenceManager();
		
		
	
		Query query = pm.newQuery(URL.class);
		query.setFilter("URL == subParam");
		query.setOrdering("date desc");
		query.declareParameters("String subParam");
	
	
	
		//String query = "select from " + Data.class.getName() + " where NAME == 'NAYAN BOSE'";
		List<URL> urls = (List<URL>) query.execute(request.getParameter("url"));
		
			
		Iterator i = urls.iterator();
		URL u=(URL)i.next();
%>

The generated url is : 	<a href="http://nseccse3.appspot.com/u.jsp?u=<%=u.getId()%>">nseccse3.appspot.com/u.jsp?u=<%=u.getId()%> ></a>	
	
	
	
	
<%	}
	else
	{

%>

<br><br>	<a href="<%= userService.createLoginURL(request.getRequestURI()) %>"> SIGN IN USING YOUR GOOGLE ACCOUNT</a>
<%	
	}	
%>
	</body>
</html>
		
		
		
		
%>		