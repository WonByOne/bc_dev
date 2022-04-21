package mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		// 3. 요청 처리
		String result = "처리할 요청이 없습니다";
		// 4. 결과 저장
		request.setAttribute("result", result);
		return "mvc/null.jsp";
	}
}
