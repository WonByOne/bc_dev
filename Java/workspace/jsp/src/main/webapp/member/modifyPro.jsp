<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>

<jsp:useBean id="dto" class="logon.LogonDataBean"/>
	<jsp:setProperty name="dto" property="*"/>
	<!-- passwd 밖에 못 받음
		hidden으로 받을 수 없을까?-->	
<%
	String tel = null;
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	if(! tel1.equals("") && ! tel2.equals("") && ! tel3.equals("")) {
		tel = tel1+"-"+tel2+"-"+tel3;
	}
	dto.setTel(tel);
%>
<%
	String email = null;
	String email_id = request.getParameter("email_id");
	String email_prov = request.getParameter("email_prov");
	if(! email_id.equals("") && ! email_prov.equals("")) {
		email = email_id+"@"+email_prov;
	}
	dto.setEmail(email);
%>
<%	// getAttribute는 객체를 반환 : 형변환 필요
	dto.setId((String) session.getAttribute("memid"));	
%>
<%
	LogonDBBean dao = LogonDBBean.getInstance();
	int result = dao.modifyMember(dto);
	if(result == 0) {
		%>
		<script type="text/javascript">
		/*<![CDATA[*/
			alert(modifyerror);
		/*]]>*/
		</script>
		<meta http-equiv="refresh" content="0; url=main.jsp">
		<%
	} else {
		response.sendRedirect("main.jsp");
	}
%>