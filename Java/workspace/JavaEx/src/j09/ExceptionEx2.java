package j09;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.io.IOException;	// API 확인 Throwable 은 모든 에러와 Exception의 조상
public class ExceptionEx2 {

	public static void main(String[] args) {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("정수 : ");
		try {
			int a = Integer.parseInt(br.readLine());// readLine() OS에게 일부러 멈춤 알리는 예외처리 필요
													// parseInt() 숫자가 아니면 예외
			System.out.println("값 : "+100/a);
		} catch (IOException e) {					// import 필요
			System.out.println(e);
			e.printStackTrace();
		} catch (NumberFormatException e ) {
			System.out.println("Only Numbers");
		} catch (ArithmeticException e)	{
			System.out.println("0으로 나눌 수 없습니다");
		} finally {
			System.out.println("Terminated");
		}
		
	}
}
