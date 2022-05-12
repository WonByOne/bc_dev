package wiring.java;

public class Actor implements Performer {
	private String name;
	private int age;
	private Role role;
	public void setName(String name) {
		this.name = name;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setRole(Role role) {
		this.role = role;
	}


	@Override
	public void perform() throws PerformanceException {
		System.out.println(name+"이고 "+age+"살 입니다.");
		role.play();
	}
}
