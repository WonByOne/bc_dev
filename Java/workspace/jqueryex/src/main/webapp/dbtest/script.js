$(document).ready(
	function() {
		// ID
		$("input[name=id]").on(
			"keyup",
			function(event) {
			//	alert("keyup");
				$.ajax(
					{
						type : "POST",
						data : {
							id : $("input[name=id]").val()
						},
						url : "idcheck.jsp",
						dataType : "text",
						success : function(data) {
							$("#idcheck").html(data);
						},
						error : function(error) {
							$("#idcheck").html(error);
						}					
					}
				);
			}
		);
	}
);