<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>Main Page</h2>

<%-- control 쪽으로 선택한 값을 넘김 --%>
<form method="post" action="control.jsp">	
	<table border=1>
		<tr>
			<th colspan=2>Select Product</th>
		</tr>
		<tr>
			<th>Products</th>
			<td>
				<input type="radio" name="product" value=1>Television<br>
				<input type="radio" name="product" value=2>Digital Camera<br>
				<input type="radio" name="product" value=3>Computer<br>
				<input type="radio" name="product" value=4>Cellphone<br>
			</td>
		</tr>
		<tr>
			<th colspan=2>
				<input type="submit" value="Select">
				<input type="reset" value="Cancel">
			</th>
		</tr>

	</table>

</form>


<body bgcolor="black" text=#d6d6d6>

</body>
