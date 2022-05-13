package aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

// xml AOP 대신 사용
@Aspect 
public class Audience {
	@Pointcut("execution(* aop.Performer.perform(..))")
	public void performance() {}
	
	@Before("performance()")
	public void takeSeats() {
		System.out.println("자리에 앉는다");
	}
	@Before("performance()")
	public void turnOffCellPhones() {
		System.out.println("휴대폰을 끈다");
	}
	@AfterReturning("performance()")
	public void applaud() {
		System.out.println("짝짝짝짝!!");
	}
	@AfterThrowing("performance()")
	public void demandRefund() {
		System.out.println("우~! 돈 내놔라~!!!");
	}
	@Around("performance()")
	public void runtime(ProceedingJoinPoint joinpoint) {
		long start = System.currentTimeMillis();
		try {
			joinpoint.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		System.out.println("실행시간 : "+(end-start));
	}
}
