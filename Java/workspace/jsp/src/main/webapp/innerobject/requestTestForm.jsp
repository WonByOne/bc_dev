<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<link href="../style_member.css" rel="stylesheet" type="text/css">
</head>


<body bgcolor="black" text=#d6d6d6>
<h2>InnerObject - request</h2>
<h2>Input Page</h2>

<form method="post" action="requestTest.jsp"> <!-- 대량, 암호화 post 방식으로 전송 -->
	<table border=1>
			<tr>
				<th>Name</th>
				<td class="tdh"><input class="line" type="text" name="name"></td>
			</tr>
			<tr>
				<th>Age</th>
				<td class="tdh"><input class="line" type="text" name="age"></td>
			</tr>
			<tr>
				<th>Gender</th>
				<td class="tdh">
				<div id="gender">
				<input id="r1" type="radio" name="gender" value=1 checked="checked">
					<label for="r1">Male</label>
					<input id="r2" type="radio" name="gender" value=2>
					<label for="r2">Female</label>
				</div>
				</td>
				
			</tr>
			<tr>
				<th>Hobby</th>
				<td class="tdh">
					<label class="checkbox">
					<input type="checkbox" name="hobby" value=1>
					<span class="checkbox_icon"></span>
   					<span class="checkbox_text">Reading</span>
					</label>
					<label class="checkbox">
					<input type="checkbox" name="hobby" value=2>
					<span class="checkbox_icon"></span>
   					<span class="checkbox_text">Hiking</span>
   					</label>
   					<label class="checkbox">
					<input type="checkbox" name="hobby" value=3>
					<span class="checkbox_icon"></span>
   					<span class="checkbox_text">Exercising</span>
   					</label>
   					<label class="checkbox">
					<input type="checkbox" name="hobby" value=4>
					<span class="checkbox_icon"></span>
   					<span class="checkbox_text">Video Game</span>
   					</label>
					
				</td>
			</tr>
			<tr>
				<th class="tdh" colspan=2 align=right>
					<input class="inputbutton" type="submit" value="Submit">
					<input class="inputbutton" type="reset"  value="Cancel">
				</th>
			</tr>
		</table>

</form>


</body>