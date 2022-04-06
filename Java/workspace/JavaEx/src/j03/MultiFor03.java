package j03;

public class MultiFor03 {

	public static void main(String[] args) {

		
		for ( int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				System.out.print(i+ ","+ j +"\t");
			}
			
			System.out.println();
		}
		
		System.out.println();
		
		// 1
		for ( int i=0; i<5; i++) {
			for(int j=0; j<=i; j++) {
				System.out.print("* ");
			}
			
			System.out.println();
		}
		
		System.out.println();
		
		// 2
		for ( int i=0; i<5; i++) {
			for(int j=0; j<5-i; j++) {
				System.out.print("* ");
			}
			System.out.println();
		}
		
		// 3
		for ( int i=0; i<5; i++) {
			for(int j=0; j<4-i; j++) {
				System.out.print("  ");
			}
			for(int j=0; j<=i; j++) {
				System.out.print("* ");
			}
				
			System.out.println();
		}
		
		System.out.println();
		
		// 4
		for ( int i=0; i<=5; i++) {
			
			
			for(int j=0; j<i; j++) {
				System.out.print("  ");
			}
			for(int j=5-i; j>0; j--) {
				System.out.print("* ");
			}
				
			System.out.println();
		}
		
// 다이아몬드

//	최초 답안 처음 for 문을 수정함
//		for ( int i=5; i>0; i--) {
//			for(int j=1; j<i; j++) {
//				System.out.print("  ");
//			}
//			for(int j=5-i; j>=0; j--) {
//				System.out.print("* ");
//			}
//			
//			for(int j=0; j<=5-i; j++) {
//				System.out.print("* ");
//			}
//			
//			System.out.println();
//		}
		
		for ( int i=0; i<5; i++) {
			for(int j=0; j<4-i; j++) {
				System.out.print("  ");
			}
			for(int j=0; j<=i; j++) {
				System.out.print("* ");
			}
			
			for(int j=0; j<=i; j++) {
				System.out.print("* ");
			}
			
			System.out.println();
		}
		
		for ( int i=0; i<=5; i++) {
			
			
			for(int j=0; j<i; j++) {
				System.out.print("  ");
			}
//			for(int j=5-i; j>0; j--) {
//				System.out.print("* ");
//			}
			for(int j=0; j<5-i; j++) {
				System.out.print("* * ");
			}
			
			System.out.println();
		}
		
	
// if 활용
		for ( int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				
				if (j < 4-i) System.out.print("  ");
				else {
					System.out.print("k k ");
					// if (10 - i > j ) break; 한 개로 찍는 방법 연구  
				}
				
			}
			System.out.println();				
		}
		
		for ( int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				
				if (5-j > 5-i) System.out.print("  ");
				else System.out.print("k ");
				}
			System.out.println();				
		}
				

	}
		
		
		
}


