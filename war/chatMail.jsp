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


<%@ page import="com.google.appengine.api.xmpp.JID"%>
<%@ page import="com.google.appengine.api.xmpp.Message"%>
<%@ page import="com.google.appengine.api.xmpp.MessageBuilder"%>
<%@ page import="com.google.appengine.api.xmpp.SendResponse"%>
<%@ page import="com.google.appengine.api.xmpp.XMPPService"%>
<%@ page import="com.google.appengine.api.xmpp.XMPPServiceFactory"%>


<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.Emails" %>
<%@ page import="NSEC.PMF" %>


<html>
  <H1 align="center" color="RED">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
  </H1>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br><br><br>
  </H2>

  <body>
    
  <input name="COLLEGE" type="image" src="/aba.jpg" height="400" width="400"  />
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
	
	//int s=Integer.parseInt(request.getParameter("START"));
	//int f=Integer.parseInt(request.getParameter("FINISH"));
	
//	q.setRange(s-1,f);
	JID jid ;
     List<Emails> emails = (List<Emails>) q.execute();
  if (!emails.isEmpty()) 
	{
		for (Emails e : emails) 
		{  
%>

<br><br>
<%=e.getEmailid()%>

<br>





<%
			jid = new JID(e.getEmailid());
  		      String msgBody = request.getParameter("CHAT");
  		      Message msg = new MessageBuilder().withRecipientJids(jid).withBody(msgBody).build();
  	              
  	 		boolean messageSent = false;
			XMPPService xmpp = XMPPServiceFactory.getXMPPService();
			xmpp.sendInvitation(jid);
  		      if (xmpp.getPresence(jid).isAvailable()) {
  		          SendResponse status = xmpp.sendMessage(msg);
  		          messageSent = (status.getStatusMap().get(jid) == SendResponse.Status.SUCCESS);
%>	
			YIPPEEEE!..............................................................................................................!

<%
        	        }
		       else {
%>

NOPE

<%
        	       }
		       if (!messageSent) {
            // Send an email message instead...
	    		}
			else{
			}
		}
     }
	else{ }

   } 
	else {
%>

<br><br>


<p>Hello!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign into google acc</a>
</p>
<%
    }
%>

  </body>
</html>




