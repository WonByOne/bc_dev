<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>script - scriptlet</h2>


<%	// 자바 영역
	int a = 3;
	if(a>5) {
		// out.println("크다"); //출력은 브라우저에
		%>
		<%//out.println(a);%>
				크다<br> 
		<%
	} else {
		//out.println("작다");
		%>
		<%=a%>작다<br>
		<%
	}
%>
	