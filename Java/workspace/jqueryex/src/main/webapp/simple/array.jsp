<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - array</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			var msg = "";
			// array
			var m = [10, 20, 30, 40 ,50];
			
			for(var i=0; i<m.length; i++) { // for
				msg += m[i]+"&nbsp;";
			}
			msg += "<br>";
			
			for(var i in m) {				// for another
				msg += m[i]+"&nbsp;";
			}
			msg += "<br>";
			
			var w = new Array(10, 20, 30, 40 ,50);
			for(var i in w) {
				msg += w[i]+"&nbsp;";
			}
			msg += "<br>";
			
			// $.each(OBJ, function(index, item) {} )
			$.each(
				m,
				function(index, item) {
				//	msg += index+" : "+item+"<br>";
				//	msg += m[index]+"<br>";
				//	msg += item+"<br>"; // item 순서대로 출력
					msg += this+"<br>"; // this == item
				}
			);
			// JSON with each
			var z = [
				{name:"홍길동", age:20},
				{name:"이순신", age:30},
				{name:"김유신", age:40}
			]
			$.each( 
				z,
				function( index, item ) {
					msg += "이름 : " + item.name + "<br>"
						+ "나이 : " + this.age + "<br>";
				}
			);
			
			// $(selector).each( function( index, item ) {} )
			$("h4").each( 
				function( index, item ) {
					msg += index + " : " + $(item).text() + "<br>"; 	
				}			
			);
			$("h4").each(
				function( index ) {
					msg += $(this).text() + "&nbsp;";					
				}		
			);
			msg += "<br>";
			
			$("h4").each( 
				function( index, item ) {
					if( index % 2 == 0 ) $(item).css( "color", "darkred" );
				}		
			);
			
			var color = ["darkred", "darkblue", "darkgreen", "gold"];
			$("h4").each(
				function( index, item ) {
					$(item).css( "color", color[index] );
				}		
			);
			
			$("#result").html(msg);
		}
	);
/*]]>*/
</script>
<br>
<h4>Football</h4>
<h4>Baseball</h4>
<h4>Basketball</h4>
<h4>Volleyball</h4>
<br>
<div id="result"></div>