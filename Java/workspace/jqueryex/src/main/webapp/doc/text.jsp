<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - html</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			var msg = "";
			// $(selectior).text() / $(selctor).html()
			$("h4").each(
				function(index, item) {
					msg += index+"text : "+$(item).text()+"<br>"
						+index+"html : "+$(item).html()+"<br>";
				}
			);
			// $(selector).text(value) / $(selector).html(value)
			var first = document.getElementById("first");
			first.innerHTML = "<b>DOM</b><br>"; 		// 태그 인식
			$("span").eq(1).text("<b>TEXT</b><br>");	// 태그 미인식
			$("span").eq(2).html("<b>HTML</b><br>");	// 태그 인식
			
			// $(selector).text(function(index, text) {})
			// $(selector).html(function(index, html) {})
			$("h4").text(
				function(index, text) {
					msg += index+" : "+text+"<br>";
				}
			);
			$("h4").html(
				function(index, html) {
					msg += index+" : "+html+"<br>";					
				}
			);
			msg += "<br>"
			// remove
			$("a").first().remove(); // 태그 없앰
			$("a").last().empty();	// 태그 살아있음 - 태그 사이의 내용 지움
			$("a").text(
				function(index, text) {
					msg += "a : "+index+"<br>";
				}
			);
			
		//	$("#result").text(msg); - br까지 출련된다 tag 못 인식함
			$("#result").html(msg);
		}	
	);
/*]]>*/
</script>
<a><b>Naver<br></b></a>
<a><b>Daum<br></b></a>
<br>

<span id="first"></span>
<span></span>
<span></span>

<h4><b>Football</b></h4>
<h4><b>Baseball</b></h4>
<h4>Basketball</h4>
<h4>Volleyball</h4>
<div id="result"></div>