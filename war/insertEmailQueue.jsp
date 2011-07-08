<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.*" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>
<%@ page import="NSEC.Emails" %>

<html>
  <H1 align="center" color="BLUE">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
  </H1>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br><br><br>
  </H2>

  <body>  
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    
%>

<%
   
		
%>

<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
	Date date = new Date();
	//String emailid = request.getParameter("emailid");
    Emails emails = new Emails(user,request.getParameter("emailid"),date);
	
		
        try {
            pm.makePersistent(emails);
        } finally {
            pm.close();
        }
%>
<br><br>

you successfully inserted
<%=request.getParameter("emailid")%><br>

<a href="/enterEmailForm.jsp">ENTER ANOTHER EMAIL ADDRESS</a><BR><br><br>
<a href="/SIGNIN.jsp">HOME</a><BR>



	</body>
</html>