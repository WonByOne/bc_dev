package wiring.bean;

public class Juggler implements Performer {
	int beanBags = 3;
	public Juggler() {}	// 디폴트 생성
	public Juggler(int beanBags) {	// 자식으로부터 넘어오는 beanBags 처
		this.beanBags = beanBags;
	}
	@Override
	public void perform() throws PerformanceException {
		System.out.println(beanBags+"개를 저글링합니다.");
	}
}
