<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<body bgcolor=black text=#d6d6d6>
<h2>script - expression 2</h2>

<table border=1>
<%
	for(int i=0;i<10;i++) {
		%><tr><%
		for(int j=2;j<=9;j++) {
			if(i==0) {			// 제목
				%><th>
				<%=j%>단
				</th><%
			} else {
				%><td>
				<%=j%> × <%=i%> = <%=i*j%>
				</td><%
			}
		}
		%></tr><%
	}
%>
</table>
</body>