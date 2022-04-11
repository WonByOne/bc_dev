<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body bgcolor="black" text=#d6d6d6>

<h2>InnerObject - response 1</h2>

현재 페이지는 redirect 전 페이지 responseTest1.jsp 입니다.

<%
	response.sendRedirect("responseTest2.jsp");	// 응답 페이지 전환
%>

</body>
