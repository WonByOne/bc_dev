package wiring.bean;

public class Stage {
	private static Stage stage = new Stage();
	private Stage() {} //new 방식으로 생성을 못하게 막음
	public static Stage getInstance() {
		return stage;
	}
}
