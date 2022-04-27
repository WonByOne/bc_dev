<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script src="${project}/script.js"></script>

<h2>${page_input}</h2>

<%--
	int result = (Integer) request.getAttribute("result");
--%>
<c:if test="${result eq 0}">
<%--
	if(result == 0) {
		--%>
	<script type="text/javascript">
	/*<![CDATA[*/
		erroralert(inputerror);
	/*]]>*/
	</script>
</c:if>
<c:if test="${result ne 0}">
		<%--
	} else {
		response.sendRedirect("loginForm.do");
	}
--%>
	<c:redirect url="loginForm.do"/>
</c:if>
