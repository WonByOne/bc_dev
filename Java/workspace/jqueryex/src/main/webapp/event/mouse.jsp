<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<script src="/jqueryex/jquery-3.6.0.js"></script>

<h2>jQuery - event: mouse</h2>

<style>
	.outer {
		width : 200px;
		height : 200px;
		background : darkorange;
		padding : 50px;
		
	}
	.inner {
		width : 100px;
		height :  100px;
		background : pink;
		margin : 50px; 
	}
</style>

<script type="text/javascript">
/*<![CDATA[*/
	var msg = "";
	$(document).ready(
		function() {
			$(".outer").mouseover(
				function() {
					msg += "마우스가 들어왔다<br>";
					$("#result").html(msg);
				}
			).mouseout(
				function() {
					msg += "마우스가 나갔다<br>";
					$("#result").html(msg);
				}
			);
			$(".inner").click(
				function() {
					msg = "";
					$("#result").html(msg);
				}	
			).dblclick(
				function() {
					msg += "더블클릭<br>";
					$("#result").html(msg);
				}		
			);
		}
	);
/*]]>*/
</script>

<div class="outer">
	<div class="inner">
	</div>
</div>
<br>
<div id="result"></div>