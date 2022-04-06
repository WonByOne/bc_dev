package j08;

// Interface
// 상수와 abstract method로만 구성 (keyword 없이 사용 가능)
// 객체 생성 불가
// 상속 시 implements(구현) 
// 추상 메소드 빠짐없이 구현해야 한다
// 다중 상속 가능

interface Interf1 {
//	int a;				// final 이므로 초기화 필요	/
	int a = 10;			// static final 생략되어 있음
	int c = 20;
//	public int get() {	// 일반 method 구현 안 됨
//		return a;
//	}
	public int getA();	// abstract method only
	public int getC();
}

abstract class InterfSuper {
	int b;
	public int getB() {
		return b;
	}
}

public class InterfEx1 extends InterfSuper implements Interf1{
	public int getA() {		// interface의 abstract method 구현
		return a;
	}
	public int getC() {		// interface의 abstract method 구현
		return c;
	}
	
	public static void main(String[] args) {
//		Interf in = new Interf1();
//		InterSuper is = new InterSuper();	// 모두 구현이 되어 있는 abstract class 라도 new 불가
		InterfEx1 ie = new InterfEx1();
		System.out.println("a : "+ie.getA());	// interface implements
		System.out.println("b : "+ie.getB());	// abstract class 상속
		System.out.println("c : "+ie.getC());	// interface implements
		
	}

}
