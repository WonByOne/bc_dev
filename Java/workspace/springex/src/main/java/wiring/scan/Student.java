package wiring.scan;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

// @Component	// xml에 bean 태그로 안 만들어도 된다.
public class Student implements Role {
	@Value("학생")
	private String casting;
	@Override
	public void play() throws PerformanceException {
		char lastChar = casting.charAt(casting.length()-1);
		String postPosition = (lastChar - 0xAC00) % 28 > 0 ? "을" : "를";
		
		System.out.println(casting+postPosition+" 연기합니다.");
	}
}
