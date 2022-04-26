<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<body text=#d6d6d6 bgcolor="black"/>

<h2>JSTL - sql: update</h2>
<c:set var="c" value="${param.passwd eq null or param.passwd eq ''}"/>
<c:if test="${c eq true}">
	<form method="post" action="modifyView.jsp">
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
</c:if>