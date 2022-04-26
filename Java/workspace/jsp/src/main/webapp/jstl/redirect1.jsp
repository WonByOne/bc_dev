<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body text=#d6d6d6 bgcolor="black"/>

<h2>JSTL - core: redirect1</h2>

현재 페이지는 redirect 되기 전 페이지 redirect1.jsp입니다.<br>

<%-- action tag 방식 // 주소창 주소가 안 바뀜
<jsp:forward page="redirect2.jsp"/>
--%>
<%--
<%
	response.sendRedirect("redirect2.jsp");
%>
--%>
<c:redirect url="redirect2.jsp"/>