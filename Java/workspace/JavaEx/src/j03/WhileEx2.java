package j03;

public class WhileEx2 {

	public static void main(String[] args) {
		int i = 0;
		int cnt = 0;
		int sum = 0, sum_even = 0, sum_odd =0;
		while (i < 100) {
			
			i ++;
			
			
			switch ( cnt % 10) {
			
			case 0 : System.out.println();
			default : System.out.printf("%3d ", i);
						
			}
			
			
//			if ( (cnt + 1) % 10 == 0) {
//				System.out.printf("%3d %n", i);
//			}
//			else System.out.printf("%3d ", i);
			
			
			
			cnt ++;	
			
			if (i%2 == 0) sum_even += i;
			else sum_odd +=i;
			sum += i;
		}
		
		System.out.println();
		System.out.println();
		System.out.println("짝수 합 : " + sum_even);
		System.out.println("홀수 합 : " + sum_odd);
		System.out.println("전체 합 : " + sum);
		
	}

}
