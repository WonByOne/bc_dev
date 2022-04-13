<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>JDBC - delete</h2>
<h3>Input Page</h3>
<form method="post" action="deleteTest.jsp">
	<table border=1>
		<tr>
			<th>ID</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<th colspan=2>
				<input type="submit" value="탈퇴">
				<input type="reset" value="취소">
			</th>
		</tr>
	</table>
	
</form>

<body bgcolor="black" text="#d6d6d6"/>