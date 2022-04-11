<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body bgcolor="black" text=#d6d6d6>

<h2>InnerObject - Area</h2>
<h2>Create Page</h2>

<%
	request.setAttribute("id", "aaa");
	session.setAttribute("id", "bbb");
	application.setAttribute("id", "ccc");
%>
이동 : <input type="button" value="Move" onclick="location='getAttribute.jsp'"><br>

</body>
