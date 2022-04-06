package j04;

// 독립된 프로그램
// 반드시 호출한 곳으로 돌아온다
// return 은 1개 없으면 void



public class MethodEx1 {

	public void printx(int x) {          	// 선언
//	public static void printx(int x) {          	// 선언 static 하면 참조변수 없이 되네
		for(int i=0;i<x;i++) {                      // 구현
			System.out.println("Hello Java!!!");
		}
//		return; 									// void 일 때 생략 가능
	}
	public static void main(String[] args) {
//		System.out.println("Hello Java!!!");
//		System.out.println("Hello Java!!!");
//		System.out.println("Hello Java!!!");
		
		MethodEx1 me = new MethodEx1();
		
		me.printx(3);
		
//		printx(5);								// static 선언 하면 참조변수 없이 가능
		
	}

}
