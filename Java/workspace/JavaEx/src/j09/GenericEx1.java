package j09;
// Generic 여러 자료형을 한 번에 - C의 템플릿과 비슷
/*
class Generic {					// int만 처리 가능
	private int a;
	public Generic(int a) {
		this.a = a;
	}
	public void set(int a) {
		this.a = a;
	}
	public int get() {
		return a;
	}
} */
/* 
class Generic {					// Object 모두 처리 가능
	private Object a;			// 하지만 다른 자료형으로 덮어쓸 수 있음
	public Generic (Object a) {
		this.a = a;
	}
	public void set(Object a) {
		this.a = a;
	}
	public Object get() {
		return a;
	}
} */
class Generic <T> {			// T type, E element, K key, V value
	private T a;
	public Generic(T a) {
		this.a = a;
	}
	public void set(T a) {
		this.a = a;
	}
	public T get() {
		return a;
	}
}

public class GenericEx1 {

	public static void main(String[] args) {
//		Generic ge1 = new Generic(new Integer(10));	// 과거 문법 
		Generic ge1 = new Generic(10);				// 오토박싱 언박싱 
		System.out.println("ge1 : "+ge1.get());
		
//		Generic ge2 = new Generic(10.5);			// new Double(10.5)
		Generic <Double> ge2 = new Generic <Double> (10.5);
		System.out.println("ge2 : "+ge2.get());
//		ge2.set("ABC");								// 의도치 않게 다른 자료형으로 바뀌는 실수가 생길 수 있음
//		ge2.set(1);									// 자동 형변환도 불가능하다.
//		System.out.println("ge2 : "+ge2.get());

		
		Generic <String> ge3 = new Generic <String> ("ABC");
		System.out.println("ge3 : "+ge3.get());
		
	}

}
