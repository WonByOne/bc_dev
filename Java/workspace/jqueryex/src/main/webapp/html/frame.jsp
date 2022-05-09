<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">
<script type=text/javascript>
/*<![CDATA[*/
	var origin = "http://localhost:8080"
	window.onmessage = function(event) {
		if(origin == event.origin) {
			var result = document.getElementById("result");
			result.innerHTML += event.data + "<br>";
		}
	}
/*]]>*/

</script>

<h3>Receiving</h3>
<br>
<div id=result></div>