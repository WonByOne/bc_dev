<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - attribute selector</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(function() {
		$("input[name=id]").val("Enter ID.")
		$("input[type=text]").css("background", "darkgrey");
		 
		$("input[value=Submit]").css("background", "darkred");
		$("input[type=reset]").css("background", "darkblue");
		 
		$("input:button, input:reset").css("background", "black");
		$("input:button[value=Submit]").css("background", "darkgrey");
		}
	);
	
	function deleteid() {	// input창에 기존 띄위진 글자를 지움
		// inputform.id.value = "";  	// DOM 방식
		// $("input[name=id]").val(""); // jQuery 방식
		$("input:text:focus").val("");	// jQuery filter 선택자
	}
	
	function show() {
//		var result = document.getElementById("result");
		var msg = "";
		
		msg += "ID : "+inputform.id.value+"<br>"
			+"Password : "+inputform.passwd.value+"<br>"
			+"Gender : "+(inputform.gender[0].checked ? "Male" : "Female")+"<br>"
			+"Hobby : "+inputform.hobby.options[inputform.hobby.selectedIndex].value+"<br>";
		msg += "<br>";
		
		msg += "ID : "+$("input[name=id]").val()+"<br>"
			+"ID : "+$("input[type=text]").val()+"<br>"
			+"Password : "+$("input[type=password]").val()+"<br>"
			+"Password : "+$("input:password").val()+"<br>" 	// 콜론(:) 뒤는 type
			+"Gender : "+($("input[name=gender]:checked").val() == "1" ? "Mail" : "Female")+"<br>"
			+"Gender : "+($("input:radio:checked").val() == "1" ? "Male" : "Female")+"<br>"
			+"Hobby : "+$("option:selected").val()+"<br>"
		$("#result").html(msg);
	}
/*]]>*/
</script>

<form name="inputform">
	<table>
		<tr>
			<th>ID</th>
			<td><input type="text" name="id" onfocus="deleteid()"></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<th>Gender</th>
			<td>
				<input type="radio" name="gender" value=1>Male
				<input type="radio" name="gender" value=2>Female
			</td>
		</tr>
		<tr>
			<th>Hobby</th>
			<td>
				<select name="hobby">
					<option value="Reading">Reading</option>
					<option value="Hiking">Hiking</option>
					<option value="Exercise">Exercise</option>
					<option value="Video Game">Video Game</option>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan=2>
				<input type="button" value="Submit" onclick="show()">
				<input type="reset" value="Cancel">
			</th>
		</tr>
	</table>
</form>
<div id="result"></div>