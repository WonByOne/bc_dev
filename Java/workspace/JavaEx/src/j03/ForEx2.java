package j03;

public class ForEx2 {

	public static void main(String[] args) {
		
		int cnt = 0, sum = 0;
		
		for(int i = 1; i<=100; i++) {
			boolean c1 = i%3 != 0;
			boolean c2 = i%2 != 0;
			
			
			if ( c1 && c2 ) {
				
//				switch (cnt % 5) {
//				
//				case 1 : 
//				case 0 : System.out.println(i);
//				default :
//				}
					
				if ( (cnt + 1) % 10 == 0) {
					System.out.printf("%2d %n", i);
				}
				else {
				System.out.printf("%2d ", i);
				}
				cnt++;
				sum += i;
			}
			
		}
		
		System.out.println();
		System.out.println();
		System.out.println( "개수 : " + cnt);
		System.out.println( "합계 : " + sum);
		
	}

}
