<%--@page import="board.BoardDBBean"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="${project}/script.js"></script>

<h2>${page_delete}</h2>

<%--
	String pageNum = (String) request.getAttribute("pageNum");
	int resultCheck = (Integer) request.getAttribute("resultCheck");
--%>
<c:if test="${resultCheck eq 0}">
<%--
	if(resultCheck == 0) { 	// wrong password
		--%>
	<script type="text/javascript">
	/*<![CDATA[*/
		erroralert(passwderror);
	/*]]>*/
	</script>
</c:if>
<c:if test="${resultCheck ne 0}">
		<%--
	} else { 			// correct password
		int result = (Integer) request.getAttribute("result");
		if(result == 0) {
			--%>
	<c:if test="${result eq 0}">
		<script type ="text/javascript">
		/*<![CDATA[*/
			alert(deleteerror);
		/*]]>*/	
		</script>
		<meta http-equiv="refresh" content="0; url=list.do?pageNum=${pageNum}">
	</c:if>
	<c:if test="${result ne 0}">
			<%--
		} else {
			response.sendRedirect("list.do?pageNum=" + pageNum);
		}
	}
--%>
		<c:redirect url="list.do?pageNum=${pageNum}"/>
	</c:if>
</c:if>