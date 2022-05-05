<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<h2>HTML5 - Strong Web Form</h2>

<form>
	<table border=1>
		<tr>
			<th>Name</th>
			<td><input type="text" name="name" autofocus></td>
		</tr>
		<tr>
			<th>Age</th>
			<td><input type="text" name="age" placeholder="Numbers Only">
		</tr>
		<tr>
			<th>Sign up date</th>
			<td><input type="datetime-local" name="logtime"></td>
		</tr>
		<tr>
			<th>Date</th>
			<td><input type="date" name="today"></td>
		</tr>
		<tr>
			<th>Time</th>
			<td><input type="time" name="now"></td>
		</tr>
		<tr>
			<th>Month</th>
			<td><input type="month" name="month"></td>
		</tr>
		<tr>
			<th>Week</th>
			<td><input type="week" name="week"></td>
		</tr>
		<tr>
			<th>E-Mail</th>
			<td><input type="email" name="email"></td> <%-- 모바일에서 자판이 달라짐 --%>
		</tr>
		<tr>
			<th>Homepage</th>
			<td><input type="url" name="url"></td>
		</tr>
		<tr>
			<th>Color</th>
			<td><input type="color" name="color"></td>
		</tr>
		<tr>
			<th>Search</th>
			<td><input type="search" name="keyword"></td>
		</tr>
		<tr>
			<th>Tel</th>
			<td><input type="tel" name="tel"></td>
		</tr>
		<tr>
			<th>Number</th>
			<td><input type="number" name="number"></td>
		</tr>
		<tr>
			<th>Range</th>
			<td>1<input type="range" min=1 max=10 step=2 name="range">10</td>
		</tr>
		<tr>
			<th>File</th>
			<td><input type="file" name="file" accept="text/*"></td>
		</tr>
	</table>
</form>

<h2>New Element</h2>
<form oninput="result.value=parseInt(n1.value)+parseInt(n2.value)">
<%-- 간단한 Javascript 사용 가능 --%>
	<input type="number" name="n1" value=0>
	+<input type="number" name="n2" value=0>
	=<output name="result"></output>
</form>
0<progress max=10 value=8></progress>100
<br>
0<meter min=0 max=10 low=3 high=7 value=8></meter>10
<br>
<h2>Text Edit</h2>
<div contenteditable="true">
	<div>Editable</div><br>
	<div contenteditable="false">Non-editable</div><br>
</div>