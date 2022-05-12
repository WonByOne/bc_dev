package wiring.scan;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class scanTest {

	public static void main(String[] args) throws PerformanceException {
			ApplicationContext ctx
				= new ClassPathXmlApplicationContext("/wiring/scan/ApplicationContext.xml");
			
			Performer hong = (Performer) ctx.getBean("actor");
			hong.perform();
			
			// ApplicationContext.xml에 설정된 bean 태그 중 singer를 선택해서 객체를 만듬
			Performer singer = (Performer) ctx.getBean("singer");

			singer.perform();
	}
}
