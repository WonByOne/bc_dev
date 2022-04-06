package j03;

public class ForEx1 {

	public static void main(String[] args) {


//		for( int i=0; i<3; i++) {			// 1 ~ 3
//		for( int i=1; i<=10; i++) {			// 1 ~ 10
//		for( int i=10; i>=1; i--) {			// 10 ~ 1
		for( int i=2; i<=10; i+=2) {
			System.out.println("i : " + i);
		}
		
		System.out.println();
		
		for( int i=2; i<=10; i++) {
			if ( i % 2 == 0)
				System.out.println("i : " + i);
		}
	}

}
