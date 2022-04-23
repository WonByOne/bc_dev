<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="<%=project%>/style_board.css" rel="stylesheet" type="text/css">
<script src="<%=project%>/script.js"></script>

<%
	int count = (Integer) request.getAttribute("count");
	int number = (Integer) request.getAttribute("number");
	String pageNum = (String) request.getAttribute("pageNum");
	int currentPage = (Integer) request.getAttribute("currentPage");
	int pageSize = (Integer) request.getAttribute("pageSize");
	int startPage = (Integer) request.getAttribute("startPage");
	int endPage = (Integer) request.getAttribute("endPage");
	int pageCount = (Integer) request.getAttribute("pageCount");
%>

<h2><%=page_list%>(<%=str_count%> : <%=count%>)</h2>

<table>
	<tr>
		<td colspan=6 align="right">
			<a href="writeForm.do">글쓰기</a>&nbsp;&nbsp;&nbsp;
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
			ArrayList<BoardDataBean> dtos 
				= (ArrayList<BoardDataBean>) request.getAttribute("dtos");
			for(BoardDataBean dto : dtos) {
				%>
				<tr>
					<td align="center">
				 		<%//=dto.getNum()%> <!-- DB 그대로 출력 -->  
						<%=number--%>		<!-- 댓글 고려 순서 재설정 -->
					</td>
					<td>
						<%
							int level = dto.getRe_level();
							int width = (level - 1) * 10;
							if(level > 1) {		// level 재답변 글
								%>
								<img src="/boardex/images/level.gif" border=0 height="10px" width="<%=width%>">
								<%
							}
							if(level > 0) { 	// level 1부터는 답글로 판단
								%> 
								<img src="/boardex/images/re.png" border=0 width=16>
								<%
							}
						%>
						<%
							if(dto.getReadcount() == -1) {
								%>
								<%=dto.getSubject()%>
								<%
							} else {
								%>
				<!-- 제목 클릭할 경우 글 번호와 페이지 번호가 같이 전달되도록 -->
								<a href="content.do?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&number=<%=number+1%>">  
									<%=dto.getSubject()%>
								</a>
							<%
							}
						 	%>		
					</td>
					<td align="center">
						<%=dto.getWriter()%>
					</td>
					<td align="center">
						<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						%>
						<%=sdf.format(dto.getReg_date())%>
					</td>
					<td align="center">
						<%
						if(dto.getReadcount() == -1) {
							%>0<%
						} else {	
							%>
							<%=dto.getReadcount()%>
							<%
						}
						%>
					</td>
					<td align="center">
						<%=dto.getIp()%>
					</td>
				</tr>
				
				<%
			}
		}
	%>
</table>
<%
	if(count > 0) {
		if(startPage > pageSize) {
			%>
			<a href="list.do?pageNum=<%=startPage - pageSize%>">[◀]</a>
			<%
		}
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage) {
				%>
				<b>[<%=i%>]</b>
				<%
			} else {
				%>
				<a href="list.do?pageNum=<%=i%>">[<%=i%>]</a>
				<%	
			}
		}
		if(endPage < pageCount) {
			%>
			<a href="list.do?pageNum=<%=startPage + pageSize%>">[▶]</a>
			<%			
		}
	}
%>

	