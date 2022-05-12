package wiring.java;

public class Piano implements Instrument {
	@Override
	public void playing() throws PerformanceException {
		System.out.println("Piano : 띵똥 띵똥");
	}
}
