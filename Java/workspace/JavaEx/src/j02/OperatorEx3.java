package j02;


public class OperatorEx3 {

	public static void main(String[] args) {         // 명령줄 인수 반드시 문자열
		int a = Integer.parseInt( args[0]);          // 문자열을 정수로
		System.out.println( a %2 == 0 ? "짝수" : "홀수");
		

	}

}
