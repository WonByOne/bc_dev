package wiring.anno;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;

public class Instrumentalist implements Performer {
	
	@Value("#{'돌덩이'}")		// 원시자료형 annotation
	private String song;
	
	// 할당하는 멤버함수 없어도 가능 - private을 무시하는 형태가 되어버림
	@Autowired(required=false) 	// required=fall 객체가 없을 경우 null을 넣는 형태로 바뀜
								// 함수 호출 시 null/not null 구분해서 예외처리가 쉽도록 해줌
	@Qualifier("stringed")			// annotation 이용한 객체 선택 가능 xml의 candidate 생략 가능
	
//	@Resource(name="piano")
	private Instrument instrument;	
	
	public Instrumentalist() {}
	public Instrumentalist(String song, Instrument instrument) {
		this.song = song;
		this.instrument = instrument;
	}
//	public void setSong(String song) { 	// xml에 property가 없으면 필요 없음
//		this.song = song;
//	}
	
	/* Annotation @Autowired 하면 꼭 setter가 아니어도 가능하다.
	@Autowired	
	public void setInstrument(Instrument instrument) {
		this.instrument = instrument;
	} */
	
	/* Annotation @Autowired 하면 꼭 setter가 아니어도 가능하다.
	@Autowired
	public void myInstrument(Instrument instrument) {
		this.instrument = instrument;
	} */
	
	@Override
	public void perform() throws PerformanceException {
		char lastChar = song.charAt(song.length()-1);
		String postPosition = (lastChar - 0xAC00) % 28 > 0 ? "을" : "를";

		System.out.println(song+postPosition+" 연주합니다.");
		instrument.playing();
	}
}
