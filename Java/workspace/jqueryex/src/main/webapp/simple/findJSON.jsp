<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - find: JSON</h2>

<script type="text/javascript">
/*<![CDATA[*/
	var xml = "<books>"
			+	"<![CDATA["
			+		"{book : ["
			+			"{"
			+				"title : 'Java Programming',"
			+				"author : '홍길동',"
			+				"price : '25,000'"
			+			"},"
			+			"{"
			+				"title : 'JSP Web Programming',"
			+				"author : '이순신',"
			+				"price : '30,000'"
			+			"},"
			+			"{"
			+				"title : 'Spring Framework',"
			+				"author : '김유신',"
			+				"price : '45,000'"
			+			"}"
			+		"]}"
			+	"]]>"
			+ "</books>"
			
	$(document).ready(
		function() {
			var msg = "";
			var xmldoc = $.parseXML(xml);
			// DOM
			var books = eval("("+xmldoc.getElementsByTagName("books").item(0).firstChild.nodeValue+")");
			for(var i=0; i<books.book.length; i++) {
				msg += "Title : "+books.book[i].title+"<br>"
					+"Author : "+books.book[i].author+"<br>"
					+"Prince : "+books.book[i].price+"<br>";
				msg += "<br>";
			}
			
			// jQuery
			var data = eval("("+$(xmldoc).find("books").text()+")");
			for(var i=0; i<data.book.length; i++) {
				msg += "Title :"+data.book[i].title+"<br>"
					+"Author : "+data.book[i].author+"<br>"
					+"Price : "+data.book[i].price+"<br>";
				msg += "<br>";
			}
			
			$.each(
				data.book,
				function(index, item) {	// item이 JSON 표현식 book이 됨
					msg += "Title : "+item.title+"<br>"
						+"Author : "+item.author+"<br>"
						+"Price : "+item.price+"<br>";
					msg += "<br>";
				}
			);
			
			$("#result").html(msg);
		}
	);
/*]]>*/
</script>
<div id="result"></div>