<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<body text=#d6d6d6 bgcolor="black"/>

<h2> JSTL - sql: select </h2>

<c:if test="${param.id == null or param.id == ''}">
	<sql:query var="rs" dataSource="OCI/joeun">
		select * from dbtest
	</sql:query>
</c:if>
<c:if test="${param.id != null and param.id != ''}">
	<sql:query var="rs" dataSource="OCI/joeun">
		select * from dbtest where id=?
		<sql:param value="${param.id}"/>
	</sql:query>
</c:if>
<table border=1>
	<tr>
		<c:forEach var="column" items="${rs.columnNames}">
			<th>${column}</th>
		</c:forEach>
	<th>
		<input type="button" value="Sign Up" onclick="location='insertTest.jsp'">
	</th>
	</tr>
	<c:forEach var="row" items="${rs.rowsByIndex}">
		<tr align="center">
			<c:forEach var="col" items="${row}">
				<td>${col}</td>
			</c:forEach>
			<td>
				<input type="button" value="Modify"
					onclick="location='modifyView.jsp?id=${row[0]}'">
				<input type="button" value="Delete"
					onclick="location='deleteTest.jsp?id=${row[0]}'">
			</td>
		</tr>
	</c:forEach>
</table>