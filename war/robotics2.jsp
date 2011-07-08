
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>

<h3 align="center">EVENT REGISTRATION FOR AVENIR 2011--- ROBOTICS  </H2><br>
<H2 align="right"> </H2


<table>
  <tr>
	<td width="400"><a href="/fest/submitReg.jsp">GENERAL REGISTRATION</a></td>
	<td width="400"><a href="/fest/EVENT/gaming.jsp">EVENT REGISTRATION<br> ( ROBOTICS AND GAMING )</a> </td>
	<td width="400"><a href="/fest/EVENT/gaming.jsp">EVENT REGISTRATION</a> </td>
	<td width="400"><a href="/fest/EVENT/submitDecrypt.jsp">AUTHENTICATE PARTICIPANT</a> </td>
 </tr>	
</table>	<br>
<form action="/fest/EVENT/insertRobotics.jsp" method="get">

<table>
<tr width="400">

<h3 align="center">

<td width="500">
<h3>

<input NAME="ename" type="button" id="photobotics" value="PHOTOBOTICS"> <BR>
<input NAME="ename" type="button" id="optimusprime" value="OptimusPrime">
<input NAME="ename" type="button" id="robowarz" value="robowarz"> 
<input NAME="ename" type="button" id="terraranger" value="Terra Ranger">
<input NAME="ename" type="button" id="extractor" value="Extractor">

</h3>

</td>




<td>
<h3 align="center">

COLLEGE NAME : <input type="text" name="college" value="" ><br><br>


( ENTER REGISTRATION CODE - encrypted )  <br><br><br>
 TEAM NAME---<input type="text" name="tname" value="" ><br><br>
(CAPTAIN)TEAM MEMBER 1(NAME) ---<input type="text" name="tm1" value="" /><br>MOBILE ---<input type="text" name="m1" value="" /><br>
TEAM MEMBER 2---(NAME)<input type="text" name="tm2" value="" /><br>MOBILE ---<input type="text" name="m2" value="" /><br>
TEAM MEMBER 3---(NAME)<input type="text" name="tm3" value="" /><br>MOBILE ---<input type="text" name="m3" value="" /><br>
TEAM MEMBER 4---(NAME)<input type="text" name="tm4" value="" /><br>MOBILE ---<input type="text" name="m4" value="" /><br>




</H3>
</td>
<br><br>

</tr>
<tr>

<input type="submit" value="REGISTER FOR THE EVENT " />

<br><br>
</tr>

</form>
</table>



inserted
</body>
</html>