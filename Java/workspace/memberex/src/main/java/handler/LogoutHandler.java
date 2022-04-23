package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
//		session.removeAttribute("memid");	// session 이란 내장객체는 JSP에서만 사용
		request.getSession().removeAttribute("memid");
//		response.sendRedirect("main.jsp");	// return으로 대체
		return "/member/main.jsp";
	}
}
