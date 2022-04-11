<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*<![CDATA[*/
	var m = [];
	
	for(var i=0;i<10;i++) {
		m[i] = [];
		m[i][0] = parseInt(Math.random()*8) + 2;
		m[i][1] = parseInt(Math.random()*9) + 1;
		m[i][2] = m[i][0]*m[i][1];
	}
	
	document.write("<form name='inputform'>");
	document.write("<table border=1>");
	for(var i=0;i<10;i++) {
		document.write("<tr>");
		document.write("<th width=100>"+(i+1)+"번 문제</th>");
		document.write("<th width=100>"+m[i][0]+" × "+m[i][1]+"</th>");
		document.write("<td><input type='text' name='answer"+i+"'></td>");	// answer1, 2, 3으로 처리
		document.write("</tr>");
	}
	document.write("<th colspan=3>");
	document.write("	<input type='button' value='제출' onclick='result()'>");
	document.write("	<input type='button' value='취소' onclick='cancel()'>");
	document.write("	<input type='button' value='다시' onclick='refresh()'>");
	document.write("</th>");
	document.write("</table>");
	
	document.write("<br>");
	document.write("맞은 개수 <input type='text' name='cnt' readonly><br>");
	document.write("점수 <input type='text' name='score' readonly><br>");
	
	document.write("</form>");
	
	function result() {
		var cnt = 0;
		var sum = 0;
		
		for(var i=0;i<10;i++) {
			if(m[i][2] == eval("inputform.answer"+i).value) {	// eval로 문자열을 변수처럼 사용
				cnt ++;
				sum += 10;
			}
		}
		inputform.cnt.value = cnt;
		inputform.score.value = sum;
	}
	
	function cancel() {
		for(var i=0;i<10;i++) {
			eval("inputform.answer"+i).value="";
		}
		inputform.cnt.value="";
		inputform.score.value="";
	}
	
	function refresh() {
//		location.reload();
		location.href="study2'.jsp";
	}
	
/*]]>*/
</script>
</head>
<body bgcolor="black" text=#d6d6d6>

</body>
</html>