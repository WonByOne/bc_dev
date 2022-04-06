package j07;
// Variable Argument  	// since v1.5 

public class ArrayEx6 {
//	public int sum(int a, int b) {
//		return a + b;
//		
//	}
//	
//	public int sum(int a, int b, int c) {
//		return a + b + c;
//		
//	}
	
	public int sum(int ... m) {				// ... Variable Argument 개수 상관 없이 
//	public int sum(int ... m, String s) {	// Variable Argument 뒤에 다른 매개변수 불가능
//	public int sum(String s, int ... m) {	// Variable Argument 앞에 다른 매겨변수 가능
		int sum = 0;
		for(int i=0;i<m.length;i++) {
			sum += m[i];
		}
		return sum;
	}
	
	public static void main(String[] args) {
		ArrayEx6 ae = new ArrayEx6();
		System.out.println("Sum : " + ae.sum(5, 2));
		System.out.println("Sum : " + ae.sum(5, 2, 8));
		
	}

}
