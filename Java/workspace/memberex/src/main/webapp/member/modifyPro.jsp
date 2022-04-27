<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<script src="${project}/script.js"></script>

<%--
	int result = (Integer) request.getAttribute("result");
--%>
<c:if test="${result eq 0}">
<%--
	if(result == 0) {
		--%>
	<script type="text/javascript">
	/*<![CDATA[*/
		alert(modifyerror);
	/*]]>*/
	</script>
	<meta http-equiv="refresh" content="0; url=main.do">
</c:if>
<c:if test="${result ne 0}">
		<%--
	} else {
		response.sendRedirect("main.do");
	}
--%>
	<c:redirect url="main.do"/>
</c:if>