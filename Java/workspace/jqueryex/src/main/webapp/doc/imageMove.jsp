<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - append 예제: move</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function(){
			$("#img").append(
				"<br>",
				$("<img>").attr(
					{
						src : "/jqueryex/images/a.jpg",
						width : "200px",
						height : "150px"
					}
				),
				$("<img>").attr(
					{
						src : "/jqueryex/images/b.jpg",
						width : "200px",
						height : "150px"
					}
				),
				$("<img>").attr(
					{
						src : "/jqueryex/images/c.jpg",
						width : "200px",
						height : "150px"
					}
				)
			);
			
			setInterval(
				function() {
				//	$("#img").append($("img").first().clone())
					$("#img").append($("img").first())
				},
			1000);
		}
	);
/*]]>*/
</script>
<div id="img"></div>