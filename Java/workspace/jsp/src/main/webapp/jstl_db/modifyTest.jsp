<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<body text=#d6d6d6 bgcolor="black"/>

<h2>JSTL - sql: update</h2>

<sql:update var="result" dataSource="OCI/joeun">
	update dbtest set passwd=?, tel=? where id=?
	<sql:param value="${param.passwd}"/>
	<sql:param value="${param.tel}"/>
	<sql:param value="${param.id}"/>
</sql:update>
<c:if test="${result eq 0}">
	Failed to modify information.<br>
	Try again after a while.<br>
	<meta http-equiv="refresh" content="2; url=selectTest.jsp"/>
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="selectTest.jsp?id=${param.id}"/>
</c:if>