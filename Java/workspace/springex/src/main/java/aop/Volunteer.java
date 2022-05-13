package aop;

public class Volunteer implements Thinker {
	@Override
	public void thinking(String thoughts) throws PerformanceException {
		System.out.println("지원자의 생각 : "+thoughts);
	}
}
