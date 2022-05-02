<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - context</h2>
<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			$("div").bind(
				"click",
				function(event) {
					var title = $("h4", this).text();
					var name = $("p", this).text();
					alert(title+" : "+name);
				}
			);
		}	
	);
/*]]>*/
</script>

<div>
	<h4>1st </h4>
	<p>Java </p>
</div>
<div>
	<h4>2nd </h4>
	<p>JSP </p>
</div>
<div>
	<h4>3rd</h4>
	<p>Spring</p>
</div>
