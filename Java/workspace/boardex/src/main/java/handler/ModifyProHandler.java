package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class ModifyProHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		request.setCharacterEncoding("utf-8");
	
/*	<jsp:useBean id="dto" class="board.BoardDataBean"/>
		<jsp:setProperty name="dto" property="*"/>
		<!-- num email subject content passwd --> */
		
		BoardDataBean dto = new BoardDataBean();
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));
			
		String pageNum = request.getParameter("pageNum"); // pageNum은 바구니 DTO에 없
	
		BoardDBBean dao = BoardDBBean.getInstance();
		int result = dao.modifyArticle(dto);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return "board/modifyPro.jsp";
	}
}
