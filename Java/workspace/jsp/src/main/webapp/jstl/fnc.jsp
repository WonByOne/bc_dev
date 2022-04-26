<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fnc" uri="http://java.sun.com/jsp/jstl/functions"%>
<body text=#d6d6d6 bgcolor="black"/>

<h2>JSTL - functions</h2>
<c:set var="str" value="${'Hello JSTL!!!'}"/>
length : ${fnc:length(str)}<br>
startswith : ${fnc:startsWith(str, 'he')}<br>
toUpperCase : ${fnc:toUpperCase(str)}<br>
toLowerCase : ${fnc:toLowerCase(str)}<br>
substring : ${fnc:substring(str, 6, fnc:length(str))}<br>

<c:set var="m" value="<%=new int[] {10, 20, 30 , 40 ,50}%>"/>
join : ${m}<br>
join : ${fnc:join(m, '/')}<br>

split : 
<c:set var="a" value="${'10, 20, 30, 40, 50'}"/>
<c:forEach var="s" items="${fnc:split(a, ',')}">
	${s}&nbsp;
</c:forEach>
<br>

<c:set var="b" value="${'      a    a       a  '}"/>
trim : <pre>${b}!</pre><br>
trim : <pre>${fnc:trim(b)}!</pre><br>