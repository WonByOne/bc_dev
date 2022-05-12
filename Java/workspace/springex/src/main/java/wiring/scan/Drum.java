package wiring.scan;

// import org.springframework.stereotype.Component;

// @Component
public class Drum implements Instrument {
	@Override
	public void playing() throws PerformanceException {
		System.out.println("Drum : 두두두두");
	}
}
