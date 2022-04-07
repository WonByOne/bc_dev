<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loop : Javascript</title>
<script type="text/javascript">
/*<![CDATA[*/
	document.write("<h2>Loop : Javascript</h2>")
	var m = ["Apple", "Strawberry", "Banana", "Pear"];
	for(var i=0; i<m.length; i++) {
		document.write("m["+i+"] : "+m[i]+"<br>");
	}
	
	// Java	for(int i=0; i<m.length; i++) {}
	//		for(int a : m) {}
	for(var i in m) { // index가 나옴 - 단순히 줄여주는 역할
		document.write("m["+i+"] : "+m[i]+"<br>");
	}
	
	// while
	var i = 0;
	while(i<m.length) {
		document.write("m["+i+"] : "+m[i]+"<br>");
		i++;
	}
	
	var i = 0;
	do {
		document.write("m["+i+"] : "+m[i]+"<br>");
		i++;
	} while(i<m.length)
	
	document.write("<h2>Nested Loop</h2>")
	
	document.write("<table border=1");
	document.write("<tr>");
// 	for(var i=2; i<=9; i++){	// 제목용 Loop를 따로 만들어도 됨
//		document.write("<th>");
//		document.write(i+"단");
//		document.write("</th>");
//	}
	document.write("</tr>");
	
	for(var i=0; i<=9; i++) {
		document.write("<tr>");
		for(var j=2; j<=9; j++) {
			if(i == 0) {	// 제목행
				// document.write("<td align=center>");
				document.write("<th>");
				document.write(j+"단");
				document.write("</th>");
			} else {
				document.write("<td>");
				document.write(j+" * "+i+" = "+(j*i).toString());
				document.write("</td>");
			}
		}
		document.write("</tr>");
	}
	document.write("</table>");
	document.write(leadingSpaces(5, 3));
	
/*]]>*/
</script>

</head>
<body bgcolor="black" text=#d6d6d6>

</body>
</html>