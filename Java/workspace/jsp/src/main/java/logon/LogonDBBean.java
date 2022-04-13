package logon;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class LogonDBBean {	
	private static LogonDBBean instance = new LogonDBBean();	// page 마다 객체를 생성하지 않고, 전부 공유해서 사용
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	// Connection을 return하는 함수
	public Connection getConnection() throws NamingException, SQLException {	 
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("OCI/joeun");
		return ds.getConnection();
	}
	
	
} // class
