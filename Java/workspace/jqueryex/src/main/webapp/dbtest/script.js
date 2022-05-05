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
		// 비밀번호 
		$("input[name=repasswd]").on(
			"keyup",
			function(event) {
				var passwd = $("input[name=passwd]").val();
				var repasswd = $("input[name=repasswd]").val();
				if(passwd == repasswd) {
					$("#passwdcheck").html("Password OK.");
				} else {
					$("#passwdcheck").html("Check password.");
				}
			}
		);
		// 전화번호
		$("input[name=tel]").on(
			"keyup",
			function(event) {
				$.ajax(
					{
						type : "POST",
						data : {				//  넘길 데이터 정의 JSON 형식
							tel : $("input[name=tel]").val()
						},
						url : "telcheck.jsp",
						dataType : "text",
						success : function(data) {
							$("#telcheck").html(data);
						},
						error : function(error) {
							$("#telcheck").html(error);
						}
					}					
				);
			}
		);
	}
);