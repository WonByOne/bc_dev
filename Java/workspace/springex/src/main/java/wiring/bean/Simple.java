package wiring.bean;

public class Simple {
	public static void main(String[] args) throws PerformanceException {
		Juggler kim = new Juggler(3);	// Strong bind
		kim.perform();
		
		// loose bind
		Performer lee = new Juggler(4);
		lee.perform();
		
		// DI 종속 객체 주입
	}
}
