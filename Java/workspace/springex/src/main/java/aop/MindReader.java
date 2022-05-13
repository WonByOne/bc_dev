package aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class MindReader implements Magician {
	@Pointcut("execution(* aop.Thinker.thinking(String)) && args(thoughts)")
	public void think(String thoughts) {}
	
	@Before("think(thoughts)")
	@Override
	public void interceptor(String thoughts) throws PerformanceException {
		System.out.println("가로챈 지원자의 생각 : "+thoughts);
	}
}
