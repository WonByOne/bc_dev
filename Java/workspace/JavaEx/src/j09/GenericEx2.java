package j09;

// <? super 객체자료형>	명시된 객체 포함 상위 객체들의 배치
//						객체 내부의 모든 제네릭 타입은 Object
// <? extends 객체자료형>	명시된 객체 포험 하위 객체들의 배치
//						객체 내부의 모든 제네릭 타입은 extends 다음에 명시

class SuperA {
	String msg = "SuperA";
	public String getMsg() {
		return msg;
	}
}
class SuperB extends SuperA {
	String msg = "SuperB";
	public String getMsg() {
		return msg;
	}
}
class SuperC extends SuperB {
	String msg = "SuperC";
	public String getMsg() {
		return msg;
	}
}

public class GenericEx2 <T> {
	private T a;
	public GenericEx2(T a) {
		this.a = a;
	}
	public void set(T a) {
		this.a = a;
	}
	public T get() {
		return a;
	}
	public static void main(String[] args) {
//		GenericEx2 <Integer> ge = new GenericEx2 <Integer> (10);
//		Object ge = new GenericEx2 (10);			// 예전 문법
		GenericEx2 <?> ge = new GenericEx2 <Integer> (10);	// 참조변수에 ? - Object라는 의미
//		Object g = ge.get();
//		int g = ge.get();				// 자식 참조변수에 부모 인스턴스 넣으면 안들어감
		Integer i = (Integer) ge.get();	// 형변환으로 사용가능
		int g = (int) ge.get(); 		// 박싱/언박싱
		
		SuperA sua = new SuperA();
		SuperB sub = new SuperB();
		SuperC suc = new SuperC();
		
		GenericEx2 <? super SuperB> ge1 = new GenericEx2 <SuperA> (sua);	
		GenericEx2 <? super SuperB> ge2 = new GenericEx2 <SuperB> (sub);	
//		GenericEx2 <? super SuperB> ge3 = new GenericEx2 <SuperC> (sub);	// 하위클래스 불가

//		Object sb = ge2.get(); 			// 이렇게 되면 하위 클래스의 멤버를 사용 불가능 
		SuperB sb = (SuperB)ge2.get();	// Object  자료형으로 리텬되므로 형변환 필요
		System.out.println(sb.getMsg());
		

//		GenericEx2 <? extends SuperB> ge4 = new GenericEx2 <SuperA> (sub);	// 상위클래스 불가
		GenericEx2 <? extends SuperB> ge5 = new GenericEx2 <SuperB> (sub);
		GenericEx2 <? extends SuperB> ge6 = new GenericEx2 <SuperC> (suc);
//		SuperB sb1 = ge5.get();				
//		System.out.println(sb1.getMsg());	
		SuperC sc = (SuperC) ge6.get();		// SuperB 자료형으로 리턴되므로 형변환 필요
//		
		System.out.println(sc.getMsg());
		
	}

}