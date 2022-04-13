<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>Cookie</h2>
<h3>Check Page</h3>


<%
	Cookie [] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++) {
		String name = cookies[i].getName();
		String value = cookies[i].getValue();
		%>
		<%=name%> : <%=value%> <br>
		<%
	}
%>

<body bgcolor="black" text="#d6d6d6"/>