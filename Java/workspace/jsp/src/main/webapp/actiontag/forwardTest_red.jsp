<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("paramName");
	String color = request.getParameter("paramColor");
%>

<body bgcolor="<%=color%>" text=#d6d6d6>

<h2>Action Tag - forward</h2>
<h3><%=color%></h3>
<%
	request.setCharacterEncoding("utf-8");
%>

Hello <%=name%>!<br>
Your Choice is <%=color%>.
</body>
