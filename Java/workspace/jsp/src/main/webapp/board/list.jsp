<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="<%=project%>/style_board.css" rel="stylesheet" type="text/css">
<script src="<%=project%>/script.js"></script>

<%
	int count = 0;
	int size = 10;
	int start = 0;	// 페이지 내의 시작 글id
	int end = 0;
	String pageNum = null;
	int currentPage = 0;
%>
<%
	BoardDBBean dao = BoardDBBean.getInstance(); // DB에서 게시판 정보 가져오기
	count = dao.getCount();
%>
<%
	pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	currentPage = Integer.parseInt(pageNum);
	start = (currentPage - 1) * size + 1;
	end = start + size - 1;
	if(end<count) end = count;	//? 
%>
<%
//	ArrayList<BoardDBBean> dtos = dao.getArticles(start, end);
%>
<h2><%=page_list%>(<%=str_count%> : <%=count%>)</h2>

<table>
	<tr>
		<td colspan=6 align="right">
			<a href="writeForm.jsp">글쓰기</a>&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<th style="width:7%">글 번호</th>
		<th style="width:40%">제목</th>
		<th style="width:15%">작성자</th>
		<th style="width:15%">작성일</th>
		<th style="width:7%">조회수</th>
		<th>IP</th>
	</tr>
	<%
		if(count == 0) {	// 글이 없는 경우
			%>
			<tr>
				<td colspan=6 align="center">
					<%=msg_list_x%>
				</td>
			</tr>
			<%
			
		} else {			// 글이 있는 경우
			
		}
	%>
	
	
</table>

	