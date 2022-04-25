<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body text=#d6d6d6 bgcolor="black"/>
<h2>JSTL - core: if</h2>

<c:set var="a" value="${5}"/>
<c:if test="${a gt 5}">
	${"크다"}<br>
</c:if>
<c:if test="${a le 5}">
	${"작다"}<br>
</c:if>

<!-- a가 짝수면 "짝수" -->

<c:if test="${a mod 2 eq 0}">
	${"Even"}<br>
</c:if>
<c:if test="${a mod 2 ne 0}">
	${"Odd"}<br>
</c:if>

<c:set var="b" value="${5}"/>
<c:choose>
	<c:when test="${b eq 1}">
		하나<br>
	</c:when>
	<c:when test="${b eq 2}">
		둘<br>
	</c:when>
	<c:when test="${b eq 3}">
		셋<br>
	</c:when>
	<c:otherwise>
		숫자<br>
	</c:otherwise>
</c:choose>