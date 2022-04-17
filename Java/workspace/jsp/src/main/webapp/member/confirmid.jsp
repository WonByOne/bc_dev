<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<link href="/jsp/style_member.css" rel="stylesheet" type="text/css">
<script src="<%=project%>/script.js"></script>    

<%
	String id = request.getParameter("id"); 
%>
<%
	LogonDBBean dao = LogonDBBean.getInstance();
	int result = dao.checkid(id);
	if(result == 0) {	// id 없음
		%>
		<div class="container">
			<h3><%=page_confirm%></h3>	
			<%=id%><%=msg_id_able%>
			<input type="button" value="<%=btn_ok%>" onclick="setid('<%=id%>')"
				class=button>
		</div>
		<%
	} else { 			// id 중복
		%>
		<form name="confirmidform" method="post" action="confirmid.jsp"
			onsubmit="return confirmidwin()">
			<div class="container">
				<div class="wrap">
					<%=id%> <%=msg_id_unable%>
				</div>
					<input type="text" name="id" maxlength=20 autofocus
						class="input" placeholder="<%=str_id%>">
				<div class="wrap">
					<input type="submit" value="<%=btn_confirm%>"
						class="button">
					<input type="button" value="<%=btn_cancel%>"
						onclick="window.close()" class="button">
				</div>
			</div>
		</form>
		<%
	}
%>
