package j02;

// 숫자 3개 가장 큰 수

public class ElseifEx2 {
	public static void main(String[] args) {
	
		int a = Integer.parseInt(args[0]);
		int b = Integer.parseInt(args[1]);
		int c = Integer.parseInt(args[2]);
		
		if ( a >= b ) {
			if (b >= c) System.out.println(a);
			else if(c >= a) System.out.println(c);
			else System.out.println(a);
		}
		else if (b >= c) System.out.println(b); 
		else System.out.println(c);
			
		if ( a > b && a > c) System.out.println("큰 수 : " + a);
		if ( b > a && b > c) System.out.println("큰 수 : " + b);
		if ( c > a && c > b) System.out.println("큰 수 : " + c);
		
		if ( a > b && a > c) System.out.println("큰 수 : " + a);
		else if ( b > c) System.out.println("큰 수 : " + b);
		else System.out.println("큰 수 : " + c);
		
		
	}

}
