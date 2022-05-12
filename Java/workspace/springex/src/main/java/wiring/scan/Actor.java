package wiring.scan;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
// import org.springframework.stereotype.Component;

// @Component("hong") // 이름을 지정을 하지 않을 경우 actor로 만들어짐
public class Actor implements Performer {
	@Value("설경구")
	private String name;
	@Value("50")	// 정수도 따옴표
	private int age;
	@Resource(name="teacher")
	private Role role;
	
	@Override
	public void perform() throws PerformanceException {
		System.out.println(name+"이고 "+age+"살 입니다.");
		role.play();
	}
}
