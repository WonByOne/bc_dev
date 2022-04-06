package j05;

// static area ( not heap or stack )
// priority
// static method calls only static variables
// can access without OBJ
// auto initialization once 
// shared with all OBJ
// called by class variables or class method



public class StaticEx {							// heap 메모리 할당 -> 객체 생성

	private int a = 10;							
	private static int b = 10;					// static 영역에 할당 끝날때 메모리 반납 // 초기화는 한번만!
	

	public static void main(String[] args) {  	// 시작하자마자 자동 메모리 할당
		
		StaticEx se = new StaticEx();
		

		System.out.println("a : " + se.a);
		System.out.println("b : " + b);			// static 영역 OBJ 없이 접근 가능
		System.out.println("b : " + se.b);
		System.out.println("b : " + StaticEx.b);// static 쓸때는 class.member  공유개념
		
		se.a += 10;
		se.b += 10;
		
		System.out.println("se a : " + se.a);
		System.out.println("se b : " + se.b);
		
		StaticEx se1 = new StaticEx();
		se1.a += 10;
		se1.b += 10;  							// 공유개념 헷갈리니까 StaticEx.b 로 사용
		
		System.out.println("se1 a : " + se1.a );
		System.out.println("se1 b : " + se1.b );// b만은 계속 누적해서 30이 출력된다
		
		
		
	}

}
