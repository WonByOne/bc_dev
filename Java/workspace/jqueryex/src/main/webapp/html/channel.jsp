<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<style type=text/css>
	.message {
		border : solid darkred 1px;
		width : 150px;
		height : 150px;
		float : left;
		margin : 5px;
	}
	#console {
		clear : left;
	}
</style>

<script src="/jqueryex/jquery-3.6.0.js"></script>

<script type=text/javascript>
/*<![CDATA[*/
	$(document).ready(
		function() {
			var channel = null;
			if(! window.MessageChannel) {
				$("#console").html("Not compatible browser.");
				return;
			} else {
				channel = new MessageChannel();
				channel.port1.start();	// sending
				channel.port2.start();	// receiving
				
				$("#console").html("Channel created.");
			}
			// adding channel
			$("input[value=Add]").on(
				"click",
				function() {
					$("<div>").attr("class", "message").appendTo("#ch")
					$("#console").html("New channel created.")
					
					channel.port2.addEventListener(
						"message",	// 메세지 이벤트 발생
						function(event) {	// 이벤트 발생 시 새로 덮어씌워짐
							$(".message").html("Message received : "+event.data+"<br>");
						}
					);
				}
			);
			
			$("input[value=Send]").on(
				"click",
				function(event) {
					var msg = $("input[name=msg]").val();
					if(! msg) {
						$("#console").html("Enter message.");
						return;
					} else {
						$("#console").html("Message sent : "+msg+"<br>");
						$("input[name=msg]").val("");
						
						channel.port1.postMessage(msg);
					}
				} 
			);
		}		
	);
/*]]>*/
</script>

<h2>HTML5 - Channel Messaging</h2>

<form name=inputform>
	<table border=1>
		<tr>
			<th>Message to send</th>
			<td><input type=text name=msg></td>
		</tr>
		<tr>
			<th colspan=2>
				<input type=button value=Send>
				<input type=button value=Add>
			</th>
		</tr>
	</table>
</form>
<br>
<div id=ch></div>
<br>
<div id=console></div>