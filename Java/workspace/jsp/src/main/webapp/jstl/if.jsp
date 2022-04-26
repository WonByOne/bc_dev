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
<br>

<form method="post" action="if.jsp">
	<table border=1>
		<tr>
			<th>Score</th>
			<td><input type="text" name="score"></td>
			<th><input type="submit" value="Submit"></th>
		</tr>
	</table>
</form>
<!--  점수가 70점 이상이면 합격 -->
<c:set var="score" value="${param.score}"/>
<c:if test="${score ge 70}"> 
<!-- ${param.score ge 70} 으로 바로 사용 가능 -->
	${"합격"}<br>
</c:if>
<c:if test="${score lt 70}">
	${"불합격"}<br>
</c:if>
<!-- 90 점 이상이면 "A" -->
<
<c:choose>
	<c:when test="${score gt 100 or score lt 0 or empty score}">
		잘못 입력하셨습니다.
	</c:when>
	<c:when test="${score ge 90}">
		A<br>
	</c:when>
	<c:when test="${score ge 80}">
		B<br>
	</c:when>
	<c:when test="${score ge 70}">
		C<br>
	</c:when>
	<c:when test="${score ge 60}">
		D<br>
	</c:when>
	<c:otherwise>
		F<br>
	</c:otherwise>
</c:choose>


