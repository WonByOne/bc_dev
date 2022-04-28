<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery</h2>

<script type="text/javascript">
/*<![CDATA[*/
	function show() {
		var result = document.getElementById("result");
		result.innerHTML = "onload<br>";
	}
/*	window.onload = function() { // window 객체의 onload 사용
		var result = document.getElementById("result");
		result.innerHTML = "onload<br>";
	} */
	
/*	jQuery(document).ready( 	// jQuery 사용
		function() {
			var result = document.getElementById("result");
			result.innerHTML = "onload<br>";
		}
	); */
	$(document).ready(	// jQuery 대신 $ 사용 
		function() {
			alert("onload");
		}	
	);
	$(document).ready(	// alert 반복 가능
			function() {
				alert("onload2");
			}	
		);
	$( function() {		// $만 사용하면 document.ready
		 alert("onload3");
		}
	);
	

/*]]>*/
</script>

<!--body onload="show()"> body tag에서 onload로 show() 호출--> 
<body> 
	<div id="result"></div>
</body>