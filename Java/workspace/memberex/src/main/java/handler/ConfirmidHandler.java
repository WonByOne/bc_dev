package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;

public class ConfirmidHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		// confirmid.jsp 에서 가져온 소스
		String id = request.getParameter("id");  
		LogonDBBean dao = LogonDBBean.getInstance();
		int result = dao.checkid(id);
		
		request.setAttribute("result", result);	// jsp 파일로 다시 결과와 id를 보내는 부분
		request.setAttribute("id", id);

		return "/member/confirmid.jsp";
	}
}
