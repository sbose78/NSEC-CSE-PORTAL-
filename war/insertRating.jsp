
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
<%@ page import="NSEC.URL2" %>
<%@ page import="NSEC.Formatting" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="com.google.appengine.api.datastore.Text"%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CSE PORTAL</title>

</head>



<%
    
    /* UPDATES RATING IN THE DATABASE  and redirects it to the recommend.jsp */
	
	
		String id=request.getParameter("id");
		Long l=Long.parseLong(id);
		
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		URL2 u  = pm.getObjectById(URL2.class, l);
		
		int rating= u.getRating();
		//String url=u.getUTL();
		rating++;
		u.setRating(rating);
		
		pm.close();
		
		
		response.sendRedirect("/recommend.jsp?id="+id);
		
%> 




</body>
</html>
