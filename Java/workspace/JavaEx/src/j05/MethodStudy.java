package j05;

public class MethodStudy {

	
	public void disp(char input, int cnt) {
	
		System.out.print(cnt + "  ");
		for(int i=0;i<cnt;i++) {
			System.out.print(input);			
		}
		System.out.println();
		
	}
	
	public void disp(int a, int b, char input) {
		
		int cnt = a - b;
		MethodStudy ms = new MethodStudy();
		ms.disp(input, cnt);		// 다시 처음 만든 기본 disp를 호출한다
		
//		System.out.print(cnt + "  ");  
//		for(int i=0;i<cnt;i++) {
//			System.out.print(input);			
//		}
//		System.out.println();
		
	}
	
	
	public void disp(char input1, char input2, int cnt) {
		System.out.print(cnt + "  ");
		for(int i=0;i<cnt;i++) {	
			if (i%2==0) System.out.print(input1);
			else System.out.print(input2);
			
		}
		System.out.println();
		
	}
	
	
	public static void main(String[] args) {
		MethodStudy ms = new MethodStudy();
		
		ms.disp('@', 3);
		ms.disp('#', 5);
		ms.disp('%', 7);
		ms.disp(9, 5, '&');
		ms.disp('@', '#', 7);
		
	}

}
