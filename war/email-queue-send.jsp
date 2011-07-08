
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

<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.internet.AddressException"%>
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
    
   <br>
 <a href="/SIGNIN.jsp">HOME</a> 
  
<%
		//	User user=new User("sbose78@gmail.com","gmail.com");
			
			Properties props = new Properties();
			Session sess = Session.getDefaultInstance(props, null);

			try {
				Message msg = new MimeMessage(sess);
				//String email = request.getParameter("emailid");

            msg.setFrom(new InternetAddress("sbose78@gmail.com","nseccse3.appspot.com(Shoubhik Bose)" ));


				msg.addRecipient(Message.RecipientType.TO,new InternetAddress(request.getParameter("emailid")));
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
			
			

	    //for
%>

  </body>
</html>



