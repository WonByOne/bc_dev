<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <h2>script - declaration</h2>
 
<%! // _jspService 메소드 안으로 들어가는 것을 방지
	String name = "전역 변수";		// class declaration_jsp 안에 구현
	public int sum(int a, int b) {
	 return a + b;	
}

	public int sub(int a, int b) {
		return a - b;
	}
%>

<%
	String name = "지역 변수";		// _jspService 메소드 안에 선언됨
%>

Sum : <%=sum(5, 2)%><br>
Subtract : <%=sub(5, 2)%><br>
 