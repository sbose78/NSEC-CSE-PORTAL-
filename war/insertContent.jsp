
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
    User user = userService.getCurrentUser();
    if (user != null) {
		String tid=request.getParameter("tid");
		String tname=request.getParameter("tname");
		String content=new String(request.getParameter("content"));
		if(tid==null || content==null){	
			response.sendRedirect("/showTopics.jsp");
		}
		/*
		String processed=new String();
		String temp=new String();
		
		processed="<br>";
		
		StringTokenizer strtok=new StringTokenizer(content,"\n");
		
		while(strtok.hasMoreTokens()){
			temp=strtok.nextToken();
			processed+=temp;
			processed+="<br>";
		}  */
		
		
		String processed=new String();
		
		Formatting ft=new Formatting(content);
		processed=ft.applyFormattingnbsp();
		
		
		Text txt=new Text(processed);
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Date date = new Date();
			
		Post post=new Post(user,txt,tid,date);
		
        try {
            pm.makePersistent(post);
        }
		finally {
            pm.close();
        }	
		response.sendRedirect("/showContent.jsp?tid="+tid+"&tname="+tname);			
	}
			
	else { 
	
		response.sendRedirect("/SIGNIN.jsp");
	}
%> 
</body>
</html>
