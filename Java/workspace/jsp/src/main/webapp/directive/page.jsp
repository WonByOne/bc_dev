<%@ page language="java" contentType="text/html; charset=UTF-8"
	session="true"
    buffer="10kb"
    autoFlush="false"
    isThreadSafe="true"
    pageEncoding="UTF-8"%>

<h2> directive - page </h2>
<%   //이렇게 쓰면 자바코드를 쓸수 있게 하는거
   int a=5, b=2;
%>
a + b = <%out.println( a+b ); %> <br>
a - b = <%out.println( a-b ); %> <br>
a * b = <%out.println( a*b ); %> <br>
a / b = <%out.println( a/b ); %> <br>