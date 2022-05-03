<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">

<script src="/jqueryex/jquery-3.6.0.js"></script>

<h2>jQuery - on / off</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
		// bind
//			$("h4").bind(
//				"click",
//				function(event) {
//					$("<h4>").text($(this).text()).appendTo("#result");
//				}
//			);
//		// unbind
//			setTimeout(
//				function() {
//					$("h4").unbind("click");
//				}, 3000			
//			);
		// $(selector).on(eventname, function(event) {}) 			- bind
//			$("h4").on(
//				"click",
//				function(event) {
//					$("<h4>").text($(this).text()).appendTo("#result");
//				}
//			);
//			
//			setTimeout(
//				function() {
//					$("h4").off("click");
//				}, 3000
//			);
			
		// $(selector).on(eventname, selector, function(event) {})	- live, delegate
			$("div").on(
				"click",
				"h4",
				function(event) {
					$("<h4>").text($(this).text()).appendTo("#result");
				}
			);
			setTimeout(
				function() {
					$("div").off("click");
				}, 3000
			);
		}
	);

	
/*]]>*/
</script>

<div id="result">
	<h4>Football</h4>
	<h4>Baseball</h4>
	<h4>Basketball</h4>
	<h4>Volleyball</h4>
	<hr size=3 color="darkred">
</div>
