<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - bind</h2>

<style type="text/css">
	.reverse {
		color : black;
		background : grey;
	}
</style>

<script type="text/javascript">
/*<![CDATA[*/
	function additem() {
		$("h4").text(
			function(index, text) {
				if(index%2 == 0) {
					return text + "★";
				} else {
					return text + "☆";
				}
			}		
		);
	}
	$(document).ready(
		function() {
			// $(selector).bind(eventname, function(event) {})
			$("h4").bind(
				"click",	// event
				function(event) {
					$(this).text($(this).text() +"♥");
				}
			);
			
			// $(selector).bind(OBJ)
			var size = 16;
			$("h4").bind(
				{
					"mouseover" : function() {
						$(this).addClass("reverse");
					},
					"mouseout" : function() {
						$(this).removeClass("reverse");
					},
					"dblclick" : function() {
						$(this).css("font-size", ++size);
					}
				}
			);
			
			setTimeout(
				function() {
					$("h4").unbind("click").unbind("mouseover").unbind("mouseout");
				},
				3000
			);
			
			$("button").bind(	// toogle
				"click",
				function(event) {
					$("h3").toggle();
				}
			);
			
			$("h5").one(
				"click",
				function(event) {
					alert("one");
				}
			);
		}
	);

/*]]>*/
</script>
<h5>one</h5>
<br>
<button>Toggle</button><br>
<h3>Toogle</h3>

<h4 onclick="additem()">Reading</h4>
<h4>Hiking</h4>
<h4>Exercise</h4>
<h4>Video Game</h4>