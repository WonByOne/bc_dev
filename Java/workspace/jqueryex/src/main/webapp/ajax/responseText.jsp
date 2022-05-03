<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<script src="/jqueryex/jquery-3.6.0.js"></script>

<h2>jQuery - event: mouse</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			$("input[value=Submit]").on(
				"click",
				function(event) {
				//	var params = "name="+$("input[name=name]").val()
				//		+ "&age="+$("input[name=age]").val();
				//	var name = $("input[name=name]").val();
				//	var age = $("input[name=age]").val();
					
					$.ajax(
						{
							type : "POST",
							url : "user.jsp",
						//	data : params, 		// 전체를 한 번에
						//	data : {			// 각각 전달
						//		name : name,
						//		age : age,
						//	},
							data : $("form").serialize(), // 각 변수에 알아서 전달
							dataType : "text", // 받을 타입
							success : function(data) {
								$("#result").html(data);
							},
							error : function(error) {
								$("#result").html(error);
							}
						}		
					);
				}		
			);
		}		
	);
/*]]>*/
</script>

<form name="inputform">
	<table border=1>
		<tr>
			<th>Name</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>Age</th>
			<td><input type="text" name="age"></td>
		</tr>
		<tr>
			<th colspan=2>
				<input type="button" value="Submit">
			</th>
		</tr>
	</table>
</form>
<br>
<div id="result"></div>