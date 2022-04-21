package mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ByeHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		String result = "안녕히 가세요";
		request.setAttribute("result", result);
		return "/mvc/bye.jsp";
	}
}
