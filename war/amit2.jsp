package NSEC;

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.io.*" %>
<%@ page import="NSEC.Calculate" %>

<html>
	<H1 align="center" >  <BIG>NETAJI SUBHASH ENGINEERING COLLEGE</BIG> </H1>   
	<H2 align="center">DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING <br><br><br> </H2>

	<body> 

<%		

	String param1=request.getParameter("VAL1");
	String param2=request.getParameter("VAL2");
		

%>

THE VALUES YOU ENTERED :<br>
<%= request.getParameter("VAL1") %> <br>
<%= param2 %> <br>


<%

	int n=Integer.parseInt((param1));
	int m=Integer.parseInt((param2));
	
	Calculate obj=new Calculate(m,n);
%><br>
<%=obj.ans()%>

	</body>
</html>