<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2> 문서 객체 탐색 </h2>

<script type="text/javascript">
	// <!--
	$(document).ready(
		function() { 
			// filter
			// $(selector).filter( selector )
			$("h4:even").css( "color", "darkred" );
			$("h4:first").css( "color", "darkblue" );
			
			$("h4").filter(":odd").css("color", "darkgreen" );
			$("h4").filter(":even").css("color", "gold").css("background", "grey");
			$("h4").filter(":even").css( 
				{
					color:"#d6d6d6",
					background:"grey"
				} 
			);
			
			$("h4").filter(":odd").filter(":even").css("color", "yellow");
			
			// $(selector).filter( function(index) {} )
			$("h4").filter(
				function( index ) {
					if( index%2==0 ) return this;
				}		
			).css(
				{
					color:"black",
					background:"grey"
				}		
			);
			
			// eq
			$("h4").eq(2).css("font-style", "italic" );
			$("h4:eq(2)").css("font-style", "italic" );
			$("h4").filter(":eq(2)").css("font-style", "italic" );
			
			// first
			$("h4").first().css( "font-size", "1.5em" );
			
			// last
			$("h4").last().css( "font-size", "1.5em" ); 
			
			// end
			$("h5").filter(":even").filter(":odd").css( "color", "red" )
			.end().css( "color", "blue" );
			
			// add
			$("h5").filter( ":odd" ).css( "color","red" )
			.add("h5").filter(":even").css( "color","green" );
			
			// is
			$("h5").each(
				function( index, item ) {
					if( $(item).is(".point") ) {
						$(item).css("color", "gold" );
					}
				}		
			);
			
		}
	);
	//-->
</script>
<h5 class="point"> 축구 </h5>
<h5> 야구 </h5>
<h5> 농구 </h5>
<h5> 배구 </h5>

<br><br>
<h4> 딸기 </h4>
<h4> 사과 </h4>
<h4> 바나나 </h4>
<h4> 키위 </h4>























