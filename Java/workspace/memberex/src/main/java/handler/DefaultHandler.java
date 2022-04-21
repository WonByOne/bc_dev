package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DefaultHandler implements CommandHandler {
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		String result = "처리할 수 없는 요청입니다.";
		request.setAttribute("result", result);
		return "/member/default.jsp";
	}
	
}
