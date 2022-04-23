<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>

<%
	int result = (Integer) request.getAttribute("result");
%>
<%
	if(result == 0) {
		%>
		<script type="text/javascript">
		/*<![CDATA[*/
			alert(modifyerror);
		/*]]>*/
		</script>
		<meta http-equiv="refresh" content="0; url=main.do">
		<%
	} else {
		response.sendRedirect("main.do");
	}
%>