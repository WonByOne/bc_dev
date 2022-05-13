package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DAOTest {
	public static void main(String args[]) {
		ApplicationContext ctx
			= new ClassPathXmlApplicationContext("/dao/ApplicationContext.xml");
		UserDao userDao = (UserDao) ctx.getBean("userDao");
		
		String id = "fff";
		User kim = new User();
		kim.setId(id);
		kim.setPasswd("1");
		kim.setName("김건모");
		kim.setTel("1111-9999");
		
		// delete
		userDao.delUser(id);
		
		// insert
		userDao.addUser(kim);
	}
} 
