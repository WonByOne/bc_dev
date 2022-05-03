<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<script src="/jqueryex/jquery-3.6.0.js"></script>

<h2>AJAX - XML/JSON</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			var msg ="";
			$.ajax(
				{
					url : "books.jsp",
					dataType : "xml",
					success : function(data) {
					//	$("#result").html("정상");
						var books = eval("("+$(data).find("books").text()+")");
						$.each(
							books.book,
							function(index, item) {
								msg += "Title : "+item.title+"<br>"
									+"Author : "+item.author+"<br>";
									+"Price : "+item.price+"<br>"
							}
						);
						msg += "<br>";
						$("#result").html(msg);
						
						$.each(
							books.book,
							function(index, item) {
								$("<tr></tr>").html(
									"<td>"+item.title+"</td>"
									+"<td>"+item.author+"</td>"
									+"<td>"+item.price+"</td>"
								).appendTo("#t");
							}
						);
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
<table border=1>
	<tbody id="t">
	</tbody>
</table>