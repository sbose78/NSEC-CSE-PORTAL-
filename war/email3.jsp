
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %> 

<%@ page import="javax.jdo.*" %>
<%@ page import="javax.jdo.Query" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="javax.mail.*"%>
<%@ page import="NSEC.PMF" %>
<%@ page import="NSEC.Emails" %>


<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.jdo.Query" %>
<%@ page import="javax.mail.Session" %>

<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="javax.mail.*"%>

<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.internet.AddressException"%>

<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Session"%>


<%@ page import="javax.mail.MessagingException"%>


<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>

<html>
  <H1 align="center" color="RED">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
  </H1>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br><br><br>
  </H2>

  <body>
    
  <input name="COLLEGE" type="image" src="/Image0652.jpg" height="100" width="100"  />
   <br>
 <a href="/SIGNIN.jsp">HOME</a> 
  
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) 
	{
%>

<p>Hello, <%= user.getNickname() %>! (You can <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>

.)</p>


<%
  //  String msgbody= request.getParameter("content");
	PersistenceManager pm = PMF.get().getPersistenceManager();
    String query = "select from " + Emails.class.getName() ;
	
	Query q = pm.newQuery(query);
	
	int s=Integer.parseInt(request.getParameter("START"));
	int f=Integer.parseInt(request.getParameter("FINISH"));
	
	q.setRange(s-1,f);
	
    List<Emails> emails = (List<Emails>) q.execute();
    if (!emails.isEmpty()) 
	{
		for (Emails e : emails) 
		{
%>

<br><br>

<%= e.getEmailid() %><br>

<%
			
		        for(int a=0;a<60000;a++)
					;
				
			
			Properties props = new Properties();
			Session sess = Session.getDefaultInstance(props, null);


			try {
				Message msg = new MimeMessage(sess);
				String email = e.getEmailid();

				msg.setFrom(new InternetAddress(userService.getCurrentUser().getEmail()));
				msg.addRecipient(Message.RecipientType.TO,new InternetAddress(email));
				msg.setSubject(request.getParameter("subject"));
				msg.setText( request.getParameter("content"));
				Transport.send(msg);
				
					
            } 
			catch (AddressException ee) {
			//
			}
			catch (MessagingException ee) {
            // ...
			}
			
			

	    }//for
    }// not empty
   }	
	else {
%>
<p>Hello!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign into google acc</a>
</p>
<%
    }
%>

  </body>
</html>



