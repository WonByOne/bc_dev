<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<body text=#d6d6d6 bgcolor="black"/>

<fmt:requestEncoding value="utf-8"/> <%-- 한글 인코딩 --%>

<h2> JSTL - sql: insert </h2>

<c:if test="${param.id == null or param.id == ''}">
	<form method="post" action="insertTest.jsp">
		<table border=1>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>Tel</th>
				<td><input type="text" name="tel"></td>
			</tr>
			<tr>
				<th colspan=2>
					<input type="submit" value="Submit">
					<input type="reset" value="Cancel">
				</th>
			</tr>
		</table>
	</form>	
</c:if>

<c:if test="${param.id != null and param.id != ''}">
	<sql:update var="result" dataSource="OCI/joeun">
		insert into dbtest values(?, ?, ?, ?, sysdate)
		<sql:param value="${param.id}"/>
		<sql:param value="${param.passwd}"/>
		<sql:param value="${param.name}"/>
		<sql:param value="${param.tel}"/>
	</sql:update>
	<c:if test="${result eq 0}">
		Sign up failed.<br>
	</c:if>
	<c:if test="${result ne 0}">
		<c:redirect url="selectTest.jsp"/>
	</c:if>
</c:if>