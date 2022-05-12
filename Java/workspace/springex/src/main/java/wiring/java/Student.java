package wiring.java;

public class Student implements Role {
	private String casting;
	public void setCasting(String casting) {
		this.casting = casting;
	}

	@Override
	public void play() throws PerformanceException {
		char lastChar = casting.charAt(casting.length()-1);
		String postPosition = (lastChar - 0xAC00) % 28 > 0 ? "을" : "를";
		
		System.out.println(casting+postPosition+" 연기합니다.");
	}
}
