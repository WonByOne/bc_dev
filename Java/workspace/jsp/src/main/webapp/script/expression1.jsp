<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>script - expression 1</h2>

<%
	// 1 + 10 =55
	int sum = 0;
	for(int i=1;i<=10;i++) {
		%>
		<%=i%>	<!-- 변수 사용 -->
		<%if(i!=10) { // 10 인 경우에는 + 안 찍음
		%> + <%
		}
		sum += i;
	}
%>
	= <%=sum%><br>