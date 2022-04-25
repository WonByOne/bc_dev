<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body text=#d6d6d6 bgcolor="black"/>

<h2>EL</h2>
<%
	int a = 5, b = 2;
%>
a + b = <%out.println(a+b);%><br>
a + b = <%=a+b%><br>
a + b = ${a+b}<br> <!-- 변수 선언이 따로 필요 -->
a + b = ${5+2}<br>
<br>
"5 + 2" : <%="5 + 2"%> : <script>document.write("5+2")</script>
: ${"5+2"}<br>
"5" + 2 : <%="5" + 2%> : <script>document.write("5"+2)</script>
: ${"5"+2}<br>
"5" + "2" : <%="5"+"2"%> : <script>document.write("5"+"2")</script>
: ${"5"+"2"}<br>
5 + 2 : <%=5 + 2%> : <script>document.write(5+2)</script>
: ${5+2}<br>
<br>
"5 - 2" : <%="5 - 2"%> : <script>document.write("5-2")</script>
: ${"5-2"}<br>
"5" - 2 : &nbsp; : <script>document.write("5"-2)</script>
: ${"5"-2}<br>
"5" - "2" : &nbsp; : <script>document.write("5"-"2")</script>
: ${"5"-"2"}<br>
5 - 2 : <%=5 - 2%> : <script>document.write(5-2)</script>
: ${5-2}<br>
<br>
5 / 2 : <%=5 / 2%> : <script>document.write(5/2)</script>
: ${5/2}<br>
<br>
${5 > 2} : ${5 gt 2}<br>
${5 < 2} : ${5 lt 2}<br>
${5 >= 2} : ${5 ge 2}<br>
${5 <= 2} : ${5 le 2}<br>
${5 == 2} : ${5 eq 2}<br>
${5 != 2} : ${5 ne 2}<br>
<br>
&gt; &lt; &ge; &le; &gt;= &lt;=
<br>
${5 / 2} : ${5 div 2}<br>
${5 % 2} : ${5 mod 2}<br> 
<br>
${false && false} : ${false and false}<br>
${false || false} : ${false or false}<br>
<br>
${5%2==0 ? "짝수" : "홀수"}<br>
${5%2==0 ? '짝수' : '홀수'}<br>
<br>