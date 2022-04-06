package j04;

public class MethodEx2 {

	public void sum (int n) {
		int sum = 0;			// stack 변수 지역변수
		for(int i=0;i<=n;i++) {
			sum += i;
		}
		System.out.println(sum);
	}
	
	public void mul (int n) {
		int mul = 1;
		for(int i=1;i<=n;i++) {
			mul *= i;
		}
		System.out.println(mul);
	}
	
	public static void main(String[] args) {
		MethodEx2 me = new MethodEx2();
		
		me.sum(10);
		me.mul(10);
	
		
	}

}