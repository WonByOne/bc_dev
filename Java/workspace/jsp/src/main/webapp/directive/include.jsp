<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2> Directive - include</h2>

<%@ include file="top.jsp" %>


<hr size=3 color="red">
현재 페이지는 포함하는 페이지 include.jsp입니다.<br>
<%out.println(name);%>님 안녕하세요.<br>

<hr size=3 color="red">
<%@ include file="bottom.jsp" %>

