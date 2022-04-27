<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<link href="${project}/style_member.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>



<form name="loginform" method="post" action="loginPro.do"
	onsubmit="return logincheck()">
	<div class="container">
		<h2>${page_login}</h2>		
		${msg_login}
		<input type="text" name="id" maxlength=20 autofocus
			class="input" placeholder="${str_id}">
		
		<input type="password" name="passwd" maxlength=30
			class="input" placeholder="${str_passwd}">
		<div class="wrap">		
			<input type="submit" value="${btn_login}" class="button">
			<input type="reset" value="${btn_cancel}" class="button">
		</div>
	</div>
</form>