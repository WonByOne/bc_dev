<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">

<style type=text/css>
	div {
		width : 200px;
		height : 300px;
		margin : 10px;
		float : left;
		text-align : center;
	}
	#blue {
		border : 1px solid darkblue;
	}
	#red {
		border : 1px solid darkred;
	}
</style>
<script type=text/javascript>
/*<![CDATA[*/
	function drag(target, event) {	// target 은 img
		event.dataTransfer.setData("id", target.id);
	} 
	function drop(element, event) {	// element 는 태그
		var targetid = event.dataTransfer.getData("id");
		var targetelement = document.getElementById(targetid);
		element.appendChild(targetelement);
		event.preventDefault();
	}
/*]]>*/
</script>

<h2>HTML5 - drag & drop</h2>

<div id=blue ondrop="drop(this, event)"
	ondragenter="return false" ondragover="return false"></div>
<div id=red ondrop="drop(this, event)"
	ondragenter="return false" ondragover="return false"></div>
<div id=white ondrop="drop(this, event)"
	ondragenter="return false" ondragover="return false">
	<img id=target draggable=true ondragstart="drag(this, event)"
		src="../images/son.png" width=160 height=300>
	<a id=daum draggable=true ondragstart="drag(this,event)">다음</a>
</div>