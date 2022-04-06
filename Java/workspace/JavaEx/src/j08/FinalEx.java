package j08;

// final 위치
// Class		다른 클래스 상속 불가능
// Method		상속 클래스에서 재정의(override) 불가능
// variables   	변수의 값 변경 불가능		- 인터페이스에는 모든 변수가 final

/*
final class FinalSuper { */
class FinalSuper {
//	final int a;		// final 변수는 초기화를 해야한다
//	int a;				// 생성자가 0으로
//	final int a = 10;	// 상수화, 값을 변경할 수 없다.
	final static int a = 10;	// 일반적으로 값을 변경하지 않는 상수는 공유하므로 static을 사용한다	
	public final int get() {
		return a;
	}
}

/*
public class FinalEx { */
public class FinalEx extends FinalSuper {	// fianl 클래스는 상속할 수 없다
//	public final int get() {	// 재정의 할 수 없다
//		return a;
//	}
	public static void main(String[] args) {
		FinalSuper fs = new FinalSuper();
//		fs.a = 10; 		// 상수화, 값을 변경할 수 없다.
		System.out.println(fs.get());

		
	}

}
