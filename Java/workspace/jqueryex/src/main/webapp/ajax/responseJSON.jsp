<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<script src="/jqueryex/jquery-3.6.0.js"></script>

<h2>AJAX - JSON</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			$.ajax(
				{
					url : "member.jsp",
					dataType : "text",
					success : function(data) {
					//	$("#result").html("정상");
						var msg = "";
						var members = eval("("+data+")");
						for(var i=0; i<members.member.length; i++) {
							msg += "Name : " + members.member[i].name+"<br>"
								+"Age : " + members.member[i].age+"<br>"
								+"Tel : " + members.member[i].tel+"<br>";
							msg += "<br>";
						}
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