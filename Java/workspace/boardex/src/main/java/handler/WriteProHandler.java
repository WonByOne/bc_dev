package handler;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class WriteProHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		request.setCharacterEncoding("utf-8");
	
/*	<jsp:useBean id="dto" class="board.BoardDataBean"/>
		<jsp:setProperty name="dto" property="*"/>
		<!-- writer email subject content passwd -->
		<!-- DB 테이블 컬럼과 이름이 같은 것만 받아온다 -->
		<!-- num ref re_step re_level -->
		<!-- hidden 속성으로 4항목 받음 --> */
		
		BoardDataBean dto = new BoardDataBean();
		dto.setWriter(request.getParameter("writer"));;
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setRef(Integer.parseInt(request.getParameter("ref")));
		dto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		dto.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		dto.setIp(request.getRemoteAddr());		// eclipse default ipv6로 가져옴
	
	
		BoardDBBean dao = BoardDBBean.getInstance();
		int result = dao.insertArticle(dto);
		
		request.setAttribute("result", result);	// result 값 넘기기
		
		return "/board/writePro.jsp";
	}
}
