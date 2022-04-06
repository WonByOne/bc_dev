package j03;

// 구구단
// 2 ~ 9 아니면 입력 다시 받음

public class DowhileEx3 {

	public static void main(String[] args) throws Exception {
		
		int dan = 0;
		do {
		System.out.print("단 입력 : ");
		dan = System.in.read() - 48;
		System.in.read(); System.in.read();
		} while( dan < 2  || dan > 9 );
		
		for( int i=0; i<9; i++) {
			System.out.println( dan + " * " + (i+1) + " = " + dan * (i+1));
			
		}
		
		
	}

}
