package j02;

/*
int a = 20;				0 0 0 1	 0 1 0 0	
int	b = 12;				0 0 0 0  1 1 0 0
*/

public class OperatorEx2 {

	public static void main(String[] args) {
	
		int a = 20;
		int b = 12;
		
		System.out.println( a & b );
		System.out.println( a | b );
		System.out.println( a ^ b );
		
		System.out.println( false && false );
		System.out.println( false && true);
		System.out.println( true && false );
		System.out.println( true && true );
		
		System.out.println( false || false );
		System.out.println( false || true);
		System.out.println( true || false );
		System.out.println( true || true );
	
		System.out.println( !true );
		System.out.println( !false );
		
		// 대입연산자
		// c += 2;
		
		int c = 10;
		System.out.println( c += 10);
		System.out.println( c -= 10);
		System.out.println( c *= 10);
		System.out.println( c /= 10);
		System.out.println( c %= 10);
		                      
		

	
	}

}
