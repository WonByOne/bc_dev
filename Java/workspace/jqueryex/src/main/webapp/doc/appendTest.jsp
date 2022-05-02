<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - append 예제: move</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			
		}
	);
	
	var cnt = 0;
	function additem() {
		var msg = "New node No."+ ++cnt+" node"
				+"<input type='button' value='Modify' onclick='moditem("+cnt+")'>"
				+"<input type='button' value='Delete' onclick='delitem("+cnt+")'>";
		$("<div>").attr("id","node_"+cnt).html(msg).appendTo("#result");	
	}
	
	function delitem(cnt) {
		$("#node_"+cnt).remove();
	}
	
	function moditem(cnt) {
		var msg = "Modified node No."+cnt+" node"
				+"<input type='button' value='Delete' onclick='delitem("+cnt+")'>";
		$("#node_"+cnt).html(msg);
	}
/*]]>*/
</script>
Add : <input type="button" value="Add" onclick="additem()">
<br>
<div id="result"></div>