package j07;

// 추상클래스 abstract
// 추상 메서드를 하나라도 가지면
// 추상 클래스 임을 명시해야한다
// 추상 메서드는 구현하지 않는다(선언만 한다 - no body) - 상속 시 구현해야한다  * 선언 - 구현 - 호출
// 객체를 생성할 수 없고 상속으로면 구현		// 둘 다 안되면 static 확인 ex) Math class 등
// 일반 변수 메소드 상수를 가질 수 있다 - *인터페이스는 오직 final 변수와 추상 메소드만 있다

abstract class AbstractSuper{		// 추상 메소드 하나라도 있으면 추상클래스
	int a = 10;
	public abstract int getA();		// 추상 메소드 abstract
//		return a;					// 추상 메소드는 구현하지 않는다. body가 없다 - 미완성
//	}
}

public class AbstractEx extends AbstractSuper {	// 상속을 받아야한다
	public int getA() {				// 재정의 해야한다. 하위클래스에 똑같은 이름의 다른 메소드를 만들고자 하는 의도
		return a;
	}
	public static void main(String[] args) {
//		AbstractSuper as;						// 참조변수 자체는 만들 수 있다.
//		AbstractSuper as = new AbstractSuper();	// 추상클래스는 new(인스턴스 생성-heap 메모리)가 안 된다.
												// 메소드 미완성이니까
		AbstractEx ae = new AbstractEx();
		System.out.println("a : "+ae.getA());
		
	}

}
