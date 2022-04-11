<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body bgcolor="black" text=#d6d6d6>

<h2>Action Tag - include</h2>
<h2>Input Page</h2>


<form method="post" action="includeTest1.jsp"> <!-- includeTest1.jsp으로만 post 한다 -->
	<table border=1>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="text" name="age"></td>
		</tr>
		<tr>
			<th colspan=2>
				<input type="submit" value="Submit">
				<input type="reset" value="Cancel">
			</th>
		</tr>
	</table>


</form> 


</body>