<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body bgcolor="black" text=#d6d6d6>

<h2>InnerObject - request</h2>
<h2>Processing Page</h2>
<%
	request.setCharacterEncoding("utf-8"); 	// client에서 넘어오는 요청에 대한 encoding
%>
<%
	String name = request.getParameter("name");		// 다른 페이지의 데이터를 공유할 수 있다. 내장객체 덕분
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String hobby[] = request.getParameterValues( "hobby" );
%>
Name : <%=name%><br>
Age : <%=age%><br>
Gender : <%
	if(gender.equals("1")) {
		%>Male<%		
	} else {
		%>Female<%
	}
 %> <br>
 Hobby : <%
 	for(int i=0;i<hobby.length; i++) {
 		switch(hobby[i]) {
 		case "1" : %>Reading<%; break;
 		case "2" : %>Hiking<%; break;
 		case "3" : %>Exercise<%; break;
 		case "4" : %>Video Game<%; break;
 		}
 	}
 %> <br>


</body>
