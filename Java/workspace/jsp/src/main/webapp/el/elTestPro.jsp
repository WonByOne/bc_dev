<%@page import="el.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body text=#d6d6d6 bgcolor="black"/>

<h2> EL - Process page</h2>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String hobby[] = request.getParameterValues("hobby");
%>
Name : <%=name%><br>
Age : <%=age%><br>
Gender : <%=gender.equals("1") ? "Male" : "Female" %><br>
Hobby :
<%
	for(int i=0; i<hobby.length; i++) {
		switch(hobby[i]) {
		case "1" : %>Reading<%; break;
		case "2" : %>Hiking<%; break;
		case "3" : %>Exercise<%; break;
		case "4" : %>Video Game<%; break;
		}
	}
%><br>
<br>
Name : ${param.name}<br>
Age : ${param.age}<br>
Gender : ${param.gender == "1" ? "Male" : "Female"}<br>
Hobby : ${paramValues.hobby[0]}<br>
<br>
<%
	request.setAttribute("id", "aaa");
	session.setAttribute("id", "bbb");
	application.setAttribute("id", "ccc");
%>
request : <%=request.getAttribute("id")%><br>
session : <%=session.getAttribute("id")%><br>
application : <%=application.getAttribute("id")%><br>
<br>
request : ${requestScope.id}<br>
session : ${sessionScope.id}<br>
application : ${applicationScope.id}<br>
<br>
request : ${requestScope.passwd = "111"}<br>
session : ${sessionScope.passwd = "222"}<br>
application : ${applicationScope.passwd= "333"}<br>
<br>
request : ${requestScope.passwd}<br>
session : ${sessionScope.passwd}<br>
application : ${applicationScope.passwd}<br>
<br>
<%	// 쿠키 만들기 - server side
	Cookie cookie1 = new Cookie("id", "aaa");
	Cookie cookie2 = new Cookie("passwd", "111");
	response.addCookie(cookie1);	// client로 보내기
	response.addCookie(cookie2);
%>
<%
	Cookie cookies[] = request.getCookies(); // 한 개씩 가져오는 것 불가능
	for(Cookie cookie : cookies) {
		%>
		<%=cookie.getName()%> : <%=cookie.getValue()%><br>
		<%
	}
%>
<br>
${cookie.id.name} : ${cookie.id.value}<br>
${cookie.passwd.name} : ${cookie.passwd.value}<br>
<br>
<h2>Bean</h2>
<%
	User kim = new User();
	kim.setName(request.getParameter("name"));
	kim.setAge(Integer.parseInt(request.getParameter("age")));
	kim.setGender(request.getParameter("gender"));
	kim.setHobby(request.getParameterValues("hobby"));
%>
Name : <%=kim.getName()%><br>
Age : <%=kim.getAge()%><br>
Gender : <%=kim.getGender().equals("1") ? "Male" : "Female"%><br>
Hobby : <%=kim.getHobby()[0]%><br>
<br>

<jsp:useBean id="hong" class="el.User"/>
	<jsp:setProperty name="hong" property="*"/>
Name : <%=hong.getName()%><br>
Age : <%=hong.getAge()%><br>
Gender : <%=hong.getGender().equals("1") ? "Male" : "Female"%><br>
Hobby : <%=hong.getHobby()[0]%><br>
<br>

<jsp:useBean id="lee" class="el.User"/>
	<jsp:setProperty name="lee" property="*"/>
Name : ${lee.getName()}<br>
Name : ${lee.name}<br>
Age : ${lee.age}<br>
Gender : ${lee.gender == "1" ? "Male" : "Female"}<br>
Hobby : ${lee.hobby[0]}<br>

<jsp:useBean id="date" class="java.util.Date"/>
시각 : ${date}<br>
