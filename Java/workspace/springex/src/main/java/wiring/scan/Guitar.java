package wiring.scan;

// import org.springframework.stereotype.Component;

// @Component
public class Guitar implements Instrument {
	@Override
	public void playing() throws PerformanceException {
		System.out.println("Guitar : 딩가 딩가");
	}
}
