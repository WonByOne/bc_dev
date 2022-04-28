<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script> <!-- jquery import -->

<h2>jQuery - filter selector</h2>

<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(
		function() {
			$("th:odd").css("color", "darkred");
			$("th:even").css("color", "darkblue");
			$("th:even:odd").css("color", "darkgreen");
			$("th:first, th:last").css("background", "grey");
			
			$("th:contains(50)").css("background","grey");
			$("th:eq(50)").css("background", "darkgrey");
			$("th:lt(10)").css("color", "gold");
			$("th:gt(90)").css("color", "darkorange");
			$("th:nth-child(5n+1)").css("color", "#d6d6d6");
		}	
	);
/*]]>*/
</script>

<%
	int cnt = 0;
%>
<table border=1>
	<%
	for(int i=0; i<10; i++) {
		%>
		<tr height=35>
			<%
			for(int j=0; j<10; j++) {
				%>
				<th width=35><%=++cnt%></th>
				<%
			}
			 %>
		</tr>
		<%
	}
	%>
</table>
