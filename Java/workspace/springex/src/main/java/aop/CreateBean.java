package aop;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration	// 객체 생성용 config class 이름은 아무 상관이 없다. 
public class CreateBean {
	@Bean
	public Audience audience() {
		return new Audience();
	}
	@Bean
	public Thinker kim() {
		return new Volunteer();
	}
	@Bean
//	public Magician mindRead() { // 실행 안됨 interface에 있는 함수가 아니어서 안된다..?
	public MindReader mindReader() {
		return new MindReader();
	}
	
	@Bean
	public Song stone() {
//		Stone stone = new Stone();
//		return stone;
		return new Stone();
	}
	@Bean
	public Song close() {
		return new Close();
	}
	
	@Bean
	public Instrument piano() {
		return new Piano();
	}
	@Bean
	public Instrument guitar() {
		return new Guitar();
	}
	@Bean
	public Instrument drum() {
		return new Drum();
	}
	@Bean
	public Performer hong() {
		Instrumentalist instrumentalist = new Instrumentalist();
		instrumentalist.setSong("돌덩이");
		instrumentalist.setInstrument(drum());
		return instrumentalist;
	}
	@Bean
	public Performer singer() {
		Singer singer = new Singer();
		singer.setSong(stone());
		singer.setInstrument(guitar());
		return singer;
	}
}
