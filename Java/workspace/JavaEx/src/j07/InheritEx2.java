package j07;
// 상속 시 생성자 호출 순서

class A {			// extends Object 생략
	private int a;
	public A() {
//		super();	// 최상위 클래스도 super(); 생략되어 있음 진정한 최상위는 Object
		System.out.println("A Constructor");
	}
	public A(int a) {
		this.a = a;
	}
	
	public int getA() {
		return a;
	}
	
}

class B extends A {
	private int b;
	public B() {
		System.out.println("B Constructor");
	}
	public B(int a, int b) {
		super(a);
		this.b = b;
	}
	
	public int getB() {
		return b;
	}
}

class C extends B {
	private int c;
	public C() {
		System.out.println("C Constructor");
	}
	public C(int a, int b, int c ) {
		super(a, b);
		this.c = c;
	}
	public int getC() {
		return c;
	}
}

public class InheritEx2 {

	public static void main(String[] args) {
		C c = new C(10, 20, 30);
		
		System.out.println("a : " + c.getA());
		System.out.println("b : " + c.getB());
		System.out.println("c : " + c.getC());
		
	}

}
