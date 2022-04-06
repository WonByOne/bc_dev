package j04;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class MethodEx6 {

	
	public int big(int a, int b, int c) {
		
		
		int big = a;
		if (b>=big) big = b;
		if (c>=big) big = c;
		
		return big;
		
//		if (a>=b) {                                             //	복잡한 비교
//			if (c>=b) 
//				if (a >= c) return a;
//				else return c;
//		}
//		else if (c>=a)	
//				
//				if (b>=c) return b;
//				else return c;
//		return a;
		
//		if (a>=b && a>=b) return a;
//		else if (b>=c) return b;
//		else return c;
		
	}
	
	
	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader( new InputStreamReader( System.in ) );
		
		System.out.print("정수 1: ");
		int a = Integer.parseInt( br.readLine() );
		
		System.out.print("정수 2: ");
		int b = Integer.parseInt( br.readLine() );
		
		System.out.print("정수 3: ");
		int c = Integer.parseInt( br.readLine() );
		
		MethodEx6 me = new MethodEx6();
		
		System.out.println("큰 수 : " + me.big( a, b, c));
	
	}

}
