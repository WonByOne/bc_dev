package wiring.spel;

public class Props implements Data {
	private String str;
	public void setStr(String str) {
		this.str = str;
	}
	public String getStr() {
		return str;
	}
	@Override
	public void display() throws DisplayException {
		System.out.println("값 : "+getStr());
	}
}
