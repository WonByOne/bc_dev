<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - append</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			// DOM
			var dom = document.getElementById("dom");
		//	var textnode = document.createTextNode("After");
		//	var spannode = document.createElement("span");
		//	spannode.appendChild(textnode);
		//	dom.appendChild(spannode);
			var spannode = document.createElement("span");
			spannode.innerHTML = "<b>After</b>";
			dom.appendChild(spannode);
			
			var beforenode = document.createElement("span");
			beforenode.innerHTML = "<b>Before</b>";
			dom.parentNode.insertBefore(beforenode, dom);
			
			// jQuery
			// $(A).append(B)
			$("#append").append("<b>Append</b>");
			$("#append").prepend("<b>Prepend</b>", "<br>");
			$("#append").before("<b>Before</b>");
			$("#append").after("<b>After</b>", "<br>");
			// $(A).appendTo(B)
			$("<b>AppendTo</b>").appendTo("#appendTo");
			$("<b>PrependTo</b></br>").prependTo("#appendTo");
			$("<b>insertBefore</b>").insertBefore("#appendTo");
			$("<b>insertAfter</b>").insertAfter("#appendTo");
			// selector일 때는 <> 없이, tag 생성 때는 <>도 같이 쓴다
			$("<img>").attr(
				{
					src : "/jqueryex/images/a.jpg",
					width : "300px",
					height : "200px",
					border : 0
				}
			).appendTo("p:eq(0)");
			
			$("#img").append(
				"<br>",
				$("<img>").attr(
					{
						src : "/jqueryex/images/b.jpg",
						width : "300px",
						height : "200px",
						border : 0
					}
				),
				"<br>"
			);
			
			$("<span></span><br>").text(	// 만들어 넣은 img 태그도 다시 jQuery로 인식 가능
				$("img").last().attr("src")
			).prependTo("p:eq(0)");
			
			$("#img").prepend(
				$("img").first().attr("src")
			);
			
			// $(selector).append(function(index) {})
			var m = [
				{name:"홍길동", age:20},
				{name:"이순신", age:30},
				{name:"김유신", age:40}
			];
			$("h4").append(
				function(index) {
					return m[index].name+" : "+m[index].age;					
				}
			);
		}
	);
/*]]>*/
</script>

<h4></h4>
<h4></h4>
<h4></h4>

<div id="img"></div>
<br>
<p></p>

<div id="dom">
	DOM<hr size=2 color="darkred">
</div>
<br>
<div id="append">
	Append<hr size=2 color="darkred">
</div>
<br>
<div id="appendTo">
	AppendTo<hr size=2 color="darkred">
</div>
