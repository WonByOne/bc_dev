<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<h2> JSON Class</h2>

<script type="text/javascript">
/*<![CDATA[*/
	function Member(name, age, tel) {
	 this.name = name;
	 this.age = age;
	 this.tel = tel;
	 this.getName = getName;	// 함수를 위한 변수
	 this.getAge = getAge;
	 this.getTel = getTel;
	}
	function getName() {		// 외부에 합수 선언
		return this.name;
	}
	function getAge() {
		return this.age;
	}
	function getTel() {
		return this.tel;
	}
	
	function Customer(name, age, tel) {
		this.name = name;
		this.age = age;
		this.tel = tel;
	}
	Customer.prototype.getName = function() {	// prototype 이용 외부에서 함수 선언
		return this.name;
	}
	Customer.prototype.getAge = function() {
		return this.age;
	}
	Customer.prototype.getTel = function() {
		return this.tel;
	}
	
	function User(name, age, tel) {
		this.name = name;
		this.age = age;
		this.tel = tel;
	}
	User.prototype = {	// prototype을 JSON 표현식 이용해서 정의
			getName : function() {return this.name},
			getAge : function() {return this.age},
			getTel : function() {return this.tel}
	};
	
	window.onload = function() {
		var result = document.getElementById("result");
		var msg = "";
		var m = new Member("홍길동", 20, "1111-2222");
		msg += "Name : "+m.getName()+"<br>"
			+"Age : "+m.getAge()+"<br>"
			+"Tel : "+m.getTel()+"<br>";
		msg += "<br>";
	
		var c = m;
//		var c = new Customer("이순신", 20, "2222-1111");
		msg += "Name : "+c.getName()+"<br>"
		+"Age : "+c.getAge()+"<br>"
		+"Tel : "+c.getTel()+"<br>";
		msg += "<br>";
		
		var u = c;
//		var u = new User("이순신", 20, "2222-1111");
		msg += "Name : "+u.getName()+"<br>"
		+"Age : "+u.getAge()+"<br>"
		+"Tel : "+u.getTel()+"<br>";
		msg += "<br>";
	
		result.innerHTML = msg;
	}
/*]]>*/
</script>
<div id="result"></div>