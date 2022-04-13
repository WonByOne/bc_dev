<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>JDBC - delete</h2>
<h3>Processing Page</h3>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
%>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;	// query 받아올 클래스
	
	try{
/*		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "joeun";
		String dbPasswd = "joeun";
		con = DriverManager.getConnection(url, dbId, dbPasswd); */
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env"); // 설정 파일을 읽어와라
		DataSource ds = (DataSource) envCtx.lookup("OCI/joeun");	// DB이름으로 가져온다
		con = ds.getConnection();
		
		stmt = con.createStatement();
		
		String sql = "select * from dbtest where id='"+id+"'";
		rs = stmt.executeQuery(sql);	// query는 ResultSet 클래스 리턴
		if(rs.next()) { // id found
			if(passwd.equals(rs.getString("passwd"))) {	// password identified
				sql = "delete from dbtest where id='"+id+"'";
				int result = stmt.executeUpdate(sql);
				if(result == 0) {	// sql 실행 결과가 없을 경우
					%>
					회원 탈퇴에 실패했습니다.<br>
					잠시 후 다시 시도하세요.<br>
					<%
				} else {
					response.sendRedirect("selectTest.jsp");
				}
				
			} else {	// password not identified
				%>
				Wrong password.<br>
				Please check again.<br>
				<meta http-equiv="refresh" content="2; url=deleteTestForm.jsp">
				<%
			}
			
		} else { 		// id not found
			%>
			ID not found.<br>
			Please check again.<br>
			<meta http-equiv="refresh" content="2; url=deleteTestForm.jsp"> 
			<%	// 2초 뒤 url을 로딩
		}
		
/*	} catch(ClassNotFoundException e) {
		e.printStackTrace(); */
	} catch(SQLException e) {
		e.printStackTrace();
	} finally {
		try {
				if(con != null) con.close();
				if(stmt != null) stmt.close();
				if(rs != null) rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

%>
<body bgcolor="black" text="#d6d6d6"/>