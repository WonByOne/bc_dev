<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body text=#d6d6d6 bgcolor="black"/>

<h2>JSTL - core: set/remove/out</h2>

<%
	int a = 5;
%>
scriptlet : <%out.println(a);%><br>
expression : <%=a%><br>
el : ${a}<br><!-- el 태그는 변수 공유 불가능 -->

<c:set var="a" value="10"/>
el : ${a}<br>
out : <c:out value="a"/><br>
out : <c:out value="${a}"/><br>

<c:set var="b" value="${10}"/> <!-- 숫자로 명시하는 방법 -->
<c:set var="b" value="${'ABC'}"/> <!-- 변경이 된다 -->
<c:set var="b" value='${"ABC"}'/> <!-- 따옴표 아무거나 가능 -->
<c:set var="b" value='${ABC}'/> <!-- null -->
b : ${b}<br>

<c:set var="c"> <!-- 태그를 나눠서 처리하는 방법 -->
	10
</c:set>
c : ${c}<br>
<c:set var="d">
	${10} 		<!-- 자료형 명시 -->
</c:set>
d : ${d}<br>
<c:set var="e">
	"ABC"		<!-- 따옴표까지 인식  -->
</c:set>
e : ${e}<br>
<c:set var="f">
	${"ABC"}
</c:set>
f : ${f}<br>

<%	// java code를 JSTL에 넣기
	int g = 30;
%>
<c:set var="g" value="<%=g%>"/>
g : ${g}<br>

<jsp:useBean id="h" class="java.util.Date"/>
<c:set var="h" value="<%=new java.util.Date()%>"/>
h : ${h}<br>

<c:set var="r" value="<%=new java.util.Random()%>"/>
r : ${r.nextInt(45) + 1}<br>

<c:remove var="r"/> <!-- 객체 지우기 -->
r: ${r.nextInt(45) + 1}<br>