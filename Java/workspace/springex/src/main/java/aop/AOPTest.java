package aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

class AOPTest {
	public static void main(String[] args) throws PerformanceException {
		ApplicationContext ctx
			= new ClassPathXmlApplicationContext("/aop/ApplicationContext.xml");
		Performer hong = (Performer) ctx.getBean("hong");
		hong.perform();
		
		Performer singer = (Performer) ctx.getBean("singer");
		singer.perform();
		
		Thinker kim = (Thinker) ctx.getBean("kim");
		kim.thinking("짜장면");
	}
}
