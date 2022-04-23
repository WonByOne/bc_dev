package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;

public class DeleteProHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		//getAttribute는 객체를 리턴한다 형변환 필요
		String id = (String) request.getSession().getAttribute("memid");
		String passwd = request.getParameter("passwd");
		
		LogonDBBean dao = LogonDBBean.getInstance();
		int resultCheck = dao.checkid(id, passwd);	// 세션의 id를 쓰기 때문에 id가 틀릴 수는 없다.
		
		request.setAttribute("resultCheck", resultCheck);
		
		if(resultCheck != 0) {
			int result = dao.deleteMember(id);
			request.setAttribute("result", result);
		}
		return "/member/deletePro.jsp";
	}
}
