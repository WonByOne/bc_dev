<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="/jqueryex/jquery-3.6.0.js"></script>
<script type=text/javascript>
/*<![CDATA[*/
	$(document).ready(
		function() {
			var db = null;
			if(!window.openDatabase) {
				$("#console").html("Not compatible browser.<br>");
			} else {
				$("#console").html("Compatible brower.<br>");
				db = window.openDatabase("memberdb", "1.0", "회원관리", 1024*1024*5);
				db.transaction(
					function(tx) {		// sql 보내기
						tx.executeSql(
							"create table member("
							+"name varchar2(30) not null,"
							+"age number(3) not null,"
							+"tel varchar2(30),"
							+"address varchar2(100)"
							+")"
						);
					},
					function(error) {	// 실패
						$("#console").html("Failed to create DB : "+error.message+"<br>");
					},
					function() {		// 성공
						$("#console").html("DB created.<br>")
					}
				);
			}
			// 가입
			$("input[value='Sign up']").on(
				"click",
				function(event) {
					var name = $("input[name=name]").val();
					var age = $("input[name=age]").val();
					var tel = $("input[name=tel]").val();
					var address = $("input[name=addr]").val();
					if(name && age) {
						db.transaction(
							function(tx) {
								tx.executeSql(
									"insert into member values(?, ?, ?, ?)",
									[name, age, tel, address]
								);
							},
							function(error) {
								$("#console").html("Failed to sign up : "+error.message);
							},
							function() {
								$("#console").html("Sign up complete.")
								$("input[name=name]").val("");
								$("input[name=age]").val("");
								$("input[name=tel]").val("");
								$("input[name=addr]").val("");
							}
						); 
					} else {
						$("#console").html("Enter name and age.");
					}
				}
			);
			// 삭제
			$("input[value=Delete]").on(
				"click",
				function(event) {
					var name = $("input[name=name]").val();
					if(name) {
						db.transaction(
							function(tx) {
								tx.executeSql(
									"delete from member where name=?",
									[name]
								);
							},
							function(error) {
								$("#console").html("Failed to delete. : "+error.message);
							},
							function() {
								$("#console").html("Account deleted.");
								$("input[name=name]").val("");
							}
						);
					} else {
						$("#console").html("Enter name.")
					}
				}
			);
			// 보기
			$("input[value=Show]").on(
				"click",
				function(event){
					var name = $("input[name=name]").val();
					if(name) {	// 해당 이름만 출력
						db.transaction(
							function(tx) {
								tx.executeSql(
									"select * from member where name=?",
									[name],
									show
								);
							},
							function(error) {
								$("#console").html("Failed to load : "+error.message);
							},
							function() {
								$("#console").html("List is loaded.");
							}
						);
					} else { 	// 전체 출력
						db.transaction(
								function(tx) {
									tx.executeSql(
										"select * from member",
										[],
										show
									);
								},
								function(error) {
									$("#console").html("Failed to load : "+error.message);
								},
								function() {
									$("#console").html("List is loaded.");
								}
							);
					}
				}
			);
			// 수정
			$("input[value=Modify]").on(
				"click",
				function(event) {
					var name = $("input[name=name]").val();
					var age = $("input[name=age]").val();
					var tel = $("input[name=tel]").val();
					var addr = $("input[name=addr]").val();
					
					if(name && age) {
						db.transaction(
							function(tx) {
								tx.executeSql(
									"select * from member where name=?",
									[name],
									function(tx, rs) {
										if(rs.rows.length == 0) { 	// 이름 없음
											$("#console").html("No such name.");
										}  else {					// 이름 있음
											db.transaction(
												function(tx) {
													tx.executeSql(
														"update member set age=?, tel=?, address=? where name=?",
														[age, tel, addr, name]
													);
												},
												function(error) {
													$("#console").html("Failed to modify : "+error.message);
												},
												function() {
													$("#console").html("Modification Complete.")
												}
											);
										}
									}
								);
							}	
						);
					} else {
						$("#console").html("Enter ID & Age");
					}
				}
			);
		}		
	);
	
	function show(tx, rs) { // 매개변수 2개가 넘어옴
		if(rs.rows && rs.rows.length) {
			var t = document.getElementById("t");
			t.innerHTML = "";
			for(var i=0; i<rs.rows.length; i++) {
				var row = t.insertRow();	// tbody에 row 삽입
				var col1 = row.insertCell();// 각 row에 column 삽입
				var col2 = row.insertCell();
				var col3 = row.insertCell();
				var col4 = row.insertCell();
				col1.innerHTML = rs.rows.item(i).name;
				col2.innerHTML = rs.rows.item(i).age;
				col3.innerHTML = rs.rows.item(i).tel;
				col4.innerHTML = rs.rows.item(i).address;
			}
		}	
	}
/*]]>*/	
</script>
<h2>HTML5 - web SQL</h2>

<form name=inputform>
	<table border=1>
		<tr>
			<th>Name</th>
			<td><input type=text name=name></td>
		</tr>
		<tr>
			<th>Age</th>
			<td><input type=text name=age></td>
		</tr>
		<tr>
			<th>Tel</th>
			<td><input type=text name=tel></td>
		</tr>
		<tr>
			<th>Address</th>
			<td><input type=text name=addr></td>
		</tr>
		<tr>
			<th colspan=2>
				<input type=button value="Sign up">
				<input type=button value="Modify">
				<input type=button value="Delete">
				<input type=button value=Show>
			</th>
		</tr>

	</table>
</form>
<br>
<table border=1>
	<tr>
		<th>Name</th>
		<th>Age</th>
		<th>Tel</th>
		<th>Address</th>
	</tr>
	<tr>
		<tbody id="t"></tbody>
	</tr>
</table>
<br>
<div id=console></div>