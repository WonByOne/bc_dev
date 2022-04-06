package j04;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Random;

// 덧셈 10문제

public class WhileStudy02 {
	
	
	public int exc(int range) throws Exception{
		
		
		Random r = new Random();      			// Random 사용
		int a = r.nextInt(range) + 1;
		int b = r.nextInt(range) + 1;
		
		System.out.print(String.format("%2d",a) + " + " + String.format("%2d", b) + " = ");
//		
		
//		if (ans == a + b) return true;
		return a + b;
		
	}
	
	public int test(int num, int range) throws Exception {
		BufferedReader br = new BufferedReader( new InputStreamReader( System.in ) );
		WhileStudy02 me = new WhileStudy02();
		int cnt = 0;
		for (int i=0;i<num;i++) {
		
			System.out.print("[" + String.format("%02d",i+1) + "]");
			int ans = me.exc(range);
			int in = Integer.parseInt( br.readLine() );
			
			if (ans == in ) {
				cnt++;
				System.out.println("Correct");
			}
			else {
				System.out.println("Wrong");
				System.out.println("The answer is : " + ans);	
			}
		}
		return cnt;
	}
	
	
	
	public void result(int num, int cnt) {
		System.out.printf("Score : %.1f\n", (double) cnt / num  * 100);
	}
	
	public boolean cont() throws Exception {
		BufferedReader br = new BufferedReader( new InputStreamReader( System.in ) );
		
		
		while (true) {
					
		System.out.print( "Continue(Y/N)? : ");
		String c = br.readLine();

		if (c.equals("n") || c.equals("N")) return false;               // equals  사용
//		if (c.charAt(0) == 'n' || c.charAt(0) == 'N' ) return false;	// 배열 처리
		
		else if (c.charAt(0) == 'y' || c.charAt(0) == 'Y' ) return true; 
		}
		
	}
	
	
	
	public static void main(String[] args) throws Exception {
		WhileStudy02 me = new WhileStudy02();
		
		int range = 100;
		int number = 10;
		
		while (true) {
				
		   	int cnt = me.test(number, range); 	// '몇' 문제 '몇' 까지의 덧셈 문제를 낼지 호출 // 맞춘 개수 리턴
			   	
			me.result(number, cnt);				// 결과 출력
			
			boolean con = me.cont();
			if ( con == false ) break;
            		
		} 
		
	}

}
