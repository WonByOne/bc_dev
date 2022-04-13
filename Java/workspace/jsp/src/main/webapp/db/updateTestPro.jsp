<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>JDBC - update</h2>
<h3>Modifying Page</h3>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
%>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
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
		
		String sql = "select * from dbtest where id='"+id+"'";
		rs = stmt.executeQuery(sql);
		if(rs.next()) { // id found
			if(passwd.equals(rs.getString("passwd"))) {	// password identified
				%>
				<form method="post" action="updateTest.jsp"> 
					<input type="hidden" name="id" value='<%=rs.getString("id")%>'>
					<!-- submit 했을 때 id를 같이 보내기 위해 hidden 사용 -->
					<table border=1>
						<tr>
							<th>ID</th>
							<td><%=rs.getString("id")%></td>
						</tr>
						<tr>
							<th>Password</th>
							<td><input type="password" name="passwd" value='<%=rs.getString("passwd")%>'></td>
						</tr>
						<tr>
							<th>Name</th>
							<td><%=rs.getString("name")%></td>
						</tr>
						<tr>
							<th>Tel</th>
							<td><input type="text" name="tel" value='<%=rs.getString("tel")%>'></td>
						</tr>
						<tr>
							<th colspan=2>
								<input type="submit" value="수정"> <!-- submit은 input 태그만 넘김 -->
								<input type="reset" value="취소">
							</th>
						</tr>
					</table>
				</form>
				<%
				
			} else { 	// password not identified
				%>
				Wrong password.<br>
				Please check again.<br>
				<meta http-equiv="refresh" content="2; url=updateTestForm.jsp">
				<%
			}
		} else { 		// id not found
			%>
			ID not found.<br>
			Please check again.<br>
			<meta http-equiv="refresh" content="2; url=updateTestForm.jsp">
			<%
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