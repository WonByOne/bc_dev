package wiring.spel;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpelTest {
	public static void main(String[] args) throws DisplayException {
		ApplicationContext ctx
			= new ClassPathXmlApplicationContext("/wiring/spel/ApplicationContext.xml");
		Data data = (Data) ctx.getBean("props");
		data.display();
	}
}
