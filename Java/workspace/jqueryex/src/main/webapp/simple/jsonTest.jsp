<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<h2> JSON Expressions</h2>

<script type="text/javascript">
/*<![CDATA[*/
	window.onload = function() {
		var result = document.getElementById("result"); 
		var msg = "";
		var a = {"ko":"대한민국", "uk":"영국", "jp":"일본"}
		
		msg += a.ko + "<br>"
			+ a["ko"] + "<br>";
		msg += "<br>";
			
		var kim = {name:"김유신", age:30, tel:"1111-2222"}; //	키는 문자열 ""생략 가능
		msg += "Name : "+kim.name+"<br>"
			+"Age : "+kim.age+"<br>"
			+"Tel : "+kim.tel+"<br>";
		msg += "<br>";
		
		var s = {salary : [1000, 2000, 3000, 4000]}; // {key:배열}
		for(var i=0; i<s.salary.length; i++) {	// 변수.키 로 사용
			msg += s.salary[i]+"<br>";
		}
		msg += "<br>";
		
		var e = {employee : {name:"김유신", age:20, tel:"1111-2222"}}; // {key:{key:값}}
		msg += "Name : "+e.employee.name+"<br>"
			+"Age : "+e.employee.age+"<br>"
			+"Tel : "+e.employee.tel+"<br>";
		msg += "<br>";
		
		var ee = [	
			{name:"홍길동", age:20},
			{name:"이순신", age:30},
			{name:"김유신", age:40}
			];	// 배열안에 JSON
		for(var i=0; i<ee.length; i++) {
			msg += "Name :"+ee[i].name+"<br>"
				+"Age : "+ee[i].age+"<br>"
				+"<br>";
		}
		
		var ees = {kim:{name:"김유신", age:20},
				lee:{name:"이순신", age:30},
				hong:{name:"홍길동", age:40}};
		msg += ees.kim.name+" : "+ees.kim.age+"<br>"
			+ ees.lee.name+" : "+ees.lee.age+"<br>"
			+ ees.hong.name+" : "+ees.hong.age+"<br>";
		
		result.innerHTML = msg;
	}
/*]]>*/
</script>
<div id="result"></div>