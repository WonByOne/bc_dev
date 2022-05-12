package wiring.java;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration	// 객체 생성용 config class 이름은 아무 상관이 없다. 
public class CreateBean {
	@Bean
	public Role student() {	// 메소드의 이름이 객체의 이름이 되어야한다.
		Student student = new Student();
		student.setCasting("학생");
		return student;
	}
	@Bean
	public Role company() {
		Company company = new Company();
		company.setCating("회사원");
		return company;
	}
	@Bean
	public Role teacher() {
		Teacher teacher = new Teacher();
		teacher.setCasting("교사");
		return teacher;
	}
	@Bean
	public Performer hong() {	// 메소드의 이름이 객체의 이름
		Actor actor = new Actor();
		actor.setName("설경구");
		actor.setAge(50);
		actor.setRole(teacher());
		return actor;
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
	public Performer singer() {
		Singer singer = new Singer();
		singer.setSong(stone());
		singer.setInstrument(guitar());
		return singer;
	}
}
