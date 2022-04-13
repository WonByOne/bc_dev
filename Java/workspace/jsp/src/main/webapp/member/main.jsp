<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="/jsp/style_member.css" rel="stylesheet" type="text/css">
<script src="<%=project%>/script.js"></script>

<h2><%=page_main%></h2>
    
 <%
 	if(session.getAttribute("memid") == null) { // logout
 		%>
 		<form name="mainform" method="post" action="loginPro.jsp"
 			onsubmit="return maincheck()">	<%-- 로그인 처리 페이지 --%>
			<table border=1>
				<tr>
					<th colspan=2>
						<%=msg_input%>
					</th>
				</tr>
				<tr>
					<th><%=str_id%></th>
					<td><input type="text" name="id" maxlengh=20 autofocus></td>
				</tr>
				<tr>
					<th><%=str_passwd%></th>
					<td><input type="password" name="passwd" maxlength=30></td>
				</tr>
				<tr>
					<th colspan=2>
						<input type="submit" value="<%=btn_login%>">
						<input type="reset" value="<%=btn_cancel%>">
						<input type="button" value="<%=btn_input%>">
					</th>
				</tr>				
			</table>
 		</form>
 		<%

 	} else { // login
 		
 	}
 %>