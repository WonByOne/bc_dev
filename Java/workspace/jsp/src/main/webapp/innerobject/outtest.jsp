<%@ page language="java" contentType="text/html; charset=UTF-8"
	buffer="10kb"
    pageEncoding="UTF-8" %>
<h2> InnerObject - out</h2>

<%

int buffersize = out.getBufferSize();
int remainsize = out.getRemaining();
%>
Buffer size : <%out.println(buffersize);%><br> <!-- out 내장객체 사용 -->
Buffer size : <%=buffersize%><br>
Buffer used  : <%=buffersize - remainsize %><br>
Buffer remains : <%=remainsize%><br>

<body bgcolor="black" text=#d6d6d6>

</body>
