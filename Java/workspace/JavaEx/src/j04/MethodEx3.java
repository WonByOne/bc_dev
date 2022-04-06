package j04;

// int a = 5, b = 2;    // Java에서는 class 밖에 전역변수 선언 불가능 (static 영역)

public class MethodEx3 {

	int a = 5, b = 2;   // 전역변수 > 멤버변수 (heap 영역)
	
	
	public void hap () {
		
		System.out.println("합 : " + (a + b));
	}
	
	public void cha () {
		
		System.out.println("차 : " +(a - b));
	}
	
	
	
	public void sum (int a, int b) {	// 매개변수
		
		System.out.println("합 : " + (a + b));
	}
	
	public void sub (int a, int b) {
		
		System.out.println("차 : " +(a - b));
	}
	
	public void mlt (int a, int b) {
		
		System.out.println("곱 : " + (a * b));
	}
	
	public void div (int a, int b) {
		
		System.out.println("몫 : " + (a / b));
	}
	
	public static void main(String[] args) {
		MethodEx3 me = new MethodEx3();
		
//		System.out.println(a);   	// 전역변수를 잡아도 main(static 영역)에서는 사용할 수 없음 
		
		me.sum(5, 2);
		me.sub(5, 2);
		me.mlt(5, 2);
		me.div(5, 2);
		
		System.out.println();
		
		me.hap();
		me.cha();
		
		
		
	}

}
