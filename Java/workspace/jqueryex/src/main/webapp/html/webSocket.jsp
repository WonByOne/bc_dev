<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<script src="/jqueryex/jquery-3.6.0.js"></script>
<style type=text/css>
	#msg {
		border : solid #d6d6d6 1px;
		width : 400px;
		height : 150px;
		margin : 10px;
		text-align : left;
	}
</style>

<script type=text/javascript>
/*<![CDATA[*/
	$(document).ready(
		function() {
			var ws = null;
			var msg = "";
			if(! window.WebSocket) {	// 웹소켓 지원 여부 확인
				$("#console").html("Not compatible browser.");
				return;
			}
		// 	ws = new WebSocket("ws://echo.websocket.org");	// 메아리 서버(서버 닫힘)
			ws = new WebSocket("ws:localhost:8080/jqueryex/websocket/chat");
			if(! ws) { // 연결 실패
				$("#console").html("Failed to connect.")
			} else {
				ws.onopen = function() {
					$("#console").html("Conneted to server.");
				};
				ws.onclose = function() {
					$("#console").html("Disconnected from server.");
				};
				ws.onmessage = function(event) {
					msg += event.data+"<br>"
					$("#msg").html(msg);
					$("#console").html("Messaged received.")
				};
			}
		
			$("input[value=Send]").on(
				"click",
				function(event) {
					var message = $("input[name=id]").val()+" : "
								+ $("input[name=msg]").val();	// 닉네임과 메세지 합쳐 전달
					
					ws.send(message);
					$("input[name=msg]").val(""); // 메세지 칸 비워주기
					$("#console").html("Message sent.")
				}
			);
		}
	);
/*]]>*/
</script>
<h2>HTML5 - web socket</h2>

<form name=inputform>
	<table border=1>
		<tr>
			<th>Message</th>
			<th>
				<input type=text name=id placeholder=nickname>
			</th>
			<td>
				<input type=text name=msg placeholder="Enter message.">
			</td>
			<th>
				<input type=button value=Send>
			</th>
		</tr>
		<tr>
			<th colspan=4>
				<div id=msg></div>
			</th>
		</tr>
	</table>
</form>
<br>
<div id=console></div>