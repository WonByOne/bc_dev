<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event : Javascript</title>
<script type="text/javascript">
/*<![CDATA[*/
	function clock() {
		// window.alert("clock");	
		var date = new Date();
		var now = date.getHours()+" : "
				+ date.getMinutes()+" : "
				+ date.getSeconds();
		document.title = now;	
	//	setTimeout("clock()", 1000); // 1000 ms 후 clock() 호출
	}
	setInterval("clock()", 1000); // 1000 ms 마다 호출
	
	function setcolor() {
		if(inputform.color.value)	// "" false 0 - 아무것도 입력되지 않으면 색깔 유지 
//			document.bgColor = window.document.inputform.color.value; // window.document 까지는 생략 가능
			document.bgColor = inputform.color.value; 
	}
	
	function calc(c) {
		switch(true) {
		case c === '+' : // ===, == 결과 같음
			inputform.result.value = eval(inputform.num1.value) + eval(inputform.num2.value); break;
		case c == '-' :
			inputform.result.value = eval(inputform.num1.value) - eval(inputform.num2.value); break;
		case c == '*' :
			inputform.result.value = eval(inputform.num1.value) * eval(inputform.num2.value); break;
		case c == '/' :
			inputform.result.value = eval(inputform.num1.value) / eval(inputform.num2.value); break;
		default :
		}
	}
	
	
	
	/*]]>*/
</script>
</head>
<body bgcolor="black" text=#d6d6d6 onload="clock()">
	<form name="inputform">
		덧셈 : <input type="text" name="num1">
			,<input type="text" name="num2">
			=<input type="text" name="result" readonly>
			<input type="button" value="+" onclick="calc('+'')"> 
			<input type="button" value="-" onclick="calc('-')">
			<input type="button" value="*" onclick="calc('*')">
			<input type="button" value="/" onclick="calc('/')">
			<br>			
	색상 : <input type="text" name="color"> 
		<input type="button" value="선택" onclick="setcolor()"> <br>
		<br>
		
		<a onmouseover="document.bgColor='red'" onmouseout="document.bgColor='black'">red</a> <br>
		<a onmouseover="document.bgColor='blue'" onmouseout="document.bgColor='black'">blue</a> <br>
		<a onmouseover="document.bgColor='yellow'" onmouseout="document.bgColor='black'">yellow</a> <br>
		<a onmouseover="document.bgColor='greeen'" onmouseout="document.bgColor='black'">green</a> <br>
	</form>
</body>
</html>