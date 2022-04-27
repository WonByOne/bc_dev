<%--@ page import="board.BoardDBBean"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<script src="${project}/script.js"></script>

<h2>${page_modify}</h2>
<%--
	String pageNum = (String) request.getAttribute("pageNum");
	int result = (Integer) request.getAttribute("result");
--%>
<c:if test="${result eq 0}">
<%--
	if(result == 0) {
		--%>
	<script type="text/javascript">
	/*<![CDATA[*/
		erroralert(modifyerror);
	/*]]>*/
	</script>
</c:if>
<c:if test="${result ne 0}">
		<%--
	} else {
		response.sendRedirect("list.do?pageNum="+pageNum);
	}
--%>
	<c:redirect url="list.do?pageNum=${pageNum}"/>
</c:if>
