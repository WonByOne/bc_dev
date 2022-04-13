<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>JDBC - select</h2>
<h3>Check Page</h3>

<%
	// sql import 필요
	Connection con = null;	// 접속
	Statement stmt = null;
	ResultSet rs = null;	// DB에서 돌아온 결과값을 담는 객체

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		%>
		Driver Loaded Successfully.<br>
		<%
		String url ="jdbc:oracle:thin:@db202203302133_high?TNS_ADMIN="+ //"C://wallet";
			"./wallet/";
		String dbId = "joeun";			// ID
		
		
		
		String dbPasswd = "Reccos@52525";		// password
		con = DriverManager.getConnection(url, dbId, dbPasswd);
		%>
		DB connected.
		<%
/*
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env"); // 설정 파일을 읽어와라
		DataSource ds = (DataSource) envCtx.lookup("OCI/joeun");	// DB이름으로 가져온다
		con = ds.getConnection();
*/		
		String id = request.getParameter("id");
		String sql = null;
		
		if(id == null || id.equals("")) {
			sql = "select * from dbtest";	
		} else {
			sql = "select * from dbtest where id='"+id+"'";	// 따옴표 주의 ++ 앞뒤로 준 다음 따옴표로 묶는게 편함
		}
		
		stmt = con.createStatement();	// 소켓에 버퍼를 싣는 개념?
		rs = stmt.executeQuery(sql);	// insert update delete 	executeUpdate()
										// select					executeQuery()
		%>
		<table border=1>
		<%
		while(rs.next()) {	// null이 나올때까지 1행씩 가져온다
			%>
			<tr>
				<td><%=rs.getString("id")%></td>
				<td><%=rs.getString("passwd")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("tel")%></td>
				<td><%=rs.getTimestamp("logtime")%></td>
			</tr>
			<%
		}
		%>
		</table>
		<%		
/*	} catch(ClassNotFoundException e) {
		e.printStackTrace();	*/
	} catch(SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if(con != null) con.close();	// 소켓이나 버퍼를 닫는 개념인듯?
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
%>

<body bgcolor="black" text="#d6d6d6"/>