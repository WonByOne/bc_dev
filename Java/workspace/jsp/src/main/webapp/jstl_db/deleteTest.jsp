<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<body text=#d6d6d6 bgcolor="black"/>

<h2>JSTL - sql: delete</h2>

<c:set var="c" value="${param.passwd eq null or param.passwd eq ''}"/>
<c:if test="${c eq true}">
	<form method="post" action="deleteTest.jsp">
		<input type="hidden" name="id" value="${param.id}">
		<table border=1>
			<tr>
				<th>Password</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<th colspan=2>
					<input type="submit" value="Delete">
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
			<sql:update var="result" dataSource="OCI/joeun">
				delete from dbtest where id=?
				<sql:param value="${param.id}"/>
			</sql:update>
			<c:if test="${result eq 0}">
				Failed to delete account.<br>
				Try again after a while.<br>
				<meta http-equiv="refresh" content="2; url=selectTest.jsp">
			</c:if>
			<c:if test="${result ne 0}">
				<c:redirect url="selectTest.jsp"/>
			</c:if>
		</c:if>
		<c:if test="${param.passwd ne row.passwd}">
			Wrong password.<br>
			Please Check again.<br>
			<meta http-equiv="refresh" content="2; url=deleteTest.jsp?id=${param.id}">
			<%-- id 재확인을 위해 --%>
		</c:if>
	</c:forEach>
</c:if>