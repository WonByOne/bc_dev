package j04;

// 오버로드 C에서는 자료형을 달리해서 함수를 만들 수 없음
// sum(int a, int b) {}
// sumd(double a, double b){}
// 



public class MethodEx4 {
	
	public void sum (int a, int b) {	
		
		System.out.println("합 : " + (a + b));
	}
	
	public void sum (double a, double b) {   	// 개수, 자료형, 순서가 달라도 가능 오버로드
		
		System.out.println("합 : " + (a + b));
	}
	
	public void sum (int a, int b, int c) {   	// 개수, 자료형, 순서가 달라도 가능 오버로드
		
		System.out.println("합 : " + (a + b + c));
	}
	
	public static void main(String[] args) {
		
	MethodEx4 me = new MethodEx4();
	
	me.sum(5,2.0);
	
	me.sum(5, 3, 3);
		
	}
	
}