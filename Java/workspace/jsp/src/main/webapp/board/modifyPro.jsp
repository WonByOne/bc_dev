<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<script src="<%=project%>/script.js"></script>

<h2><%=page_modify%></h2>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="board.BoardDataBean"/>
	<jsp:setProperty name="dto" property="*"/>
	<!-- num email subject content passwd -->
<%
	String pageNum = request.getParameter("pageNum"); // pageNum은 바구니 DTO에 없
%>
<%
	BoardDBBean dao = BoardDBBean.getInstance();
	int result = dao.modifyArticle(dto);
	
	if(result == 0) {
		%>
		<script type="text/javascript">
		/*<![CDATA[*/
			erroralert(modifyerror);
		/*]]>*/
		</script>
		<%
	} else {
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	}
%>
