package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class ContentHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		int number = Integer.parseInt(request.getParameter("number"));	// 리스트에 보이는 글번호
	
		BoardDBBean dao = BoardDBBean.getInstance();
		BoardDataBean dto = dao.getArticle(num);
		if(! request.getRemoteAddr().equals(dto.getIp())) {	// 다른 사람의 글을 읽었을 때
			dao.addCount(num);		// 조회 수 증가 	
		}
		// jsp로 변수 보내기
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("dto", dto);
		
		return "board/content.jsp";
	}
}
