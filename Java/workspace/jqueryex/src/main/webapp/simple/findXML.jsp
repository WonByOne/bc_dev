<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - find: XML</h2>

<script type="text/javascript">
/*<![CDATA[*/
	var xml = "<books>"
			+ 	"<book>"
			+ 		"<title>Java 프로그래밍</title>"
			+ 		"<author>홍길동</author>"
			+ 		"<price>25,000</price>"
			+ 	"</book>"
			+ 	"<book>"
			+ 		"<title>JSP 웹프로그래밍</title>"
			+ 		"<author>이순신</author>"
			+ 		"<price>40,000</price>"
			+ 	"</book>"
			+ 	"<book>"
			+ 		"<title>Spring 프레임워크</title>"
			+ 		"<author>김유신</author>"
			+ 		"<price>30,000</price>"
			+ 		"</book>"
			+ "</books>";
	$(document).ready(
		function() {
			var msg = "";
			var xmldoc = $.parseXML(xml);
			
			// DOM
			var booklist = xmldoc.getElementsByTagName("book");
			var titlelist = xmldoc.getElementsByTagName("title");
			var authorlist = xmldoc.getElementsByTagName("author");
			var pricelist = xmldoc.getElementsByTagName("price");
			for(var i=0; i<booklist.length; i++) {
				msg += "Title : "+titlelist.item(i).firstChild.nodeValue+"<br>"
					+"Author : "+authorlist.item(i).firstChild.nodeValue+"<br>"
					+"Price : "+pricelist.item(i).firstChild.nodeValue+"<br>";
				msg += "<br>"
			}
			// jQuery
			$(xmldoc).find("book").each(
				function(index, item) {
					msg += "Title : "+$(item).find("title").text()+"<br>"
						+"Author : "+$(item).find("author").text()+"<br>"
						+"Price : "+$(item).find("price").text()+"<br>";
					msg += "<br>";
				}
			);
			
			$("#result").html(msg);
		}
	);	
/*]]>*/
</script>
<div id="result"></div>