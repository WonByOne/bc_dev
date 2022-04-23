package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainHandler implements CommandHandler { 
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		return "/member/main.jsp";
	}
}
