<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*<![CDATA[*/
	function Member(name, age, tel) {	// 생성자
		this.name = name;
		this.age = age;
		this.tel = tel;
		this.getName = getName;	// 멤버 함수 선언
		this.getAge = function() { // 한번에 선언도 가능
			return this.age;
		}
	}
	function getName() {
		return this.name;
	}
	Member.prototype.getTel = function() { //외부 선언 가능
		return this.tel;
	}
	
	var kim = new Member("김유신", 30, "1111-2222");
	window.document.write("Name : "+kim.getName()+"<br>"); // window 생략
	document.write("Age : "+kim.getAge()+"<br>");
	document.write("Tel No. : "+kim.getTel()+"<br>");
	document.write("<br>");
	
	function User(name, age, tel) {
		this.name = name;
		this.age = age;
		this.tel = tel;
		this.getName = function() { 
			return this.name;
		}
		this.getAge = function() {
			return this.age;
		}
		this.getTel = function() { 
			return this.tel;
		}
	}
	var lee = new User("이순신", 20, "2222-1111");
	document.write("Name : "+lee.getName()+"<br>");
	document.write("Age : "+lee.getAge()+"<br>");
	document.write("Tel : "+lee.getTel()+"<br>");
	document.write("<br>");
	
	function Customer(name, age, tel) {
		this.name = name;
	 	this.age = age;
	 	this.tel = tel;
	}
	Customer.prototype.getName = function() {
		return this.name;
	}
	Customer.prototype.getAge = function() {
		return this.age;
	}
	Customer.prototype.getTel = function() {
		return this.tel;
	}
	var hong = new Customer("홍길동", 30, "2222-3333");
	document.write("Name : "+hong.getName()+"<br>");
	document.write("Age : "+hong.getAge()+"<br>");
	document.write("Tel : "+hong.getTel()+"<br>");
	document.write("<br>");
	
	
	var kang = new Object();	// 빈 객체 선언 후 - 클래스 재사용은 안됨
	kang.name = "강감찬";
	kang.age = 20;
	kang.tel = "3333-1111";
	kang.getName = function() {
		return this.name;
	}
	kang.getAge = function() {
		return this.age;
	}
	kang.getTel = function() {
		return this.tel;
	}
	document.write("Name : "+kang.getName()+"<br>");
	document.write("Age : "+kang.getAge()+"<br>");
	document.write("Tel : "+kang.getTel()+"<br>");
	document.write("<br>");
	
// inheritance - 확인 한 번 해볼것.
	function Person() {
 		this.name = "annonymous";
 		this.sayHello = function() {
  		//	alert("Hello, my name is" + this.name);
  			document.write("Hello, my name is" + this.name);
 		}
	}
	function Yoda() {
 		var obj = new Person();
 		obj.name = "Yoda";
 		return obj;
	}
	var me = new Yoda();
	me.sayHello();

	function Person() {
 		this.name = "annonymous";
 		this.sayHello = function() {
  			alert("Hello, my name is" + this.name);
 		}
	}
	function Yoda() {
 		this.name = "Yoda";
	}
	Yoda.prototype = Person();
	var yoda = new Yoda();
	yoda.sayHello();	
	
/*]]>*/
</script>	
</head>
<body bgcolor="black" text=#d6d6d6>

</body>
</html>