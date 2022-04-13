<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>JDBC - update</h2>
<h3>Processing Page</h3>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String tel = request.getParameter("tel");
%>
<%
	Connection con = null;
	Statement stmt = null;
	try {
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
		
		String sql = "update dbtest set passwd='"+passwd+"', tel='"+tel+"' where id='"+id+"'";
		int result = stmt.executeUpdate(sql);
		if(result == 0) {
			%>
			회원 정보 수정에 실패했습니다.<br>
			잠시 후 다시 시도하세요.<br>
			<%
		} else {
			response.sendRedirect("selectTest.jsp?id="+id);
		}
		
/*	} catch(ClassNotFoundException e) {
		e.printStackTrace(); */
	} catch(SQLException e) {
		e.printStackTrace(); 
	} finally {
		try {
			if(con != null) con.close();
			if(stmt != null) stmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
%>
<body bgcolor="black" text="#d6d6d6"/>