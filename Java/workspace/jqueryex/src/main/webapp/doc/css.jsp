<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - css</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready( 
		function() {
			var msg = "";
			// $(selector).css(name)
			$("h4").each(
				function(index,item) {
					msg += index+" : "+$(item).css("color")+"<br>"
						+index+" : "+$(item).css("font-size")+"<br>";
				}
			);
			// $(selector).css(name, value)
			$("h4").last().css("color", "black").css("background","grey");
			
			// $(selector).css(function(index, style) {})
			var m = ["gold", "silver", "brown", "purple"]
			$("h4").css(
				"color",
				function(index, style) {
					return m[index];
				}
			);
			
			// $(selector).css(OBJ)
			$("h4").first().css(
				{
					color:"black",
					background:"grey"
				}	
			);
			
			var size = [20, 21, 22, 23];
			var back = ["silver", "grey", "lightgrey", "darkgrey"];
			$("h4").css {
				{ 
					font-size:function(index) {
						return size[index];
					},
					background:function(index) {
						return back[index];
					}
				}
			};
			
			$("#result").html(msg);
		}	
	);
/*]]>*/
</script>

<h4>Banana</h4>
<h4>Strawberry</h4>
<h4>Pear</h4>
<h4>Watermelon</h4>
<div id="result"></div>