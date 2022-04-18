package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import oracle.jdbc.driver.AbstractShardingPreparedStatement;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();
	public static BoardDBBean getInstance() { 	// single term pattern?
		
		return instance;
	}
	// DB 연동용 함수
	public Connection getConnection() throws NamingException, SQLException {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");	// 환경설정값
		DataSource ds = (DataSource) envCtx.lookup("OCI/joeun");	// META-INF/context.xml에 정의
		return ds.getConnection();
	}
	
	public int getCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next() ) {			// 데이터 꺼내기
	//			rs.getInt("count(*)");	// 결과 테이블 컬럼명
				count = rs.getInt(1);	// index로도 가능하다
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
		return count;
	}
	
	/**
	 * @param dto
	 * @return
	 */
	public int insertArticle(BoardDataBean dto) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		int num = dto.getNum();
		int ref = dto.getRef();
		int re_step = dto.getRe_step();
		int re_level = dto.getRe_level();
		
		/* 제목		ref		re_step		re_level
		 * 제목글		8		0			0
		 * ㄴ답변		8		1			1
		 * 	ㄴ재답변	8		2			2
		 *	ㄴ나중답변	8		1			1			// re_step 을 변화
		 *  
		 */
		/* 제목		ref		re_step		re_level
		 * 제목글		8		0			0
		 *	ㄴ나중답변	8		1			1			// re_step 을 변화
		 * ㄴ답변		8		2			1
		 * 	ㄴ재답변	8		3			2
		 *  
		 */
		String sql = null;
		try {
			con = getConnection();
			
			if(num == 0) { // 제목글
				sql = "select max(num) from board";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) { // 글 있는 경우
					ref = rs.getInt(1) + 1; // 그룹화ID = 글번호 최댓값 +1
				} else { // 글 없는 경우
					ref = 1;
				}
				re_step = 0;
				re_level = 0;
			} else { 	// 답변글
				sql = "update board set re_step=re_step+1 where ref=? and re_step>?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				
				re_step++;
				re_level++;
			}
			sql = "insert into board (num, writer, email, subject, passwd, reg_date,"
					+ "ref, re_step, re_level, content, ip)"
					+ "values(board_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			// board_seq.NEXTVAL // DB에서 생성한 일련번호
			if(pstmt != null) pstmt.close(); // 한번 사용했으므로 닫고 다시 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setTimestamp(5, dto.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, dto.getContent());
			pstmt.setString(10, dto.getIp());
			
			result = pstmt.executeUpdate();
			
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(SQLException e) {
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
