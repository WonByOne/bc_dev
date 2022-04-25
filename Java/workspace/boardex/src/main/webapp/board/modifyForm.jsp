<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="<%=project%>/style_board.css" rel="stylesheet" type="text/css">
<script src="<%=project%>/script.js"></script>

<h2><%=page_modify%></h2>

<%
	int num = (Integer) request.getAttribute("num");
	String pageNum = (String) request.getAttribute("pageNum");
%>
<form name="passwordform" method="post" action="modifyView.do">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<table>
		<tr>
			<th colspan=2><%=msg_passwd%></th>
		</tr>
		<tr>
			<th><%=str_passwd%></th>
			<td><input class="input" type="password" name="passwd"
				maxlength=20 autofocus>
			</td>
		</tr>
		<tr>
			<th colspan=2>
				<input class="inputbutton" type="submit" value="<%=btn_modify%>">
				<input class="inputbutton" type="button" value="<%=btn_cancel%>"
					onclick="location='list.do?pageNum=<%=pageNum%>'">
			</th>
		</tr>
	</table>
</form>