<%@page import="bean.SimpleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>Action tag - useBean</h2>
<h3>Processing Page</h3>

<%
	request.setCharacterEncoding("utf-8");
%>
<h4>Java Bean X - useBean X</h4>
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
%>
Name : <%=name%><br>
Age : <%=age%><br>
Tel : <%=tel%><br>
Address : <%=addr%><br>
<br>
<h4> Java Bean O - useBean X</h4>>
<jsp:useBean id="bean" class="bean.SimpleBean" scope="session"/> <!-- Java의 객체 생성과 같음 -->
<%
//	SimpleBean bean = new SimpleBean(); 	// 객체 생성 : import 필요
	bean.setName(request.getParameter("name"));
	bean.setAge(Integer.parseInt(request.getParameter("age")));
	bean.setTel(request.getParameter("tel"));
	bean.setAddr(request.getParameter("addr"));
%> 
Name : <%=bean.getName()%><br>
Age : <%=bean.getAge()%><br>
Tel : <%=bean.getTel()%><br>
Address : <%=bean.getAddr()%><br>
<br>

<h4>Java Bean O - useBean O </h4>
<%-- property에 *로 한 번에 넘기는 것이 가능
<jsp:setProperty name="bean" property="name"/>
<jsp:setProperty name="bean" property="age"/>
<jsp:setProperty name="bean" property="tel"/>
<jsp:setProperty name="bean" property="addr"/>
 --%>
<jsp:setProperty name="bean" property="*"/>	
Name : <jsp:getProperty name="bean" property="name"/> <br> 
Age : <jsp:getProperty name="bean" property="age"/><br>
Tel : <jsp:getProperty name="bean" property="tel"/><br>
Address : <jsp:getProperty name="bean" property="addr"/><br>

<jsp:forward page = "simpleBeanView.jsp"/>

<body bgcolor="black" text="#d6d6d6"/>

