<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<link href="${project}/style_member.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>    

<%--	// handler로부터 가져오는 변수
	int result = (Integer) request.getAttribute("result");
	String id = (String) request.getAttribute("id");   
	// requestScope.id 사용  requestScope는 생략 가능
--%>
<c:if test="${result eq 0}">
<%--
	if(result == 0) {	// id 없음
		--%>
	<div class="container">
		<h3>${page_confirm}</h3>	
		${id}${msg_id_able}
		<input type="button" value="${btn_ok}" onclick="setid('${id}')"
			class=button>
	</div>
</c:if>
<c:if test="${result ne 0}">
		<%--
	} else { 			// id 중복
		--%>
	<form name="confirmidform" method="post" action="confirmid.do"
		onsubmit="return confirmidwin()">
		<div class="container">
			<div class="wrap">
				${id} ${msg_id_unable}
			</div>
				<input type="text" name="id" maxlength=20 autofocus
					class="input" placeholder="${str_id}">
			<div class="wrap">
				<input type="submit" value="${btn_confirm}"
					class="button">
				<input type="button" value="${btn_cancel}"
					onclick="window.close()" class="button">
			</div>
		</div>
	</form>
</c:if>

