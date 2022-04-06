package j05;

// 생성자
// default 가 실행
// 객체 생성시 자동 호출( class 이름과 동일한 method)


class Const {
	private String n;
	private int a;

	public void setName (String name){
		this.n = name;
	}
	public void setAge (int age) {
		this.a = age;
	}
	
	public String getName() {
		return this.n;
	}
	
	public int getAge() {
		return this.a;
	}
	
	public void printConst() {
		System.out.println("Name : " + this.n);			// System class 안의 out 객체..
		System.out.println("Age  : " + this.a);			// 클래스이며 static 생성없이 사용 가능
		
	}

}


public class ConstructorEx {
	
	private String name;
	private int a;
	
	public void setName (String name){				// this에 주소를 넘겨줌.(main에서 객체 호출할때)
		this.name = name;
	}
	public void setAge (int age) {
		a = age;
	}
	
	public String getName() {
		return this.name;
	}
	
	public int getAge() {
		return a;
	}
	
	public ConstructorEx() {						// 결과형/반환형이 없다 값을 return 할 수 없다.
		System.out.println("Default Constructor");	// 자동 초기화
	}
	
	public ConstructorEx( String name, int age) {
		System.out.println("생성자");
		this.name = name;	 
		a = age;
	}
	
	public static void main(String[] args) {
		ConstructorEx ce = new ConstructorEx();	// 자동 초기값이 있다(생성자 호출)stack 영역에 주소 heap 영역에 저장
			
		System.out.println("Name : " + ce.getName());	// Null by 생성자
		System.out.println("Age  : " + ce.getAge()); 	// 0	by 생성자
		
		System.out.println();
		
		ce.setName("홍길동");						
		ce.setAge(30);							
		
		System.out.println("Name : " + ce.getName());
		System.out.println("Age  : " + ce.getAge());
		
		System.out.println();
		
		ConstructorEx ce1 = new ConstructorEx("이순신", 30);	// 생성자 overload 필요
		
		System.out.println("Name : " + ce1.getName());
		System.out.println("Age  : " + ce1.getAge());
		
		System.out.println();
		
//		ConstructorEx ce2 = new ConstructorEx("이순신");	// 현재로서는 안됨 다른 생성자 필요
		
		
		Const c = new Const();
		c.setName("엄태원");
		c.setAge(43);

		System.out.println("Name : " + c.getName());
		System.out.println("Age  : " + c.getAge());
		
		System.out.println();
		
//		System.out.println(c.n);    	// 다른 클래스 (패키지 내) 라도 접근 불가능					
		
		c.printConst();					// 출력 함수
		
	}

}
