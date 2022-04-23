package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;

public class LoginProHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
	
		LogonDBBean dao = LogonDBBean.getInstance();
		int result = dao.checkid(id, passwd);
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		
		return "/member/loginPro.jsp";
	}
}
