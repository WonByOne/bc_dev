package j04;

// return

public class MethodEx5 {
	
	public int sum (int a, int b) {	
		
		return a + b;
//		System.out.println("합 : " + (a + b));
	}
	
	public static void main(String[] args) {
	MethodEx5 me = new MethodEx5();
	
	int sum = me.sum(5, 2);
	System.out.println("합 : " + sum);
	
	System.out.println("합 : " + me.sum(5, 2));
	
	
	}

}
