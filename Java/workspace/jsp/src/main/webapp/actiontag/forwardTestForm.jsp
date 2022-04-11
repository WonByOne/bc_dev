<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body bgcolor="black" text=#d6d6d6>

<h2>Action Tag - forward</h2>
<h3>Input Page</h3>
 
 <!-- post 방식 암호화 길이제한 없음 / default는 get 방식 -->
<form method="post" action="forwardTest.jsp">
	<table>
		<tr>
			<th>Name</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>Color</th>
			<td>
				<input type="radio" name="color" value="red">Red<br>
				<input type="radio" name="color" value="blue">Blue<br>
				<input type="radio" name="color" value="yellow">Yellow<br>
				<input type="radio" name="color" value="green">Green<br>
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

</body>
