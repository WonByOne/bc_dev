<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body bgcolor="black" text=#d6d6d6>

<h2>Action Tag - include</h2>
<h3>Processing Page 2</h3>

<%--	// request를 공유한다. // 이 방법은 정석은 아님 보통 test1에서 넘기면 받는다.
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
--%>

<%
	String name = request.getParameter("paramName");
	int age = Integer.parseInt(request.getParameter("paramAge"));
%>


Name : <%=name %><br>
Age : <%=age %><br>
</body>
</html>