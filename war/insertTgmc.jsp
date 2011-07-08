

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>
<%@ page import="NSEC.TGMC" %>
<%@ page import="NSEC.Discussion" %>


<%@ page import="com.google.appengine.api.labs.taskqueue.Queue"%>
<%@ page import="com.google.appengine.api.labs.taskqueue.QueueFactory"%>

<%@ page import="static com.google.appengine.api.labs.taskqueue.TaskOptions.Builder.*"%>




<html>
	<H1 align="center" color="BLUE">  
	IBM – THE GREAT MIND CHALLENGE 2010
   
   
  
  </H1>   
  <H2 align="center">~~~~ The NETAJI SUBHASH ENGINEERING COLLEGE Chapter
  <br><br><br>
  </H2>
	<body>  
<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		PersistenceManager pm = PMF.get().getPersistenceManager();

		String login= request.getParameter("LOGIN");
		String name = request.getParameter("NAME");
		String dept= request.getParameter("DEPT");
		String year= request.getParameter("YEAR");
		String email= request.getParameter("EMAIL");
		String course= request.getParameter("COURSE");
		
		String content="DETAILS SUCCESSFULLY ADDED TO DATABASE \n\n\n YOUR IBM A/C DETAILS:\n\nIBM DISPLAY NAME :"+login+"\n\nNAME: "+name+"\n\nDEPT: "+dept+"\n\n IBM LOGIN ID: "+email+"\n\n\n keep these safely for your future reference \n\n  ALL THE BEST FOR ``IBM - THE GREAT MIND CHALLENGE 2010 ``  !!! ...Go All GUNS BLAZING !!!  \n\n Regards,\n\n nseccse3.appspot.com";
		String sub=" YOUR IBM TGMC 2010 REGISTRATION AT nseccse3.apppspot.com";
		
		
	

		dept=course+" "+dept;		
		Date date = new Date();
        TGMC tgmc= new TGMC(user,name,email,login,dept,year,date);
	
		
        try {
            pm.makePersistent(tgmc);
        } finally {
            pm.close();
        }  


			Queue queue = QueueFactory.getDefaultQueue();
			queue.add(url("/email-queue-send.jsp").param("emailid", user.getEmail()).param("subject",sub).param("content",content));
		
%>

<br><a href="/SIGNIN.jsp">HOME</a><BR><br>

<br>
<br><a href="/tgmc-info2.jsp"> RETURN TO IBM-THE GREAT MIND CHALLENGE... FOR NSEC</a><BR><br><br><br>
<LARGE>THANK YOU FOR POSTING YOUR IBM-TGMC LOGIN details INTO THE DATABASE,<br>YOU WILL BE NOTIFIED ABOUT 'IBM - EVENTS ' AT NETAJI SUBHASH ENGINNERING COLLEGE.<br><br>You successfully entered the following information.<br><br></LARGE>
<br><br>
<B>IBM DeveloperWorks DISPLAY NAME:<B><%=login%> <br><br>
<B>IBM login ID:<B><%=email%><br><br>
<B>NAME:<B><%=name%> <br><br>
<B>DEPT:<B><%=dept%><br><br>
<B>YEAR:<B><%=year%><br><br>

<br>



	</body>
</html>
