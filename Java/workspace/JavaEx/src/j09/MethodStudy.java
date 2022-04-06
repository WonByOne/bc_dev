package j09;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

// input() 정수 하나 입력
// output() 구구단 출력
//class UserException extends Exception{
//}

public class MethodStudy {
	public int input() throws IOException {	// 호출한 쪽으로 예외를 떠넘김 
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int dan = 0;
//		try {
			do {
				System.out.print("정수(2 ~ 9) : ");
					dan = Integer.parseInt(br.readLine());
			} while (dan < 2 || dan > 9);			// do while 이용 숫자 범위 초과 시 다시 입력 
//		} catch (NumberFormatException e) {		// 숫자가 아닐 때 예외처리 - 이렇게 처리할 경우 처음 입력한 숫자 나
//			this.input();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		return dan;
	} 
	public void output(int dan) {
		System.out.println(dan+"단");
		for(int i=1;i<=9;i++) {
			System.out.println(dan+" * "+i+" = "+dan*i);
		}
	}
	public static void main(String[] args) throws IOException {	// main에서는 다시 JVM으로 떠넘
		MethodStudy me = new MethodStudy();
		me.output(me.input());
	}

}
