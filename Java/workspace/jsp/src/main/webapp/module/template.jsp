<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>Template Page</h2>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String name = request.getParameter("paramName");
	String control = request.getParameter("paramControl");
	String sub = request.getParameter("paramSub");
%>


<table border=1>
	<tr>
		<th colspan=2 height=50>
			<!-- Top Menu  -->
			<jsp:include page="top.jsp" flush="false"/> <%-- flush="false"가 기본값이므로 생략 가능 --%>
		</th>
	</tr>
	<tr>
		<th width=100 height=200><!-- Left Menu  -->

			<jsp:include page='<%="./left/"+control+"left.jsp"%>'/>
			<%--
			 <jsp:include page='./left/tvleft.jsp'/>  --%>
			<%-- java 영역 안에서 파일명을 동적으로 지정 --%>
			<%-- 쌍따옴표로 HTML에 작성할 경우 인식에 오류 --%>
		</th>
		<td width=300 valign="top">
			<br>
			<b>[[<%=name%>]]</b>
			<br><br>
			<jsp:include page='<%="./contents/"+control+"/"+control+sub+".jsp"%>'/>
		</td>
	</tr>
	<tr>
		<th colspan=2 height=50>
			<!-- Bottom Menu -->
			<jsp:include page="bottom.jsp" flush="false"/>
		</th>
	</tr>

</table>


<body bgcolor="black" text=#d6d6d6>


</body>
