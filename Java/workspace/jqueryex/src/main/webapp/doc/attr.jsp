<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - attr</h2>
<style type="text/css">
	.point {
		color: darkred;
	}
	.strong {
		color: darkblue;
	}
	
</style>
<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			// addClass
			$("h4").filter(":first").addClass("point");
			$("h4").filter(
				function(index) {
					if(index%2 == 0) return this;
				}
			).addClass("strong");
			// removeClass
			$("h4").removeClass("strong");
			
			// index 1 고르기
		//	$("h4:eq(1)").addClass("point");
		//	$("h4").eq(1).addClass("point");
		//	$("h4").filter(":eq(1)").addClass("point");
			$("h4").filter(
				function(index) {
					return index == 1;
				}
			).addClass("point");
			
			// attr() - DOM 
			var msg = "";
			var first = document.getElementById("first");
			msg += "src : "+first.getAttribute("src")+"<br>";
			first.setAttribute("width", "100px");
			first.setAttribute("height", "160px");
			// attr() - jQuery
			// $(selector).attr(name)
			msg += "src : "+$("img").last().attr("src")+"<br>";
			// $(selector).attr(name, value)
			$("img").last().attr("width","200px").attr("height","150px"); // attr() 여러개 가능
			// $(selector).attr(OBJ)
			$("img").last().attr(
				{
					width: "300px",
					height: "200px" 
				}
			);
			// $(selector).attr(name, function(index, attr) {} )
			$("img").attr(		// img 2개를 순서대로
			 	"width",		
			 	function(index, attr) {	
			 		return (index + 1) * 100;
			 	}
			);
			
			$("img").attr(
				{
					width: function(index, attr) {
						return (index + 1) * 100;
					},
					height: function(index, attr) {
						return (index + 1) * 150;
					}
				}
			);
			
			// removeAttr()
			$("img").removeAttr("width").removeAttr("height");
			
			
			$("#result").html(msg);
		}
	);

/*]]>*/
</script>
<h4>Reading</h4>
<h4 class="strong">Hiking</h4>
<h4>Exercise</h4>
<h4>Video Game</h4>
<br>
<div id="result"></div>
<br>
<img id="first" src="/jqueryex/images/love.png"><br>
<img src="/jqueryex/images/a.jpg"><br>