<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>

<h2><%=page_input%></h2>

<%
	int result = (Integer) request.getAttribute("result");
%>

<%
	if(result == 0) {
		%>
		<script type="text/javascript">
		/*<![CDATA[*/
			erroralert(inputerror);
		/*]]>*/
		</script>
		<%
	} else {
		response.sendRedirect("loginForm.do");
	}
%>
