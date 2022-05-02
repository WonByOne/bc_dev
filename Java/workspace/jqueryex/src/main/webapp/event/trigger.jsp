<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - trigger</h2>
<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			//$(selector).trigger(eventname)
			$("h4").bind(
				"click",
				function(event) {
					$(this).text($(this).text() + "☆");
				}
			);
			var cnt = 0;
			setInterval(
				function() {
					$("h4:eq("+ cnt++%4 +")").trigger("click");
				}, 1000	
			);
			//$(selector).tirgger(eventname, [data1, data2, ...])
			$("h3").bind(
				"click",
				function(event, data1, data2) {
					$(this).text($(this).text()+data1+data2);
				}
			);
			setInterval(
				function() {
					$("h3").trigger("click", ["▷", "◁"]);
				}, 1000					
			);
			// preventDefault /stopPropagation
			$("a").bind(
				"click",
				function(event) {
					$(this).css("color", "darkred");
				//	event.preventDefault();  // 기본 이벤트 해제
					event.stopPropagation(); // 상위 태그로 전달 안 됨.
					
					return false;
				}
			);
			$("h5").bind(
				"click",
				function(event) {
					$(this).css("background", "grey");
				}
			);
		}	
	);
/*]]>*/
</script>
<h5><a href="http://www.naver.com">Naver</a></h5>
<h5><a href="http://www.daum.net">Daum</a></h5>
<h5>test</h5>
<h3>Football </h3>
<h3>Baseball </h3>
<h3>Basketball </h3>
<h3>Volleyball </h3>

<h4>Strawberry </h4>
<h4>Banana </h4>
<h4>Watermelon </h4>
<h4>Apple </h4>