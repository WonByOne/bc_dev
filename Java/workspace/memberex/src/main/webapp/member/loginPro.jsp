<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>

<h2><%=page_login%></h2>

<%
	int result = (Integer) request.getAttribute("result");
	String id = (String) request.getAttribute("id");
%>
<%
	if(result == -1) {		// id not found 
		%>
		<script type="text/javascript">
		/*<![CDATA[*/
			erroralert(iderror);
		/*]]>*/
		</script>
		<%
		} else if(result == 0) {// wrong password
			%>
			<script>
			/*<![CDATA[*/
				erroralert(passwderror);
			/*]]>*/
			</script>
			<%
	} else {				// right password
		session.setAttribute("memid", id); // db에서 가져온 id를 memid에 넣는다
		response.sendRedirect("main.do");
	}
%>