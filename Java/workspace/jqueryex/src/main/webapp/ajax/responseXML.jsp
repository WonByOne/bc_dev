<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<script src="/jqueryex/jquery-3.6.0.js"></script>

<h2>AJAX - XML</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			$.ajax(
				{
					url : "member.xml",
					dataType : "xml",
					success : function(data) {
					//	$("#result").html("정상종료"); // 확인용
						var msg = "";
						$(data).find("member").each(
							function(index, item) {
								msg += "Name : "+$(item).find("name").text()+"<br>"
									+"Age : "+$(item).find("age").text()+"<br>"
									+"Tel : "+$(item).find("tel").text()+"<br>";
								msg += "<br>";
							}
						);
						
						$("#result").html(msg);
					},
					error : function(error) {
						$("#result").html(error);
					}
				}		
			);
		}
	);
/*]]>*/
</script>

<div id="result"></div>