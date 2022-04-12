<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>404 Error Page</h2>
<%
	response.setStatus(HttpServletResponse.SC_OK); // 브라우저에게 정상으로 알려줌
%>
Current page is 404 error page. <br>
Please check path or file name.

<body bgcolor="black" text="#d6d6d6">

</body>