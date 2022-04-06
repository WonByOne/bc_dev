package j03;

// 1부터 10까지 쓰고 합도 출력

public class DowhileEx2 {

	public static void main(String[] args) {
		int i = 0;
		int a = Integer.parseInt( args[0] );          // 문자열을 정수로
		int sum = 0;
		
		do {
			i++;
			System.out.print(i);
			if (i < a)	System.out.print(" + ");
			else System.out.print(" = ");
			sum += i;
			
		} while (i < a);
		
		System.out.println(sum);
		
	}

}
