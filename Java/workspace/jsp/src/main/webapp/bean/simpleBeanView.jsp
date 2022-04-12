<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>Action tag - useBean</h2>
<h3>Result Page</h3>

<!-- 
Java에서는
SimpleBean bean = new SimpleBean();
SimpleBean bean = new SimpleBean(); // 같은 객체 두번 정의하면 error
useBean 태그는 객체를 다시 정의하면 재사용 한다는 뜻이 된다
 -->
<%-- scope 까지 맞춰야 객체를 재사용 할 수 있다
<jsp:useBean id="bean" class="bean.SimpleBean"/>
--%> 

<jsp:useBean id="bean" class="bean.SimpleBean" scope="session"/>

Name : <%=bean.getName()%><br>
Age : <%=bean.getAge()%><br>
Tel : <%=bean.getTel()%><br>
Address : <%=bean.getAddr()%><br>
<br>

<body bgcolor="black" text="#d6d6d6"/>