
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
<%@ page import="java.util.Date" %>
<%@ page import="com.google.appengine.api.datastore.Text"%>


<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>CSE PORTAL</title>
<style type="text/css">
<!--
.style2 {color: #FFFFFF}
.style3 {
	color: #330000;
	font-weight: bold;
}
.style5 {
	font-style: italic;
	color: #000000;
	font-weight: bold;
}
-->
</style>
</head>



<%
    UserService userService = UserServiceFactory.getUserService();
   
	 PersistenceManager pm = PMF.get().getPersistenceManager();
	Query query = pm.newQuery(Post.class);
    //query.setFilter("height > maxHeightParam");
    //query.declareParameters("int maxHeightParam");
    query.deletePersistentAll();
		
%>

successful
 
</body>
</html>
