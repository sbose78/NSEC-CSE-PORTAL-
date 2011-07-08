package NSEC;

import java.io.*;
import java.util.*;

import javax.jdo.PersistenceManager;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import NSEC.Data;
import NSEC.PMF;

public class Save extends HttpServlet{
    //private static final Logger log = Logger.getLogger(Save.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
		
		
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
         PrintWriter out = resp.getWriter();
		 out.println("<HTML><br><br><a href='/SIGNIN.jsp'>HOME</a>");	
        String name = req.getParameter("NAME");
		String uro = req.getParameter("URO");
		String ure = req.getParameter("URE");
		String dob = req.getParameter("DOB");
		String bg = req.getParameter("BG");
		String gen= req.getParameter("GEN");
		String phone= req.getParameter("PHONE");
		String email= req.getParameter("EMAIL");
		String board1= req.getParameter("BOARD1");
		String board2 = req.getParameter("BOARD2");
		String rank = req.getParameter("RANK");
		String dgpa = req.getParameter("DGPA");
		String p10 = req.getParameter("P10");
		String p12 = req.getParameter("P12");
		
        Date date = new Date();
        Data data = new Data(user, name,uro,ure,dob,bg,gen,phone,email,board1,board2,rank,dgpa,p10,p12,date);

        PersistenceManager pm = PMF.get().getPersistenceManager();
        try {
            pm.makePersistent(data);
        } finally {
            pm.close();
        }
		
		
		String title = "THANK YOU FOR SUBMITTING USER INFORMATION";
out.println(
"<BODY BGCOLOR='WHITE'>"+"\n" +
"<H1 ALIGN=CENTER>" + title + "</H1>\n" +
"<TABLE BORDER=1 ALIGN=CENTER>\n" +
"<TR BGCOLOR='WHITE'>"+"\n" +
"<TH>Parameter Name<TH>Parameter Value(s)");
Enumeration paramNames = req.getParameterNames();
	String msgBody = "THANK YOU FOR FILLING UP THE FORM \n\n DO VISIT nseccse3.appspot.com \n\n for UPDATES :-) \n\n THE INFORMATION YOU ENTERED IS...(sorry for the sloppy presentation) \n\n  ";
	while(paramNames.hasMoreElements()) 
	{
		String paramName = (String)paramNames.nextElement();
		out.print("<TR><TD>" + paramName + "\n<TD>");
			String paramValue = req.getParameter(paramName);
			msgBody=msgBody +paramName+":"+ paramValue+"\n\n\n\n";
			if (paramValue.length() == 0)
				out.println("<I>No Value</I>");
			else
				out.println(paramValue);
		
	}
	
	
	out.println("</TABLE>\n</BODY></HTML>");
	 
		msgBody=msgBody+" \n\n\n Bye and have a great day...!";

     	Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);

        

        try {
            Message msg = new MimeMessage(session);
			String email1 = userService.getCurrentUser().getEmail();

            msg.setFrom(new InternetAddress(email1,"nseccse3.appspot.com") );
            msg.addRecipient(Message.RecipientType.TO,
                             new InternetAddress(user.getEmail()));
            msg.setSubject(" SUCCESSFUL INFORMATION SUBMISSION ");
            msg.setText( msgBody);
            Transport.send(msg);
    
       } catch (AddressException e) {
          //...
        }
		catch (MessagingException e) {
            // ...
      }
   
    
     // out.println("<a href='/OLD.jsp'>RETURN TO DATA FORM</a>");	
    }
}
