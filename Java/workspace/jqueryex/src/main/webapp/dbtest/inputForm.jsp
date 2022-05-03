<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script>
<script src="script.js"></script>
<%-- 임포트 순서 중요 --%>

<h2>회원 가입</h2>
<form method="post" action="inputPro.jsp">
	<table border=1>
		<tr>
			<th width="100px">ID</th>
			<td><input type="text" name="id"></td>
			<td width="180px"><div id="idcheck">Enter ID.</div></td>
		</tr>
		<tr>
			<th rowspan=2>Password</th>
			<td><input type="password" name="passwd"></td>
			<td rowspan=2><div id="passwdcheck">Enter Password.</div></td>
		</tr>
		<tr>
		 	<td><input type="password" name="repasswd"></td>
		</tr>
		<tr>
			<th>Name</th>
			<td><input type="text" name="name"></td>
			<td><div>Enter your name.</div></td>
		</tr>
		<tr>
			<th>Tel</th>
			<td><input type="text" name="tel"></td>
			<td><div id="telcheck">Enter Tel No.</div></td>
		</tr>
		<tr>
			<th colspan=3>
				<input type="submit" value="Submit">
				<input type="reset" value="Cancel">
			</th>
		</tr>
	</table>

</form>
