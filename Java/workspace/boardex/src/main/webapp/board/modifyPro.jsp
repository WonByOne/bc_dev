<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>

<h2><%=page_modify%></h2>
<%
	String pageNum = (String) request.getAttribute("pageNum");
	int result = (Integer) request.getAttribute("result");
%>
<%
	if(result == 0) {
		%>
		<script type="text/javascript">
		/*<![CDATA[*/
			erroralert(modifyerror);
		/*]]>*/
		</script>
		<%
	} else {
		response.sendRedirect("list.do?pageNum="+pageNum);
	}
%>
