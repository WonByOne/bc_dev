<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String product = request.getParameter("product");
	String cname = request.getParameter("cname");
%>

<%-- left folder에 있지만 template이 있는 폴더를 현재로 인식하는 듯하다 --%>


<a href="control.jsp?product=<%=product%>&company=1"><%=cname%></a><br> 
<a href="control.jsp?product=<%=product%>&company=2">LG</a><br>
<a href="control.jsp?product=<%=product%>&company=3">Sony</a><br>

<body bgcolor="black" text=#d6d6d6>

</body>