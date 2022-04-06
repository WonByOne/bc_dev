package j02;

/*
	제어문
	
	조건문
		if(조건) {참;
		} else {
		거짓;
		}
 */

public class IfEx1 {

	public static void main(String[] args) {

		int a = Integer.parseInt(args[0]);
		if ( a > 5 ) {
			System.out.println( "크다" );
		} else {
			System.out.println( "작다" );
		}

	}

}
