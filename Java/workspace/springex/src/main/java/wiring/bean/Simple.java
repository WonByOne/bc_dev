package wiring.bean;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Simple {
	public static void main(String[] args) throws PerformanceException {
		Juggler kim = new Juggler();	// Strong bind
		kim.perform();
		
		// loose bind
		Performer lee = new Juggler();
		lee.perform();
		
		// DI 종속 객체 주입
		ApplicationContext ctx 
			= new ClassPathXmlApplicationContext("/wiring/bean/ApplicationContext.xml");
		Performer hong = (Performer) ctx.getBean("hong");
		hong.perform();
		
		// singleton / prototype
//		Ticket t1 = new Ticket();  // 서로 다른 객체 (prototype과 같음)
//		Ticket t2 = new Ticket();
		Ticket t1 = (Ticket) ctx.getBean("ticket");	// 객체 공유 (singleton)
		Ticket t2 = (Ticket) ctx.getBean("ticket");  
		
		
		t1.reservation();
		t2.reservation();
		
		// 빈 초기화와 정리 
		// Auditorium auditorium = (Auditorium) ctx.getBean("auditorium");
		
		
		System.out.println();
		// 연습
		Performer singer = (Performer) ctx.getBean("singer");
		singer.perform();
	}
}
