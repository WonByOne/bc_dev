package handler;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class ListHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		int count = 0;
		int size = 5;
		int start = 0;	// 페이지 내의 시작 글id
		int end = 0;
		String pageNum = null;
		int currentPage = 0;	// 넘어온 페이지 String을 연산할 수 있게
		int pageSize = 5;
	
		BoardDBBean dao = BoardDBBean.getInstance(); // DB에서 게시판 정보 가져오기
		count = dao.getCount();
	
		pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt(pageNum);
		start = (currentPage - 1) * size + 1;		// (5 - 1) * 10 + 1		41
		end = start + size - 1;						// 41 + 10 - 1
		if(end > count) end = count;	// 글이 적을 경우
				
		int number = count - (currentPage - 1) * size;  // 55 - (5 - 1) *10
		
		int startPage = (currentPage / pageSize) * pageSize + 1; // (5 / 10) * 10 + 1
		if(currentPage % pageSize == 0) startPage -= pageSize; // 배수일 경우 맞추기
		
		int endPage = startPage + pageSize - 1;					 // 1 + 10 - 1
		int pageCount = (count / size) + (count % size > 0 ? 1 : 0);	// 나머지 페이지
		if(endPage > pageCount) endPage = pageCount;	// 실제 페이지가 적을 경우

		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		if(count > 0) {
			ArrayList<BoardDataBean> dtos = dao.getArticles(start, end);
			request.setAttribute("dtos", dtos);
		}
		
		return "board/list.jsp";
	}
}
