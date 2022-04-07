<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exercising JavaScript</title>
<script type="text/javascript">
/*<![CDATA[*/
	document.write("Hello JavaScript!!!<br>");
	document.write(10+"<br>");
	document.write(10.5+"<br>");
	document.write("ABC"+"<br>");
	document.write(true+"<br>");
	
	
	// windows.alert("경고창");
	
	// var str = window.prompt();
	// document.write(str+"<br>");
	
	// window.confirm("할거냐? 말거냐?");
	
	// window.open();
	
	// window.print(); // 출력창
	
	// 변수
	var a = 10;
	var b = "ABC";
	document.write(a+"<br>");
	document.write(b+"<br>");
	
	document.write(typeof(10)+"<br>");
	document.write(typeof("ABC")+"<br>");
	
	// 자동형변환
	document.write("5+2"+"<br>");
	document.write("5"+"2"+"<br>");
	document.write("5"+2+"<br>");
	document.write(5+2+"<br>");
	
	document.write("5-2"+"<br>");
	document.write("5"-"2"+"<br>");
	document.write("5"-2+"<br>");
	document.write(5-2+"<br>");
	
	document.write("5/2"+"<br>");
	document.write("5"/"2"+"<br>");
	document.write("5"/2+"<br>");
	document.write(5/2+"<br>");
	
	// 일치연산자
	if(0 == "") document.write("같다<br>");		
	if(0 == false) document.write("같다<br>");
	if("" == false) document.write("같다<br>");
	if("5" == 5) document.write("같다<br>");
	
	if(0 === "") document.write("같다<br>");		// === 자료형 인식
	else document.write("다르다<br>");
	if(0 === false) document.write("같다<br>");
	else document.write("다르다<br>");
	if("" === false) document.write("같다<br>");
	else document.write("다르다<br>");
	if("5" === 5) document.write("같다<br>");
	else document.write("다르다<br>");
	
	// array
	// Java			int m[] = new int[3];
	// 				int m[] = {10, 20, 30};
	var n = [];
	var m = [10, 20, 30];
	m[4] = 50;  //  m[3]를 건너뛰고 넣으면 배열 자체는 확장이 된다 m[3]는 정의되지 않음
	for(var i=0; i<m.length; i++) {
		document.write("m["+i+"] : "+m[i]+"<br>");
	}
	
	// switch ~ case
	var a = 90;
	switch(true) {
	case a >= 90 : document.write("Grade A<br>"); break;
	case a >= 80 : document.write("Grade B<br>"); break;
	case a >= 70 : document.write("Grade C<br>"); break;
	case a >= 60 : document.write("Grade D<br>"); break;
	default : document.write("Grade F<br>");
	}
	
	var date = new Date();
	var now = date.getHours();
	// var now = new Date().getHours(); // 가능
	switch(true) {
	case now < 9 : document.write("Morning<br>"); break;
	case now < 14 : document.write("Noon<br>"); break;
	case now < 18 : document.write("Afternoon<br>"); break;
	default : document.write("Night<br>");
	}
	
	// 짧은 조건문
	true && document.write("true && <br>");
	false && document.write("false && <br>");	// 뒤 실행 안 함
	true || document.write("true || <br>");		// 뒤 실행 안 함
	false || document.write("false || <br>");
	
	
/*]]>*/
</script>
</head>
<body bgcolor="black" text=#d6d6d6>
	<h2>JavaScript</h2>
	
	document.write("Hello JavaScript!!!");
</body>
</html>