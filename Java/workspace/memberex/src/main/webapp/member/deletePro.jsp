<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>

<h3> <%=page_del%></h3>

<%
	//getAttribute는 객체를 리턴한다 형변환 필요
	String id = (String) session.getAttribute("memid");
	String passwd = request.getParameter("passwd");
%>

<%
	LogonDBBean dao = LogonDBBean.getInstance();
	int result = dao.checkid(id, passwd);	// 세션의 id를 쓰기 때문에 id가 틀릴 수는 없다.
	if(result == 0) { // wrong password
		%>
		<script type="text/javascript">
		/*<![CDATA[*/
			erroralert(passwderror); 
		/*]]>*/
		</script>
		<%
	} else { // correct password : delete account
		result = dao.deleteMember(id);
		if(result == 0) {	// DB문제 : main(2단계 전)으로 돌아가야한다.
							// erroralert 사용하면 불가.
			%>
			<script type="text/javascript">
			/*<![CDATA[*/
				alert(deleteerror);
			/*]]>*/		
			</script>
			<meta http-equiv="refresh" content="0; url=main.jsp">
			<%
		} else { // delete account
			session.removeAttribute("memid"); // 세션을 지우고
			response.sendRedirect("main.jsp");// main으로 되돌린다
		}
	}	
%>