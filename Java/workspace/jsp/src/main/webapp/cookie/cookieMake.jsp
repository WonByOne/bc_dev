<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>Cookie</h2>
<h3>Generate Page</h3>
<%
	Cookie cookie = new Cookie("id", "aaa");
	response.addCookie(cookie);	
%>
확인 : <input type="button" value="확인" onclick="location='cookieUse.jsp'">

<body bgcolor="black" text="#d6d6d6"/>