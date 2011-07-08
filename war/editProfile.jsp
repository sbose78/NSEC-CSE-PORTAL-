






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

   <link type="text/css" rel="stylesheet" href="/style.css" />   

 <H1 align="center" color="BLUE">  
   <SMALL>NETAJI SUBHASH ENGINEERING COLLEGE</SMALL>
  </H1>   
  <H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING
  <br>
  </H2>

  <body>

  <br>

  
<table width="999" height="35" border="0.005" align="center" bgcolor="#FFFFCC">
  <tr>
    <th scope="col"><a href="/SIGNIN.jsp">HOME</a></th>
    <th scope="col"><a href="/selectSub.jsp">STUDY RESOURCES </a></th>
    <th scope="col">FORUMS</th>
    <th scope="col"><a href="/IBM-TGMC-FB.html">IBM-TGMC 2010</a> </th>
    <th scope="col"><a href="/submitFile2.jsp">SHARE A <em>LINK</em></a></th>
    <th scope="col"><a href="/enterEmailForm.jsp">SUBMIT EMAIL ADDRESS TO DATABSE </a></th>
    <th scope="col">ABOUT</th>
  </tr>
</table>	<br><br>
  
  <I> INFORMATION entered by............... </I>
  
  
  
  
<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    
	 String uro = request.getParameter("URO");
	 if(uro==null){
		response.sendRedirect("/SIGNIN.jsp");
		}
	 
	 
	 PersistenceManager pm = PMF.get().getPersistenceManager();
	
	
	Query query = pm.newQuery(Data.class);
    query.setFilter("URO == uroParam");
    //query.setOrdering("hireDate desc");
    query.declareParameters("String uroParam");
	
	
	
    //String query = "select from " + Data.class.getName() + " where NAME == 'NAYAN BOSE'";
    List<Data> datas = (List<Data>) query.execute(uro);
	
    if (datas.isEmpty()) {
	
		
	
%>

<p> THIS HAS TO BE FILLED YET </p>

<br><br>

<form action="/SP1.jsp" method="post" name="ll">

	<input type="hidden" name="URO" value="<%= request.getParameter("URO") %>" >
	<input type="submit" value="PROCEED TO FORM" >
</form>


<%= request.getParameter("URO")%>

<%
    } else {
	
	
	
	 for (Data d : datas) {
		
			String demail=user.getEmail();
			out.println("\n"+demail);
			if( user.equals(d.getAuthor()) || demail.equals(d.getEMAIL()) )
			{  
	
%>

<form action="/SaveEdit" method="post"  name="j">

<br>
UNIVERSITY ROLL NO. : <%= d.getURO() %><br><br>

	
	
	NAME<INPUT type="TEXT" name="NAME" id='n' value="<%= d.getNAME() %>"><BR>  	  
	UNIVERSITY REGISTRATION NO.<INPUT  id ='ure' name="URE" value="<%=d.getURE()%>"><BR>	  
	DATE OF BIRTH: <INPUT TYPE="TEXT" NAME="DOB" value="<%=d.getDOB()%>"><BR>
	BLOOD GROUP: <INPUT TYPE="TEXT" NAME="BG" value="<%=d.getBG()%>"><BR>
	GENDER: <INPUT TYPE="TEXT" NAME="GEN" value="<%=d.getGEN()%>"><BR>
	PHONE: <INPUT TYPE="TEXT" NAME="PHONE" value="<%=d.getPHONE()%>"><BR>
        EMAIL-ADDRESS:<INPUT TYPE="TEXT" NAME="EMAIL" value="<%=d.getEMAIL()%>"><BR>

	PERCENTAGE- 10TH BOARD EXAM:<INPUT TYPE="TEXT" NAME="P10" value="<%=d.getP10()%>"><BR>
	BOARD:<INPUT TYPE="TEXT" NAME="BOARD1" value="<%=d.getBOARD1()%>"><BR>

	PERCENTAGE- 12TH BOARD EXAM:<INPUT TYPE="TEXT" NAME="P12" value="<%=d.getP12()%>"><BR>
	BOARD:<INPUT TYPE="TEXT" NAME="BOARD2" value="<%=d.getBOARD2()%>"><BR>

	JEE/AIEEE/OTHERS RANK:<INPUT TYPE="TEXT" NAME="RANK" value="<%=d.getRANK()%>"><BR>

	DEGREE GRADE POINT AVERAGE:<INPUT TYPE="TEXT" NAME="DGPA" value="<%=d.getDGPA()%>"><BR>

PRIMARY KEY ( SYSTEM GENERATED LONG ID ): <%=d.getId()%> <br>
 <INPUT TYPE="HIDDEN" NAME="id" value="<%=d.getId()%>"><BR>
 

<input type="submit"  VALUE=" SAVE CHANGES ">

</form>

<%
			}
			else{ 
				out.println("YOU ARE NOT AUTHORISED TO EDIT THIS ENTRY");
					}  
        }
    }
    pm.close();
%>

	
</body>
</html>