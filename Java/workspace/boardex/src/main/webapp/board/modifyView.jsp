<%--@page import="board.BoardDataBean"--%>
<%--@page import="board.BoardDBBean"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<link href="${project}/style_board.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>

<h2>${page_modify}</h2>

<%--
	int num = (Integer) request.getAttribute("num");
	String pageNum = (String) request.getAttribute("pageNum");
	int result = (Integer) request.getAttribute("result");
--%>
<c:if test="${result eq 0}">
<%--
	if(result == 0) { // wrong passwd
		--%>
	<script type="text/javascript">
	/*<![CDATA[*/
		erroralert(passwderror);
		/*]]>*/
	</script>
</c:if>
<c:if test="${result ne 0}">
	<%--
} else {		// correct paswd
	BoardDataBean dto = (BoardDataBean) request.getAttribute("dto"); // dto 받기
	--%>
	<form name="modifyform" method="post" action="modifyPro.do"
		onsubmit="return modifycheck()">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
			<table>
			<tr>
				<th colspan=2>
					${msg_modify}
				</th>
			</tr>
			<tr>
				<th>${str_writer}</th>
				<td>&nbsp;${dto.writer}</td>
			</tr>
			<tr>
				<th>${str_email}</th>
				<td>
				<c:if test="${dto.email eq null}">
					<%--
					if(dto.getEmail() == null) {
						--%>
					<input class="input" type="text" name="email"
						maxlength=30 autofocus>
				</c:if>
				<c:if test="${dto.email ne null}">
						<%-- 
					} else {
						--%>
					<input class="input" type="text" name="email" maxlength=30
						autofocus value="${dto.email}">
				</c:if>
				</td>
			</tr>
			<tr>
				<th>${str_subject}</th>
				<td>
					<input class="input" type="text" name="subject"
						value="${dto.subject}">
				</td>
			</tr>
			<tr>
				<th>${str_content}</th>
				<td>
					<textarea name="content" rows=10 cols=40>${dto.content}</textarea>
				</td>
			</tr>
			<tr>
				<th>${str_passwd}</th>
				<td>
					<input class="input" type="password" name="passwd"
						maxlength=20 value="${dto.passwd}">
				</td>
			</tr>
			<tr>
				<th colspan=2>
					<input class="inputbutton" type="submit" value="${btn_modify}">
					<input class="inputbutton" type="reset" value="${btn_cancel}">
					<input class="inputbutton" type="button" value="${btn_mod_cancel}"
						onclick="location='list.do?pageNum=${pageNum}">
				</th>
			</tr>
		</table>
	</form>
</c:if>