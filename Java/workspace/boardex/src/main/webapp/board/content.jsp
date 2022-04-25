<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="<%=project%>/style_board.css" rel="stylesheet" type="text/css">
<script src="<%=project%>/script.js"></script>

<h2><%=page_content%></h2>

<%	// 핸들러에서 넘어온 변수
	int number = (Integer) request.getAttribute("number");
	String pageNum = (String) request.getAttribute("pageNum");
	BoardDataBean dto = (BoardDataBean) request.getAttribute("dto");
%>
<table>
	<tr align="center">
		<th><%=str_num%></th>	
		<td>
			<%//=dto.getNum()%> 	<!-- 글번호 from DB -->
			<%=number%>			<!-- list에 보이는 글 번호 -->
		</td>	
		<th><%=str_readcount%></th>
		<td><%=dto.getReadcount()%></td>
	</tr>
	<tr align="center">
		<th><%=str_writer%></th>
		<td><%=dto.getWriter()%></td>
		<th><%=str_reg_date%></th>
		<td>
			<%
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			%>
			<%=sdf.format(dto.getReg_date())%>
		</td>
	</tr>
	<tr>
		<th><%=str_subject%></th>
		<td colspan=3><%=dto.getSubject()%></td>
	</tr>
	<tr>
		<th><%=str_content%></th>
		<td colspan=3><pre><%=dto.getContent()%></pre></td>
		<!-- 글 내용을 줄바꿈하기 위해서 -->
	</tr>
	<tr>
		<th colspan=4> <!--  수정과 삭제 처리 후 보던 리스트로 돌아오기 위해 pageNum -->
			<input class="inputbutton" type="button" value="<%=btn_modify%>"
				onclick="location='modifyForm.do?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_delete%>"
				onclick="location='deleteForm.do?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_reply%>"
				onclick="location='writeForm.do?num=<%=dto.getNum()%>&ref=<%=dto.getRef()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'">
			<input class="inputbutton" type="button" value="<%=btn_list%>"
				onclick="location='list.do?pageNum=<%=pageNum%>'">
		</th>
	</tr>
</table>