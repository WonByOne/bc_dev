package j07;

// 오버라이드		부모에 있는 메서드가 자식에도 동일하게 존재
class OvSuper {
	 String a = "부모클래스";
	public String get() {
		return a;
	}
}

public class OverrideEx extends OvSuper{
	String a = "자식클래스";	// 변수는 오버라이드 아님 이렇게 보통 사용하지 않는다
	public String get() {	// 오버라이드 메소드에만 적용	// 메모리에 하나만 잡힌다 - 재정의
		return a;
	}
	
	public static void main(String[] args) {
		int b = 10;			// int = int
		double c= 10.5;		// double = double
		int d = (int) 10.5;	// int = (int) double 	강제형변화 
		double e = 10;		// double = int 		자동형변환
		
		// 부모클래스로 잠조변수 = 부모클래스 인스턴스
		OvSuper os = new OvSuper();
		System.out.println(os.a);
		System.out.println(os.get());
		System.out.println();
		
		
		// 자식클래스 참조변수 = 자식클래스 인스턴스
		OverrideEx oe = new OverrideEx();
		System.out.println(oe.a);
		System.out.println(oe.get());
		System.out.println();
		
		// 부모클래스 참조변수 = 자식클래스 인스턴스		// 자동형변환	- 부모형으로 변환
		os = new OverrideEx();					// 부모 클래스 객체가 된다
		System.out.println(os.a);
		System.out.println(os.get());
		System.out.println();
		
//		 자식클래스 참조변수 = 부모클래스 인스턴스		// 강제형변환	- 자식형으로 변환
		oe = (OverrideEx) new OvSuper(); 	// 지금은 a가 겹쳐서 error
//		System.out.println(oe.a);
//		System.out.println(oe.get());
		
		
	}

}
