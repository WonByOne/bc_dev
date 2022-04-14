<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<link href="/jsp/style_member.css" rel="stylesheet" type="text/css">
<script src="<%=project%>/script.js"></script>    

<h2><%=page_confirm%></h2>

<%
	String id = request.getParameter("id"); 
%>
<%
	LogonDBBean dao = LogonDBBean.getInstance();
	int result = dao.checkid(id);
	if(result == 0) {	// id 없음
		%>
			<table border=1>
				<tr>
					<th>
						<%=id%><%=msg_id_able%>
					</th>
				</tr>
				<tr>
					<td>
						<input type="button" value="<%=btn_ok%>"
							onclick="setid('<%=id%>')">
					</td>
				</tr>
			</table>
		<%
	} else { 			// id 중복
		%>
		<form name="confirmidform" method="post" action="confirmid.jsp"
			onsubmit="return confirmidwin()">
			<table border=1>
				<tr>
					<th colspan=2>
						<span><%=id%></span><%=msg_id_unable%>
					</th>
				</tr>
				<tr>
					<th><%=str_id%></th>
					<td><input type="text" name="id" maxlength=20 autofocus
						class="input" placeholder="id"></td>
				</tr>
				<tr>
					<th colspan=2>
						<input type="submit" value="<%=btn_confirm%>">
						<input type="button" value="<%=btn_cancel%>"
							onclick="window.close()">
					</th>
				</tr>
			</table>

		</form>
		<%
	}
%>
