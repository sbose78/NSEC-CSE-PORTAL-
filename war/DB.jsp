<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>

<html>


  <body>

  
  
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
	
		
//response.reset();
//response.setHeader("Content-type","application/vnd.ms-excel");
//response.setHeader("Content-disposition","inline; filename=Detail.xls");
        } else { }
		
		
		out.println(
"<BODY BGCOLOR='WHITE'>\n" +
"<H1 ALIGN=CENTER>"+"</H1>\n" +
"<TABLE BORDER=1 ALIGN=CENTER>\n" +
"<TR BGCOLOR='BLUE'>\n" +
"<TH>AUTHOR<TH>NAME<TH>UNIVERSITY ROLL NO.<TH>UNIVERSITY REGISTRATION NO.<TH>BLOOD GROUP<TH>DATE OF BIRTH<TH>GENDER<TH>CLASS 10 BOARD<TH>CLASS 12 BOARD<TH>DGPA");


		
		
%>

<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    String query = "select from " + Data.class.getName() ;
    List<Data> datas = (List<Data>) pm.newQuery(query).execute();
    if (datas.isEmpty()) {
%>
<p> THIS HAS TO BE FILLED YET </p>
<%
    } else {
        for (Data d : datas) {
            if (d.getAuthor() == null) {
%>
<%--<p>An anonymous person wrote:</p> --%>
<%
            } else {
%>
<%--<p><b><%= d.getAuthor().getNickname() %></b> wrote:</p> --%>
<%
            }
%>
<%



		

out.println("<TR><TD>" +d.getAuthor().getNickname()+"\n<TD>"+ d.getNAME() + "\n<TD>"+d.getURO()+"\n<TD>"+d.getURE()+"\n<TD>"+d.getBG()+"\n<TD>"+d.getDOB() +"\n<TD>"+ d.getGEN() +"\n<TD>" +d.getBOARD1() +"\n<TD>"+d.getBOARD2() +"\n<TD>"+d.getDGPA());


%>

<%--
NAME:---<%= d.getNAME() %><br>
UNIVERSITY ROLL NO.---<%= d.getURO() %><br>
UNIVERSITY REGISTRATION NO.---<%= d.getURE() %><br>
BLOOD GROUP.---<%= d.getBG() %><br>
DATE OF BIRTH.---<%= d.getDOB() %><br>
GENDER.---<%= d.getGEN() %><br>
CLASS 10 BOARD.---<%= d.getBOARD1() %><br>
PERCENTAGE (class 10).---<%= d.getP10() %><br>
CLASS 12 BOARD.---<%= d.getBOARD2() %><br>
PERCENTAGE (class 12).---<%= d.getP12() %><br>
RANK---<%= d.getRANK() %><br>
DGPA---<%= d.getDGPA() %><br><br><br>

--%>

<%
        
		
		}
    }
	out.println("</TABLE>\n</BODY></HTML>");
    pm.close();
%>
</body>
</html>