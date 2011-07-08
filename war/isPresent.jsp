<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.*" %>

<%@ page import="javax.jdo.Query" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="NSEC.Data" %>
<%@ page import="NSEC.PMF" %>

<html>
 <H1 align="center" color="BLUE">  
   <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG>
  </H1>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br><br><br>
  </H2>

  <body>

  <br>  
  <table>
  <tr>
	<td width="400"><a href="/SIGNIN.jsp">HOME</a></td>
	<td width="400"><a href="/selectSub.jsp">STUDY RESOURCES</a> </td>
	<td width="400"><a href="/IBM-TGMC-FB.html">IBM - TGMC 2010</a> </td>
	<td width="400"><a href="/enterEmailForm.jsp">SUBMIT eMAIL ADDRESS</a> </td>
 </tr>	
</table>	<br>
  
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    
	 String uro = request.getParameter("URO");
	 
	 PersistenceManager pm = PMF.get().getPersistenceManager();
	
	
	Query query = pm.newQuery(Data.class);
    query.setFilter("URO == uroParam");
    //query.setOrdering("hireDate desc");
    query.declareParameters("String uroParam");
	
	
	
    //String query = "select from " + Data.class.getName() + " where NAME == 'NAYAN BOSE'";
    List<Data> datas = (List<Data>) query.execute(uro);
	
    if (datas.isEmpty()) {
	
		request.setAttribute("uro",uro);
		RequestDispatcher rd1=request.getRequestDispatcher("/SP1.jsp");
		rd1.forward(request,response);
		
	
%>

<p> THIS HAS TO BE FILLED YET </p>

<br><br>

<a href="/SP1.jsp">PROCEED TO FORM</a>


<%
    } else {
        for (Data d : datas) {
            if (d.getAuthor() == null) {
%>
<p>An anonymous person wrote:</p>
<%
            } else {
%>
<p><b><%= d.getAuthor().getNickname() %></b> wrote:</p>
<%
            }
%>

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

<%
        }
    }
    pm.close();
%>

	
</body>
</html>