<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<link href="../style.css" rel="stylesheet" type="text/css">

<sql:query var="rs" dataSource="OCI/joeun">
	select count(*) from dbtest where id='${param.id}'
</sql:query>
<c:forEach var="row" items="${rs.rowsByIndex}">
	<c:if test="${row[0] eq 0}">
		ID available.
	</c:if>
	<c:if test="${row[0] eq 1}">
		Unable to use.
	</c:if>
	
</c:forEach>