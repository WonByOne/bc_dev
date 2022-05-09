package wiring.bean;

public class Juggler implements Performer {
	private int beanBags;
	public Juggler(int beanBags) {
		this.beanBags = beanBags;
	}
	@Override
	public void perform() throws PerformanceException {
		System.out.println(beanBags+"개를 저글링합니다.");
	}
}
