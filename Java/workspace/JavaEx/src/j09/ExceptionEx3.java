package j09;
//사용자 정의 예외
//정수 입력 받아서 구구단 출력

import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.io.IOException;

class DanException extends Exception{
}


public class ExceptionEx3 {
	
	public void Multiply(int dan) {
		System.out.println(dan +"단");
		for(int i=1;i<=9;i++ ) {
			System.out.println( dan+" * " +i+" = "+dan*i );
		}
	}
	
	public static void main(String[] args) {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		
		
		System.out.print("구구단 : ");
		try {
			int dan = Integer.parseInt(br.readLine());
			if(dan < 2|| dan > 9) {
				throw new DanException();
			}
			ExceptionEx3 me = new ExceptionEx3();
			me.Multiply(dan);			

		} catch (IOException e) {
			e.printStackTrace();
		} catch (DanException e) {
			System.out.println("2 ~ 10");
		}
		
		
		
	}

}
