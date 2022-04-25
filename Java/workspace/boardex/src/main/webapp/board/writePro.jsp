<%@page import="board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>

<h2><%=page_write%></h2>

<%
	int result = (Integer) request.getAttribute("result");
%>
<%
	if(result == 0) {
		%>
		<script type="text/javascript">
		/*<![CDATA[*/
			erroralert(inserterror);
		/*]]>*/
		</script>
		<%
	} else {
		response.sendRedirect("list.do");
	}
%>
