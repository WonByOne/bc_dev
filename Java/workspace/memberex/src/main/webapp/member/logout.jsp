<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 세션을 지우고 메인으로 간다 --%>
<%
	session.removeAttribute("memid"); 
	response.sendRedirect("main.jsp");
%>