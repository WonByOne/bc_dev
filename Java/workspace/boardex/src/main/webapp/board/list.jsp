<%--@page import="java.text.SimpleDateFormat"--%>
<%--@page import="board.BoardDataBean"--%>
<%--@page import="java.util.ArrayList"--%>
<%--@page import="board.BoardDBBean"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}/style_board.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>

<%--
	int count = (Integer) request.getAttribute("count");
	int number = (Integer) request.getAttribute("number");
	String pageNum = (String) request.getAttribute("pageNum");
	int currentPage = (Integer) request.getAttribute("currentPage");
	int pageSize = (Integer) request.getAttribute("pageSize");
	int startPage = (Integer) request.getAttribute("startPage");
	int endPage = (Integer) request.getAttribute("endPage");
	int pageCount = (Integer) request.getAttribute("pageCount");
--%>

<h2>${page_list}(${str_count} : ${count})</h2>

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
	<c:if test="${count eq 0}">
	<%--
		if(count == 0) {	// 글이 없는 경우
			--%>
		<tr>
			<td colspan=6 align="center">
				${msg_list_x}
			</td>
		</tr>
	</c:if>
	<c:if test="${count ne 0}">
			<%--
	} else {			// 글이 있는 경우
		ArrayList<BoardDataBean> dtos 
			= (ArrayList<BoardDataBean>) request.getAttribute("dtos");
		for(BoardDataBean dto : dtos) {
			--%>
		<c:forEach var="dto" items="${dtos}">
			<tr>
				<td align="center">
			 		<%//=dto.getNum()%> <!-- DB 그대로 출력 -->  
					${number}		<!-- 댓글 고려 순서 재설정 -->
					<c:set var="number" value="${number-1}"/>
				</td>
				<td>
					<c:set var="width" value="${(dto.re_level -1) * 10}"/>
					<c:if test="${dto.re_level gt 1}">
					<%--
						int level = dto.getRe_level();
						int width = (level - 1) * 10;
						if(level > 1) {		// level 재답변 글
							--%>
						<img src="/boardex/images/level.gif" border=0 height="10px" width="${width}">
					</c:if>
					<c:if test="${dto.re_level gt 0}">
							<%--
						}
						if(level > 0) { 	// level 1부터는 답글로 판단
							--%> 
						<img src="/boardex/images/re.png" border=0 width=16>
					</c:if>
					<c:if test="${dto.readcount eq -1}">
					<%--
						if(dto.getReadcount() == -1) {
							--%>
						${dto.subject}
					</c:if>
					<c:if test="${dto.readcount ne -1}">
							<%--
						} else {
							--%>
			<!-- 제목 클릭할 경우 글 번호와 페이지 번호가 같이 전달되도록 -->
						<a href="content.do?num=${dto.num}&pageNum=${pageNum}&number=${number+1}">  
							${dto.subject}
						</a>	
					</c:if>
				</td>
				<td align="center">
					${dto.writer}
				</td>
				<td align="center">
					<fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-DD HH:mm:ss"/>
					<%--
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					
					${sdf.format(dto.getReg_date())}--%>
				</td>
				<td align="center">
					<c:if test="${dto.readcount eq -1}">
					<%--
					if(dto.getReadcount() == -1) {
						--%>
						0
					</c:if>
					<c:if test="${dto.readcount ne -1}">
						<%--
					} else {	
						--%>
						${dto.getReadcount()}
					</c:if>						
				</td>
				<td align="center">
					${dto.getIp()}
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
<c:if test="${count gt 0}">
	<c:if test="${startPage gt pageSize}">
<%--
	if(count > 0) {
		if(startPage > pageSize) {
			--%>
		<a href="list.do?pageNum=${startPage - pageSize}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<%--
		}
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage) {
				--%>
		<c:if test="${i eq currentPage}">
			<b>[${i}]</b>
		</c:if>
		<c:if test="${i ne currentPage}">
				<%--
			} else {
				--%>
			<a href="list.do?pageNum=${i}">[${i}]</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage lt pageCount}">
				<%--
			}
		}
		if(endPage < pageCount) {
			--%>
		<a href="list.do?pageNum=${startPage + pageSize}">[▶]</a>
	</c:if>
</c:if>

	