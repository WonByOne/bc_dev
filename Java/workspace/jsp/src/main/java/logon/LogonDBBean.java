package logon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	public int insertMember(LogonDataBean dto) {
		int result = 0; // 작업 실패여부를 알기 위한 변수
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql =
					"insert into member values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId()); // DB의 index는 1부터
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getSsn());
			pstmt.setString(6, dto.getTel());
			pstmt.setString(7, dto.getEmail());
			pstmt.setTimestamp(8, dto.getReg_date());
			result = pstmt.executeUpdate(); // 몇줄 업데이트 했는지 리턴
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int checkid(String id) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {	// id 있음
				result = 1;
			} else {		// id 없음
				result = 0;
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close(); 
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
} // class
