<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<script src="/jqueryex/jquery-3.6.0.js"></script>
<script type=text/javascript>
/*<![CDATA[*/
	$(document).ready(
		function() {
			if(! window.localStorage) {
				$("#console").html("Not compatible browser.<br>");
				return;
			} else {
				$("#console").html("Compatible browser.<br>");
			}
			// 저장하기
			$("input[value=저장하기]").on(
				"click",
				function(event) {
					var msg = $("textarea").val();
					if(!msg) {
						$("#console").html("Enter message.<br>");
					} else {
						localStorage.setItem("msg", msg);
						$("#console").html("Message saved.<br>");
					}
				}
			);
			// 삭제하기
			$("input[value=삭제하기]").on(
				"click",
				function(event) {
					$("textarea").val("");
					localStorage.removeItem("msg");
					$("#console").html("Local Storage deleted.<br>")
				}
			);
			// 가져오기
			$("input[value=가져오기]").on(
				"click",
				function(event) {
					var msg = localStorage.getItem("msg");
					if( ! msg) {
						$("#console").html("Local storage is empty.<br>")
					} else {
						$("#result").html(msg);
						$("#console").html("Message loaded.<br>")
						$("textarea").val("");
					}
				}
			);
		}		
	);
/*]]>*/
</script>
<h2>HTML5 - Local Storage</h2>   

<form name=inputform>
	<table border=1>
		<tr>
			<th>Content</th>
			<td><textarea id=ta rows=10 cols=30></textarea></td>
		</tr>
		<tr>
			<th colspan=2>
				<input type=button value="저장하기">
				<input type=button value="가져오기">
				<input type=button value="삭제하기">
			</th>
		</tr>
	</table>
</form> 
<div id=result></div>
<br>
<div id=console></div>
<br>