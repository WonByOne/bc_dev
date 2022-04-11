<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %> <!-- import는 page를 분리해서 사용 가능 -->    
 
<h2> InnerObject - application</h2>
<%	
	String info = application.getServerInfo();
	int major = application.getMajorVersion();
	int minor = application.getMinorVersion();
	String path = application.getRealPath("/");
%>
Server Info : <%=info %><br>
Server Ver. : <%=major%>.<%=minor%><br>
Path : <%=path %><br>

<%
	Enumeration<String> e = application.getInitParameterNames();// import 필요 - page directive 이용
	while(e.hasMoreElements()) {								// web.xml의 내용을 읽어올 수 있음
		String name = e.nextElement();
		String value = application.getInitParameter(name);
		%>
		이름 : <%=name%><br>
		값 : <%=value%><br>
		<%
	}	
%>

<body bgcolor="black" text=#d6d6d6>

</body>