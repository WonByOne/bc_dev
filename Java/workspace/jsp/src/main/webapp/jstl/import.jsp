<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body text=#d6d6d6 bgcolor="black"/>

<h2>JSTL - core: import</h2>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = "홍길동";
%>
<%-- include 방식
<jsp:include page="import_top.jsp">
	<jsp:param name="paramName" value="<%=name%>"/>
</jsp:include>
 --%>
<c:import url="import_top.jsp">
	<c:param name="paramName" value="<%=name%>"/>
</c:import>
 
<hr size=3 width="50%" color="blue" align="left">
현재 페이지는 포함하는 페이지 import.jsp 입니다.<br>
<hr size=3 width="50%" color="blue" align="left">

<c:import url="import_bottom.jsp"/>