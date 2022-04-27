<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}/style_member.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>

<%-- delete form 재활용 --%>
<form name="passwdform" method="post" action="modifyView.do">
	<div class="container">
		<h3>${page_modify}</h3>
		${msg_passwd}
		<input type="password" name="passwd" maxlength=30 autofocus
			class="input" placeholder="${str_passwd}">
		<div class="wrap">
			<input type="submit" value="${btn_modify}" class="button"
				onclick="return passwdchk()">
			<input type="button" value="${btn_cancel}"
				onclick="location='main.do'" class="button">
		</div>		
	</div>
</form>