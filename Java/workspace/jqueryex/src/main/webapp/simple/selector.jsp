<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - selector</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
		// 전체 선택자
			$("*").css("color", "darkred");
		// 태그 선택자
			$("h4").css("color", "darkblue");
			$("h2").css("color", "darkred");
		// 후손 선택자
			$("h4 b").css("color", "darkgreen");
		// 자식 선택자
			$("h4 > b").css("color", "gold");
		// id 선택자
			$("#point b").css("color", "pink");
		// class 선택자
			$(".strong").css("color", "silver");
			$("h4.strong b").css("color", "silver");
		}
	);
/*]]>*/
</script>
 <br>
 <h4 class="strong">Football</h4>
 <h4 id="point"><b>Baseball</b></h4>
 <h4 class="strong"><a>Basketball</a></h4>
 <h4 class="first strong"><a><b>Volleyball</b></a></h4>
