<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body text=#d6d6d6 bgcolor="black"/>

<h2>EL - Input</h2>
<form method="post" action="elTestPro.jsp">
	<table border=1>
		<tr>
			<th>Name</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="text" name="age"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="gender" value=1>남자
				<input type="radio" name="gender" value=2>여자
			</td>
		</tr>
		<tr>
			<th>취미</th>
			<td>
				<input type="checkbox" name="hobby" value=1>Reading
				<input type="checkbox" name="hobby" value=2>Hiking
				<input type="checkbox" name="hobby" value=3>Exercise
				<input type="checkbox" name="hobby" value=4>Video Game
			</td>
		</tr>
		<tr>
			<th colspan=2>
				<input type="submit" value="Submit">
				<input type="reset" value="Cancel">
			</th>
		</tr>
	</table>
</form>