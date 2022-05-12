package wiring.scan;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

// @Component // include-filter 사용으로 필요 없어짐
public class Teacher implements Role {
	@Value("교사")
	private String casting;
	@Override
	public void play() throws PerformanceException {
		char lastChar = casting.charAt(casting.length()-1);
		String postPosition = (lastChar - 0xAC00) % 28 > 0 ? "을" : "를";
		
		System.out.println(casting+postPosition+" 연기합니다.");
	}
}
