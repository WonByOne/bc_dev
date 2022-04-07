<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Function : Javascript</title>
<script type="text/javascript">
/*<![CDATA[*/
	document.write("<h2>Function : Javascript</h2>");
	
//	document.write("Hello Javascript!!!<br>");
//	document.write("Hello Javascript!!!<br>");
//	document.write("Hello Javascript!!!<br>");
	
	disp(1);	// 선언한 위치에 상관 없이 호출 가능
	function disp(cnt) {
		for(var i=0;i<cnt;i++) { 
			document.write("Hello Javascript!!!<br>");
		}
	}
	disp(2);
	
	// anonymous
//	d(); 	// 선언 전에 사용 불가
	
	var d = function() {
		document.write("Hello Javascript!!!<br>")
	}
	d();
	
	// 매개변수
	function sum(a, b, c) {
		document.write("Sum : "+(a+b+c)+"<br>");
	}
	sum(5, 2); 		// error는 안 남, NaN (Not a Number) return
	sum(5, 2, 7);
 	sum(5, 2, 7, 9); // 남는 매개변수 무시
	
 	// return
 	function subtract(a, b) {
 		return a - b;
 	}
 	document.write("Subt : "+subtract(5, 2)+"<br>");
 	
 	// internal function
 	document.write("isNaN : "+isNaN("123")+"<br>");	// 숫자로 인식
 	document.write("isNaN : "+isNaN("ABC")+"<br>");
 	document.write("isNaN : "+isNaN(123)+"<br>");
 	
 	document.write("parseInt : "+parseInt("10")+"<br>");
 	document.write("parseFloat : "+parseFloat("10.5")+"<br>");
 	document.write("eval : "+("5+2")+"<br>");
 	document.write("eval : "+eval("5+2")+"<br>"); // 문자열을 수식으로
 	document.write("<br>");
 	
 	// functions for string
 	var str = "Hello Javascript!!!";
 	document.write("bold : "+str.bold()+"<br>");
 	document.write("italics : "+str.italics()+"<br>");
 	document.write("strike : "+str.strike()+"<br>");
 	document.write("sub : "+str+str.sub()+"<br>");
 	document.write("sup : "+str+str.sup()+"<br>");
 	document.write("fontcolor : "+str.fontcolor("red")+"<br>");
 	document.write("fontsize : "+str.fontsize(5)+"<br>");
 	
	document.write("charAt : "+str.charAt(6)+"<br>");
	document.write("indexOf : "+str.indexOf("J")+"<br>");
	document.write("substring : "+str.substring(7)+"<br>");
	document.write("concat : "+str.concat("!!")+"<br>");
	document.write("<br>");
	
	// time and date
	var date = new Date();
	var now = date.getFullYear()+"년 "
			+(date.getMonth()+1)+"월 "
			+date.getDate()+"일 "
			+date.getHours()+"시 "
			+date.getMinutes()+"분 "
			+date.getSeconds()+"초 "
			+date.getDay();	// 요일을 숫자로 return
	document.write("Now : "+now+"<br>");
	document.write("<br>");
	
	// class array
	var m = [10, 20, 30, 40, 50];			// 그냥 배열
	var w = new Array(40, 30, 10, 20 , 50);	// 객체 배열
	document.write("length : "+w.length+"<br>");
	document.write("join : "+w.join()+"<br>"); // default는 ,
	document.write("join : "+w.join("/")+"<br>");
	document.write("sort : "+w.sort()+"<br>");
	
	// class Math
	document.write("random : "+parseInt(Math.random()*100)+"<br>"); // 0~99
	document.write("random : "+(parseInt(Math.random()*100)+1)+"<br>"); // 1~100
	
/*]]>*/
</script>
</head>
<body bgcolor="black" text=#d6d6d6>

</body>
</html>