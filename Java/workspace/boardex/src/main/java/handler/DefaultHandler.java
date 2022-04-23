package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DefaultHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		request.setAttribute("result", "처리할 수 없는 요청입니다.");
		return "/board/default.jsp";
	}
}
