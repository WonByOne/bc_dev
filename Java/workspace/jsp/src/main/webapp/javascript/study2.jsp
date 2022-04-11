<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Times Test</title>
<script type="text/javascript">
/*<![CDATA[*/

	// 구구단 문제를 만드는 함수
	var num = 7;
	var a; 
	var b;
	var answer = new Array(num); // 출력하고 값을 저장 배열로
	
	// 테이블 출력:시험 출제 하는 함수
	function printTest(num) {
		document.write("<div id=tab>");
		document.write("<table border=1>");
		// document.write("<caption align='bottom'>"+caption+"</caption>")	// 아래쪽에 제목 출력
		for(var i=0;i<num;i++) {
			a = parseInt(Math.random()*10);
			b = parseInt(Math.random()*10);
			answer[i] = a * b;
			document.write("<tr height=30px>");
				document.write("<td align='center' width=40px>");		// 번호
				document.write((i+1)+"번");
				document.write("</td>");
				document.write("<td align='center' width=80px'>");		// 문제 
				document.write(a+" × "+b)
				document.write("</td>");
				document.write("<td>");  // 입력
			  	document.write("<input type='text' name='ans'>");
				document.write("</td>");
			document.write("</tr>");
		}
		
		buttons();
		
		document.write("</table>");
		document.write("</div>");
	}
	
	function buttons() { // 입력/취소/리셋
		document.write("<tr>");
		document.write("<td align='center' colspan=3>");
		
		document.write("<input type='button' value='Submit' onclick='cnt()'>");	// 제출	
		document.write("<input type='button' value='Cancel' onclick='erase()'>");		  
		document.write("<input type='button' value='Reset' onclick='deleteTable()'>");		
				
		document.write("</td>")
		document.write("</tr>");
	}
	// 
	
	
	// 결과 관련 함수
	function cnt() {
		var cnt = 0;
		for(var i=0; i<num; i++) {
			if(answer[i] == document.getElementsByName("ans")[i].value) {
				cnt++;
			}
		}
		submitform.correct.value = cnt;
		submitform.result.value = cnt/num*100;
	}
	
	// 입력창 초기화
	function erase() {
		for(var i=0; i<num; i++) {
			document.getElementsByName("ans")[i].value = "";
			}
	}

	function deleteTable() {
		//location.reload();
		const element = document.getElementById('tab');
		element.innerHTML = "";
		element.innerHTML = printTest(num);
	}
	
	
	//document.write("<div id=tab>");
	printTest(num);
	//document.write("</div>");
	
	
/*]]>*/
</script>
</head>
<body bgcolor="black" text=#d6d6d6>

<form name="submitform">

맞은 개수 : <input type="text" name="correct" readonly><br>
점수 : <input type="text" name="result" readonly><br>
</form>
</body>
</html>