package j02;

// 2와 3의 공배수

public class IfEx2 {

	public static void main(String[] args) {

		
		int a = Integer.parseInt(args[0]);
		int b = Integer.parseInt(args[1]);
		int c = Integer.parseInt(args[2]);
		
		if ( (c % a == 0) && (c % b == 0)) {
			System.out.println(c + "는 " + a + "와 " + b + "의 공배수");
		}
		else {
			System.out.println("아니다");
		}
		
		
	}

}
