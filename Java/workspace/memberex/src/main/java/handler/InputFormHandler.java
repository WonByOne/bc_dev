package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InputFormHandler implements CommandHandler {
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		return "/member/inputForm.jsp";
	}
}
