<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>

<h3> <%=page_del%></h3>

<%
	int resultCheck = (Integer) request.getAttribute("resultCheck");
%>
<%
	if(resultCheck == 0) { // wrong password
		%>
		<script type="text/javascript">
		/*<![CDATA[*/
			erroralert(passwderror); 
		/*]]>*/
		</script>
		<%
	} else { // correct password : delete account
		int result = (Integer) request.getAttribute("result");
		if(result == 0) {	// DB문제 : main(2단계 전)으로 돌아가야한다.
							// erroralert 사용하면 불가.
			%>
			<script type="text/javascript">
			/*<![CDATA[*/
				alert(deleteerror);
			/*]]>*/		
			</script>
			<meta http-equiv="refresh" content="0; url=main.do">
			<%
		} else { // delete account
			session.removeAttribute("memid"); // 세션을 지우고
			response.sendRedirect("main.do");// main으로 되돌린다
		}
	}	
%>