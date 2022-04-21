<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="/jsp/style_member.css" rel="stylesheet" type="text/css">
<script src="<%=project%>/script.js"></script>


    
 <%
 	if(session.getAttribute("memid") == null) { // logout
 		%>
 		<form name="mainform" method="post" action="loginPro.jsp"
 			onsubmit="return maincheck()">	<%-- 로그인 처리 페이지 --%>
			<div class="container">
				<h3><%=page_main%></h3>
				<%=msg_input%>
			
				<input type="text" name="id" maxlength=20 autofocus
					class="input" placeholder="<%=str_id%>">
				<input type="password" name="passwd" maxlength=30
					class="input" placeholder="<%=str_passwd%>">
				<div class="wrap">
					<input type="submit" value="<%=btn_login%>" class="button">
					<input type="reset" value="<%=btn_cancel%>" class="button">
					<input type="button" value="<%=btn_input%>"							
						onclick="location='inputForm.jsp'" class="button">
				</div>
			</div>
 		</form>
 		<%

 	} else { // login
 		%>
 		<div class="container">
 			<h3><%=page_main%></h3>
 			<%=msg_main%><%=session.getAttribute("memid")%>!
 			<div class="wrap">
 			 	<input type="button" value="<%=btn_modify%>"
 			 		onclick="location='modifyForm.jsp'" class="button">
 				<input type="button" value="<%=btn_del%>" 
 					onclick="location='deleteForm.jsp'" class="button">
 				<input type="button" value="<%=btn_logout%>"
 					onclick="location='logout.jsp'" class="button">
 			</div>
 		</div>
 		<%
 	}
 %>