<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nested Array : Javascript</title>
<script type="text/javascript">
/*<![CDATA[*/
	function printArr(m, caption) {	// 배열 테이블에 출력 함수
		document.write("<table border=1>");
		document.write("<caption align='bottom'>"+caption+"</caption>")	// 아래쪽에 제목 출력
		for(var i=0;i<m.length;i++) {
			document.write("<tr height=30px>");
			for(var j=0;j<m[i].length;j++) {
				document.write("<td align=center width=27px>");
				if(m[i][j] !== undefined) {
					document.write(m[i][j]);
				}
				document.write("</td>");
			}
			document.write("</tr>");
		}
		document.write("</table><br>");	
	}
	
	var size = 5;
	var cnt = 0;
	// m = new Array(size, size); 불가능
	
	var m = new Array(size);

	for (var i=0; i<m.length; i++) {
    	m[i] = new Array(size);
	}
	
	var a = parseInt(size/2);	// 실수로 나오기 때문에 index 용으로
	var b = parseInt(size/2);
	// document.write(a+" "+b);;
	
	for(var i=0;i<m.length;i++) {
		for(var j=a;j<=b;j++) {
			m[i][j] = ++cnt;
		}
		if (i < parseInt(size/2)) {
			a--; b++;
		} else {
			a++; b--;
		}
	}
	printArr(m, "마름모");
	
	
	
	var n = new Array(size);
	
	for (var i=0; i<n.length; i++) {
	    n[i] = new Array(size);
	}
	
	cnt = 0;
	var row = n.length - 1;
	var col = n[0].length -1;
	
	for(var k=0;k<size;k++) {
		if(k%2==0) {
			for(var i=0+parseInt(k/2);i<=row-parseInt(k/2);i++) {		// 순서대로 증가 
				for(var j=0+parseInt(k/2);j<=col-parseInt(k/2);j++) {
								
					if(i == 0+parseInt(k/2) || j == col-parseInt(k/2))	// ㄱ자 모양
						n[i][j] = ++ cnt;
				}
			}
		} else {
			for(var i=row-parseInt(k/2);i>=1+parseInt(k/2);i--) {		// 역순 스캔 
				for(var j=col-1-parseInt(k/2);j>=0+parseInt(k/2);j--) {	
									
					if(i == row-parseInt(k/2) || j == parseInt(k/2)) 	// ㄴ 자 모양
						n[i][j] = ++ cnt;
				}
			}	
		}
	}
	printArr(n, "달팽이");
	
/*]]>*/
</script>
</head>
<body bgcolor="black" text=#d6d6d6>

</body>
</html>