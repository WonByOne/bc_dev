package j06;

import java.util.StringTokenizer; // util package import 필요

public class StringTokenizerEx {

	public static void main(String[] args) {

		StringTokenizer st = new StringTokenizer( "2022/03/21", "/", true );
		// String만 주면 white space로 자름
		//  delimiter "/" 설정, true를 주면 "/"도 Token으로 사용
		
		System.out.println(st); // st의 주소만 출력됨 - 내부 Method로 접근 가능
		
		while(st.hasMoreTokens()) {
			System.out.println("Token : " + st.nextToken());
		}
		
		
		
		
	}

}
