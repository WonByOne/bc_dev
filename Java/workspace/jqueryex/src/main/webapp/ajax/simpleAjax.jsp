<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<h2>Simple Ajax</h2>

<script type="text/javascript">
/*<![CDATA[*/
	var httpRequest = null;
	function show() {
		var params = "name="+encodeURI(inputform.name.value)
				+ "&age="+inputform.age.value;
		if(window.ActiveXObject) {	// IE 일 경우
			try {
				httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e) {
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			}
		} else {					// 다른 브라우저
			httpRequest = new XMLHttpRequest();
		}
		httpRequest.onreadystatechange = showresult;// 상태가 바뀔 때 실행할 함수
		httpRequest.open("POST", "user.jsp", true);	// 비동기 처리 (DATA 혹은 파일)
		// XML 파일, JSP 출력, JSON 등 올 수 있다.
		httpRequest.setRequestHeader("content-type", "application/x-www-form-urlencoded");
		// request시 넘어가는 header를 설정
		httpRequest.send(params);
	}
	
	function showresult() {
	//	alert(httpRequest.readyState); // 처리상태 확인용
		var result = document.getElementById("result");
		var msg = "";
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
			//	msg += "정상종료<br>"; // 확인용
				msg += httpRequest.responseText + "<br>"; 	// 출력한 내용을 그대로 가져옴
			} else {
				msg += "에러발생 : "+httpRequest.status+"<br>";
			}
		} else {
			msg += "통신중 : "+httpRequest.readyState+"<br>";
		}
		result.innerHTML = msg;
	}
/*]]>*/
</script>
<form name="inputform">
	<table border=1>
		<tr>
			<th>Name</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>Age</th>
			<td><input type="text" name="age"></td>
		</tr>
		<tr>
			<th colspan=2>
				<input type="button" value="Submit" onclick="show()">
			</th>
		</tr>
	</table>
</form>
<div id="result"></div>