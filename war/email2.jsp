<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    String query = "select from " + Data.class.getName() ;
    List<Data> datas = (List<Data>) pm.newQuery(query).execute();
    if (!datas.isEmpty()) 
	{
		for (Data d : datas) 
		{
%>

<br><br>

<%= d.getEMAIL() %><br>

<%
			Properties props = new Properties();
			Session sess = Session.getDefaultInstance(props, null);

			
			try {
				Message msg = new MimeMessage(sess);
				String email = d.getEMAIL();

				msg.setFrom(new InternetAddress(userService.getCurrentUser().getEmail()));
				msg.addRecipient(Message.RecipientType.TO,new InternetAddress(email));
				msg.setSubject(request.getParameter("subject"));
				msg.setText( request.getParameter("content"));
				Transport.send(msg);
			} 
			catch (AddressException e) {
				//...
			}
			catch (MessagingException e) {
				// ...
			}
			
	    } 	//for
		
    }  		// not empty
	else{  }
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



