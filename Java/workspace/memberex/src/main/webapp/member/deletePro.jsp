<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="${project}/script.js"></script>

<h3> ${page_del}</h3>

<%--
	int resultCheck = (Integer) request.getAttribute("resultCheck");
--%>
<c:if test="${resultCheck eq 0}">
<%--
	if(resultCheck == 0) { // wrong password
		--%>
	<script type="text/javascript">
	/*<![CDATA[*/
		erroralert(passwderror); 
	/*]]>*/
	</script>
</c:if>
<c:if test="${resultCheck ne 0}">
		<%--
	} else { // correct password : delete account
		int result = (Integer) request.getAttribute("result");
		if(result == 0) {	// DB문제 : main(2단계 전)으로 돌아가야한다.
							// erroralert 사용하면 불가.
			--%>
	<c:if test="${result eq 0 }">
		<script type="text/javascript">
		/*<![CDATA[*/
			alert(deleteerror);
		/*]]>*/		
		</script>
		<meta http-equiv="refresh" content="0; url=main.do">
	</c:if>
	<c:if test="${result ne 0}">
			<%--
		} else { // delete account
			session.removeAttribute("memid"); // 세션을 지우고
			response.sendRedirect("main.do");// main으로 되돌린다	
--%>
		<c:remove var="memid"/>
<!--  	${sessionScope.memid = null}  이것도 가능 -->
		<c:redirect url="main.do"/>
	</c:if>
</c:if>