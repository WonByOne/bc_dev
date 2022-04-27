<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="${project}/script.js"></script>

<h2>${page_login}</h2>

<%-- requestScope 사용으로 필요없음
	int result = (Integer) request.getAttribute("result");
	String id = (String) request.getAttribute("id");
--%>
<c:if test="${result eq -1}">
	<script type="text/javascript">
	/*<![CDATA[*/
		erroralert(iderror);
	/*]]>*/
	</script>
</c:if>
<c:if test="${result eq 0}">
<%-- EL 태그 변경
		} else if(result == 0) {// wrong password
			--%>
	<script>
	/*<![CDATA[*/
		erroralert(passwderror);
	/*]]>*/
	</script>
</c:if>
<c:if test="${result eq 1}">
			<%-- EL 태그로 변경
	} else {				// right password 
	session.setAttribute("memid", id); // db에서 가져온 id를 memid에 넣는다
	response.sendRedirect("main.do"); --%>
	${sessionScope.memid = id}
	<c:redirect url="main.do"/>
</c:if>