<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body bgcolor="black" text=#d6d6d6>

<h2>Action Tag - include</h2>
<h3>Processing Page 1</h3>
<%
	request.setCharacterEncoding("utf-8");
%>
<%	// parameter 가져온다.
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
%>
Name : <%=name %><br>
Age : <%=age %><br>

<hr size=3 color="gold">
 
<jsp:include page="includeTest2.jsp" flush="false"> 
	<jsp:param name="paramName" value="<%=name%>"/>
	<jsp:param name="paramAge" value="<%=age%>"/>
</jsp:include>

</body>
 