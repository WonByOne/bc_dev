package j08;

// 다형성
import java.util.Date;

public class TostringEx {							// extends Object 생략되어 있음
	public String toString() {
		return "toString : te toString"; 
	}
	
	public static void main(String[] args) {
		TostringEx te = new TostringEx();	
		System.out.println("te\t: "+te.toString());	// 4byte 16진수 주소 - toString() 기본 호출 Object class에 포함
													// 출력할 때 재정의 해서 포맷을 지정할 수 있음
		Date d = new Date();
		System.out.println("Date\t: "+d);   		// Date의 toString() 호출, 출력형식 지정
											
		String s = new String("ABC");
		System.out.println("String\t: "+s);			// String의 toString() 호출
	}

}


// 다형성을 위해서 - c++에서는 반드시 추상클래스 왜냐하면 상속 이후에도 부모 클래스를 호출 가능하기 때문에
//             - 자바에서는 오버라이드를 통해 부모 클래스 원천 봉쇄, 따라서 반드시 추상클래스를 만들 필요는 없다.