<%@page import="java.sql.Timestamp"%>
<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>

<h2><%=page_input%></h2>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="logon.LogonDataBean"/>
	<jsp:setProperty name="dto" property="*"/>
	<!-- DB의 항목과 변수 이름이 같은 것만 받을 수 있다 	id paswd name birth ssn  -->
	
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
	if(! email_id.equals("")) {
		if(email_prov.equals("0")) { // 직접 입력
			email = email_id;
		} else {  // 선택 입력
			email = email_id+"@"+email_prov;
		}
	}
	dto.setEmail(email);
%>
<%
	dto.setReg_date(new Timestamp(System.currentTimeMillis()));
	// 현재 컴퓨터 시간 - utc로 DB를 통일하고 로컬 시간에 맞춰서 보여주는게?
%>

<%
	LogonDBBean dao = LogonDBBean.getInstance();	// static 이므로 OBJ. 으로 가져다 쓴다
	int result = dao.insertMember(dto);
	if(result == 0) {
		%>
		<script type="text/javascript">
		/*<![CDATA[*/
			erroralert(inputerror);
		/*]]>*/
		</script>
		<%
	} else {
		response.sendRedirect("loginForm.jsp");
	}
%>
