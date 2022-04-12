<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>Action tag - useBean</h2>
<h3>Input Page</h3>
<form method="post" action="simpleBeanPro.jsp">
	<table border=1>
		<tr>
			<th>Name</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>Age</th>
			<td><input type="text" name="age"></td>
		</tr>
		<tr>
			<th>Tel</th>
			<td><input type="text" name="tel"></td>
		</tr>
		<tr>
			<th>Address</th>
			<td><input type="text" name="addr"></td>
		</tr>
		<tr>
			<th colspan=2>
				<input type="submit" value="Submit">
				<input type="reset" value="Cancel">
				
			</th>
		</tr>
		
	</table>

</form>

<body bgcolor="black" text="#d6d6d6">
</body>