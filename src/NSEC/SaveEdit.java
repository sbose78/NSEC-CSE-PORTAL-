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

public class SaveEdit extends HttpServlet{
    //private static final Logger log = Logger.getLogger(Save.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
		
		
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
         PrintWriter out = resp.getWriter();
		 out.println("<br><br><a href='/SIGNIN.jsp'>HOME</a>");	
        String name = req.getParameter("NAME");
	//	String uro = req.getParameter("URO");
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
		String id= req.getParameter("id");
		Long l;
		l=Long.parseLong(id);
		
        
        PersistenceManager pm = PMF.get().getPersistenceManager();
	
		
					Data e = pm.getObjectById(Data.class, l);
					e.setNAME(name);
					//e.setURO(uro);
					e.setURE(ure);
					e.setDOB(dob);
					e.setBG(bg);
					e.setGEN(gen);
					e.setPHONE(phone);
					e.setEMAIL(email);
					e.setBOARD1(board1);
					e.setBOARD2(board2);
					e.setRANK(rank);
					e.setDGPA(dgpa);
					e.setP10(p10);
					e.setP12(p12);
					
				

		
						pm.close();
							resp.sendRedirect("/DB.jsp");
		
	}		
		
    
}