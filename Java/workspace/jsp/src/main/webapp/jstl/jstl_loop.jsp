<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body text=#d6d6d6 bgcolor="black"/>
<h2>JSTL - core: loop</h2>

<c:forEach var="i" begin="1" end="10">
	${i}&nbsp;
</c:forEach>
<br>
<c:forEach var="i" begin="1" end="10" step="2">
	${i}&nbsp;
</c:forEach>
<br>
<!-- 10 ~ 1 -->
<!-- forEach는 거꾸로 돌릴 수 없다 
<c:forEach var="i" begin="10" end="1">
	${i}&nbsp;
</c:forEach>
 -->
 
<%-- index가 a-i+1 이되어 좀 복잡하지만 a값만 수정하면 반복문 제체가 변함 --%>
<c:set var="a" value="${10}"/>
<c:forEach var="i" begin="1" end="${a}">
	${a-i+1}&nbsp;
</c:forEach>
<br>
<%-- 단순 출력이 아니라 반복문 내에서 줄어드는 index를 a로 사용하려면
	하지만 a값과 end값이 분리된다 --%>
<c:forEach var="i" begin="1" end="10">
 ${a}&nbsp;
 <c:set var="a" value="${a-1}"/>
</c:forEach>
<br>
<%
	int m[] = {10, 20, 30, 40, 50};
%>
<%
	for(int a : m) {
		%>
		<%=a%>&nbsp;
		<%
	}
%>
<br>
<%-- 개선된 루프를 태그로 --%>
<c:set var="m" value="<%=m%>"/>
<c:forEach var="a" items="${m}">
	${a}&nbsp;
</c:forEach>
<br>
<%
	Vector<String> v = new Vector<String>();
	v.add("홍길동");
	v.add("김유신");
	v.add("이순신");
%>
<%-- <c:set var="v" value="<%=v%>"/> 없어도 기능? --%> 
<c:forEach var="v" items="<%=v%>">
	${v}&nbsp;
</c:forEach>
<br>

<%
	HashMap<Integer, String> map = new HashMap<Integer, String>();
	map.put(0, "홍길동");
	map.put(3, "김유신");
	map.put(7, "이순신");
%>
<c:forEach var="user" items="<%=map%>">
	${user.key} : ${user.value}<br>
</c:forEach>
<br>
<c:forTokens var="token" items="${'1, 2, 3, 4, 5'}" delims="${','}">
	${token}&nbsp;
</c:forTokens>
<br>

<form method="post" action="jstl_loop.jsp">
	<table border=1>
		<tr>
			<th>점수</th>
			<td><input type="text" name="scores"></td>
			<th><input type="submit" name="Submit"></th>
		</tr>
	</table>
</form>
<!-- 87, 56, 34, 86, 89, 93, 25, 56 ,74, 50 -->
<!-- 점수 총점 평균 -->
<c:set var="sum" value="${0}"/>
<c:set var="cnt" value="${0}"/>
<c:forTokens var="tok" items="${param.scores}" delims="${', '}">
	${tok}&nbsp;
	<c:set var="sum" value="${sum + tok}"/>
	<c:set var="cnt" value="${cnt + 1}"/>
</c:forTokens>
<br>
총점 : ${sum}<br>
평균 : ${sum div cnt}<br>


