<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<link href="<%=project%>/style_member.css" rel="stylesheet" type="text/css">
<script src="<%=project%>/script.js"></script>



<form name="inputform" method="post" action="inputPro.do"
	onsubmit="return inputcheck()">
	<input type="hidden" name="confirm" value=0> <!-- html에서 변수처럼 사용: 중복확인-->
	
	<div class="container">
		<div class="wrap">
			<h3> <%=page_input%></h3>
			<input type="button" value="<%=btn_confirm%>"
				onclick="confirmid()" class="button">
		</div>
		<input type="text" name="id" maxlength=20 autofocus
			class="input" placeholder="<%=str_id%>">
		<input type="password" name="passwd" maxlength=30
			class="input" placeholder="<%=str_passwd%>">
		<input type="password" name="repasswd" maxlength=30
			class="input" placeholder="PASSWORD CONFIRM">
		<input type="text" name="name" maxlength=30
			class="input" placeholder="<%=str_name%>">
		<div class="wrap">
			<input type="text" name="birth" maxlength=6 onkeyup="nextbirth()"
				class="input ssn" placeholder="BIRTH">
				- <input type="text" name="ssn" maxlength=7 onkeyup="nextssn()"
					class="input ssn" placeholder="RRN">
		</div>	
		<div class="wrap">
			<input type="text" name="tel1" maxlength=3 onkeyup="nexttel1()"
				class="input tel" placeholder="<%=str_tel%>">
				- <input type="text" name="tel2" maxlength=4 onkeyup="nexttel2()"
					class="input tel">
				- <input type="text" name="tel3" maxlength=4 onkeyup="nexttel3()"
					class="input tel">
		</div>
		<div class="wrap">
			<input type="text" name="email_id" maxlength=15
				class="input email" placeholder="<%=str_email%>">
				@
				<select name="email_prov">
					<option value=0>입력</option>
					<option value="naver.com">Naver</option>
					<option value="daum.net">Daum</option>
					<option value="gmail.com">GMail</option>
					<option value="nate.com">Nate</option>
				</select>
		</div>
		<div class="wrap">
			<input type="submit" value="<%=btn_input%>" class="button">
			<input type="reset" value="<%=btn_cancel%>" class="button">
			<input type="button" value="<%=btn_home%>"
				onclick="location='main.do'" class="button">
		</div>
	</div>
</form>
