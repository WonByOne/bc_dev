<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body bgcolor="black" text=#d6d6d6>

<h2>Action Tag - forward</h2>
<h3>Flow Control Page</h3>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = request.getParameter("name");
	String color = request.getParameter("color");
%>
Name : <%=name %><br>
Color : <%=color %><br>

<%
	String nextpage ="";
	if(color.equals("red")) {
		nextpage = "forwardTest_red.jsp";
	} else if(color.equals("blue")) {
		nextpage = "forwardTest_blue.jsp";
	} else if(color.equals("yellow")) {
		nextpage = "forwardTest_yellow.jsp"; 
	} else if(color.equals("green")) {
		nextpage = "forwardTest_green.jsp";
	}
%>

<jsp:forward page="<%=nextpage%>">
	<jsp:param value="<%=name%>" name="paramName"/>
	<jsp:param value="<%=color%>" name="paramColor"/>
</jsp:forward>

</body>