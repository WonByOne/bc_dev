<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <h2>Thumbnail Image: Input</h2>
 
 <form method="post" enctype="multipart/form-data" action="thumbnailPro.jsp">
 	<table border=1>
 		<tr>
 			<th>제목</th>
 			<td><input type="text" name="title"></td>
 		</tr>
 		<tr>
 			<th>이름</th>
 			<td><input type="text" name="name"></td>
 		</tr>
 		<tr>
 			<th>이미지</th>
 			<td><input type="file" name="img"></td>
 		</tr>
 		<tr>
 			<th colspan=2>
 				<input type="submit" value="전송">
 				<input type="reset" value="취소">
 			</th>
 		</tr>
 	</table>
 
 </form>
 <body bgcolor="black" text="#d6d6d6"/>