<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<body text=#d6d6d6 bgcolor="black"/>

<h2>JSTL - sql: update</h2>
<c:set var="c" value="${param.passwd eq null or param.passwd eq ''}"/>
<c:if test="${c eq true}">
	<form method="post" action="modifyView.jsp">
		<input type="hidden" name="id" value="${param.id}">
		<table border=1>
			<tr>
				<th>Password</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<th colspan=2>
					<input type="submit" value="Modify">
					<input type="button" value="Cancel" onclick="location='selectTest.jsp'">
				</th>
			</tr>
		</table>
	</form>
</c:if>
<c:if test="${c eq false}">
	<sql:query var="rs" dataSource="OCI/joeun">
		select * from dbtest where id=?
		<sql:param value="${param.id}"/>
	</sql:query>
	<c:forEach var="row" items="${rs.rows}">
		<c:if test="${param.passwd eq row.passwd}">
			<form method="post" action="modifyTest.jsp">
				<input type="hidden" name="id" value="${param.id}">
				<table border=1>
					<tr>
						<th>ID</th>
						<td>${row.id}</td>
					</tr>
					<tr>
						<th>Password</th>
						<td><input type="password" name="passwd" value="${row.passwd}"></td>
					</tr>
					<tr>
						<th>Name</th>
						<td>${row.name}</td>
					</tr>
					<tr>
						<th>Tel</th>
						<td><input type="text" name="tel" value="${row.tel}"></td>
					</tr>
					<tr>
						<th colspan=2>
							<input type="submit" value="Modify">
							<input type="button" value="Cancel" onclick="location='selectTest.jsp'">
						</th>
					</tr>
				</table>
			</form>
		</c:if>
		<c:if test="${param.passwd ne row.passwd}">
			Wrong password.<br>
			Please check again.<br>
			<meta http-equiv="refresh" content="2; url=modifyView.jsp?id=${param.id}">
		</c:if>
	</c:forEach>
</c:if>