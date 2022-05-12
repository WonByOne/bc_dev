package wiring.anno;

import org.springframework.beans.factory.annotation.Qualifier;

@Qualifier("stringed")	// 클래스 선언 전에 qualifier 설정
public class Guitar implements Instrument {
	@Override
	public void playing() throws PerformanceException {
		System.out.println("Guitar : 딩가 딩가");
	}
}
