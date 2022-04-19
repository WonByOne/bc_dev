<%@page import="board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>

<h2><%=page_write%></h2>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="board.BoardDataBean"/>
	<jsp:setProperty name="dto" property="*"/>
	<!-- writer email subject content passwd -->
	<!-- DB 테이블 컬럼과 이름이 같은 것만 받아온다 -->
	<!-- num ref re_step re_level -->
	<!-- hidden 속성으로 4항목 받음 -->
<%
	dto.setReg_date(new Timestamp(System.currentTimeMillis()));
	dto.setIp(request.getRemoteAddr());		// eclipse default ipv6로 가져옴
%>
<%
	BoardDBBean dao = BoardDBBean.getInstance();
	int result = dao.insertArticle(dto);
	if(result == 0) {
		%>
		<script type="text/javascript">
		/*<![CDATA[*/
			erroralert(inserterror);
		/*]]>*/
		</script>
		<%
	} else {
		response.sendRedirect("list.jsp");
	}
%>
