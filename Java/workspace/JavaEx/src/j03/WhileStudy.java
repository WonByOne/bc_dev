package j03;

import java.util.Random;
import java.util.Scanner;
// 0 ~ 9 random 몇번 만에? 크다 작다 알려주기

public class WhileStudy {

	public static void main(String[] args) /* throws Exception */ {
		
		try (Scanner scan = new Scanner(System.in)){
			
			
		
			int range = 1000;    					// 범위 정하기 10의 배수로
			
//			int ans = (int)(Math.random()*range);	// Math 사용    	
			
			Random r = new Random();      			// Random 사용
			int ans = r.nextInt(range);
			
			
			
			int a;
			int cnt=0;
			
	//		System.out.println(ans);  			// 정답 확인
			
			do {
				System.out.print("입력(0 ~ " + (range-1) + ") : " );
			
	//			a = System.in.read() - 48;		// ASCII 사용
	//			System.in.read(); System.in.read();
				
				a = scan.nextInt();				// Scanner 사용
				
				cnt ++;
			    
			    if (a > ans) System.out.println("보다 작아요");
			    else if (a < ans) System.out.println("보다 커요");
			    
			} while ( a != ans );
			
			
			System.out.println(cnt+ " 번 만에");
	
		};
	}

}
