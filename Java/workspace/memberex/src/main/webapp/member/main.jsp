<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}/style_member.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>
    
 <%-- el 태그로 변경
 	if(session.getAttribute("memid") == null) { // logout
 		--%>
 <c:if test="${sessionScope.memid eq null}">
	<form name="mainform" method="post" action="loginPro.do"
		onsubmit="return maincheck()">	<%-- 로그인 처리 페이지 --%>
		<div class="container">
			<h3>${page_main}</h3>
			${msg_input}
			<input type="text" name="id" maxlength=20 autofocus
				class="input" placeholder="${str_id}">
			<input type="password" name="passwd" maxlength=30
				class="input" placeholder="${str_passwd}">
			<div class="wrap">
				<input type="submit" value="${btn_login}" class="button">
				<input type="reset" value="${btn_cancel}" class="button">
				<input type="button" value="${btn_input}"							
					onclick="location='inputForm.do'" class="button">
			</div>
		</div>
	</form>
</c:if>
<c:if test="${sessionScope ne null}">
<%--
 	} else { // login
 		--%>
	<div class="container">
		<h3>${page_main}</h3>
		${msg_main}${sessionScope.memid}!
		<div class="wrap">
		 	<input type="button" value="${btn_modify}"
		 		onclick="location='modifyForm.do'" class="button">
			<input type="button" value="${btn_del}" 
				onclick="location='deleteForm.do'" class="button">
			<input type="button" value="${btn_logout}"
				onclick="location='logout.do'" class="button">
		</div>
	</div>
</c:if>