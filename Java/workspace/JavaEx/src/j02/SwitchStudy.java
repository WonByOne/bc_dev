package j02;

public class SwitchStudy {

	public static void main(String[] args) throws Exception {
		System.out.print( "정수 : ");
		int a = System.in.read() - 48;
		System.in.read();
		System.in.read();
		
		System.out.print( "정수 : ");
		int b = System.in.read() - 48;
		System.in.read();
		System.in.read();
		
		System.out.print("연산자(+ - * / %) : ");
		char c = (char) System.in.read();
		
		
		// 2 5 +
		// 2 + 5 = 7
		// 나누기는 소수점 출력
		// 없는 연산자는 잘못입력
		
		boolean s = c != '+' && c != '-' && c != '*' && c != '/' && c != '%'; // 연산자 유효한가 
		
		if (s) { 
			System.out.println("Error");
		}
			else {
				System.out.print( a+ " " + c +" " + b + " = ") ;
			switch (c) { 									// v1.7부터 문자열 가능
			case 43 : System.out.println( a + b ); break;  	// ASCII
			case '-': System.out.println( a - b ); break; 
			case '*': System.out.println( a * b ); break;
			case '/': System.out.println( (double)a / b); break;
			case '%': System.out.println( a % b ); break;
			
			}
			}
	}

}
