<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<link href="/jsp/style_member.css" rel="stylesheet" type="text/css">
<script src="<%=project%>/script.js"></script>

<h2><%=page_login%> </h2>

<form name="loginform" method="post" action="loginPro.jsp"
	onsubmit="return logincheck()">
	<table>
		<tr>
			<th class=tdh colspan=2>
				<%=msg_login%>
			</th>
		</tr>
		<tr>
			<th><%=str_id%></th>
			<td class=tdh><input type="text" name="id" maxlength=20 autofocus
				class="input" placeholder="id"></td>
		</tr>
		<tr>
			<th><%=str_passwd%></th>
			<td class=tdh>
				<input type="password" name="passwd" maxlength=30
				class="input" placeholder="password">
			</td>
		</tr>
		<tr>
			<th class=tdh colspan=2>
				<input type="submit" value="<%=btn_login%>">
				<input type="reset" value="<%=btn_cancel%>">
			</th>
		</tr>
		
	</table>
</form>