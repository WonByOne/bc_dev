<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logon.LogonDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<link href="${project}/style_member.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>
<%--
	int result = (Integer) request.getAttribute("result");
--%>
<c:if test="${result eq 0}">
<%--
	if(result == 0) { // wrong password
		--%>
	<script type="text/javascript">
	/*<![CDATA[*/
		erroralert(passwderror); 
	/*]]>*/
	</script>
</c:if>
		<%--
	} else { // correct password
		LogonDataBean dto = (LogonDataBean) request.getAttribute("dto");
		--%>
<c:if test="${result ne 0}">
	<form name="modifyform" method="post" action="modifyPro.do"
		onsubmit="return modifycheck()">
		<div class="container">
			<h3>${page_modify}</h3>
			${msg_modify} 
			<input type=text value="${dto.id}" readonly class="readonly">
			<input type="password" name="passwd" maxlength=30 value="${dto.passwd}"
				class="input" placeholder="${str_passwd}">
			<input type="password" name="repasswd" maxlength=30 value="${dto.passwd}"
				class="input" placeholder="PASSWORD CONFIRM">
			<input type="text" value="${dto.name}" readonly class="readonly">
			<div class="wrap">
				<input type="text" value="${dto.birth}" readonly
					class="readonly ssn">
				- <input type="text" value="${dto.ssn}" readonly
					class="readonly ssn">
			</div>
			
			<c:if test="${dto.tel eq null or dto.tel eq ''}">
			<%--
				String tel = dto.getTel();
				if(tel == null || tel.equals("")) {
					--%>
				
					<div class="wrap">
						<input type="text" name="tel1" maxlength=3
							class="input tel" placeholder="${str_tel}">
						- <input type="text" name="tel2" maxlength=4
							class="input tel">
						- <input type="text" name="tel3" maxlength=4
							class="input tel">
					</div>
			</c:if>
			<c:if test="${dto.tel ne null and dto.tel ne ''}">
			<%--
				} else {
					String t[] = tel.split("-");
					--%>
				<c:set var="t" value="${fnc:split(dto.tel, '-')}"/>
				<div class="wrap">
					<input type="text" name="tel1" maxlength=3
						value="${t[0]}" class="input tel">
					- <input type="text" name="tel2" maxlength=4
						value="${t[1]}" class="input tel">
					- <input type="text" name="tel3" maxlength=4
						value="${t[2]}" class="input tel">
				</div>
			</c:if>
			<c:if test="${dto.email eq null or dto.email eq ''}">
			<%--		
				String email = dto.getEmail();
				if(email == null || email.equals("")) {
					--%>
				<div class="wrap">
					<input type="text" name="email_id" maxlength=15
						class="input email" placeholder="${str_email}">
					@ <input type="text" name="email_prov" maxlength=15
						class="input email">
				</div>
			</c:if>
			<c:if test="${dto.email ne null and dto.email ne ''}">
					<%--
				} else {
					String e[] = email.split("@");
					--%>
				<c:set var="e" value="${fnc:split(dto.email, '@')}"/>
				<div class="wrap">
					<input type="text" name="email_id" maxlength=15
						value="${e[0]}" class="input email">
					@ <input type="text" name="email_prov" maxlength=15
						value="${e[1]}" class="input email">
				</div>
			</c:if>
			<%--
				SimpleDateFormat sdf =
					new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			--%>
			<%--
			<fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/> --%> 
			<input type="text"
				value="${str_reg_date} ${dto.reg_date}"
				readonly class="readonly" style="font-size: 13">
			
			<div class="wrap">
				<input type="submit" value="${btn_modify}" class="button">
				<input type="reset" value="${btn_cancel}" class="button">
				<input type="button" value="${btn_home}"
					onclick="location='main.do'" class="button">				
			</div>
		</div>
	</form>
</c:if>