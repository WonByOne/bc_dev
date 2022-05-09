<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script>
<script type=text/javascript>
/*<![CDATA[*/
	$(document).ready(	// event 처리
		function() { 
			$("input[value=Send]").on( // Send 버튼에 click 이벤트
				"click",
				function(event) {
					var msg = $("input[name=msg]").val();
					if(! msg) {
						$("#console").html("Enter message");
					} else {
						var data = "Message received : "+msg+"<br>";
						$("input[name=msg]").val("");
						ifm.contentWindow.postMessage(
							data,
							"http://localhost:8080" // 확인용 메세지. 일반적으로 서버이름을 준다.
						);
						$("#console").html("Message sent.")
					}
				}
			);
		}
	);
/*]]>*/	
</script>

<h2>HTML5 - Cross Document Messaging</h2>
<h3>Sending</h3>

<form name="inputform">
	<table border=1>
		<tr>
			<th colspan=2>Message to send</th>
		</tr>
		<tr>
			<td>
				<input type=text name=msg>
			</td>
			<th>
				<input type=button value=Send>
			</th>
		</tr>
	</table>
</form>
<br>
<iframe id=ifm src="frame.jsp" width=300 height=200>
</iframe>
<br>
<div id=console></div>