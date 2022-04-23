package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;
import logon.LogonDataBean;

public class ModifyViewHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		String id = (String) request.getSession().getAttribute("memid");
		String passwd = request.getParameter("passwd");
		// 패스워드 공란이면???
	
		LogonDBBean dao = LogonDBBean.getInstance();
		int result = dao.checkid(id, passwd);	// 세션의 ID 사용
		
		request.setAttribute("result", result);
		if(result != 0 ) {
			LogonDataBean dto = dao.getMember(id); // id에 따른 정보를 받아온다.
			request.setAttribute("dto", dto);
		}
		return "/member/modifyView.jsp";
	}
}
