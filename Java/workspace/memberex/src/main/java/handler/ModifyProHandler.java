package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;
import logon.LogonDataBean;

public class ModifyProHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		
		LogonDataBean dto = new LogonDataBean();
		dto.setPasswd(request.getParameter("passwd"));
		
		String tel = null;
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		if(! tel1.equals("") && ! tel2.equals("") && ! tel3.equals("")) {
			tel = tel1+"-"+tel2+"-"+tel3;
		}
		dto.setTel(tel);
	
		String email = null;
		String email_id = request.getParameter("email_id");
		String email_prov = request.getParameter("email_prov");
		if(! email_id.equals("") && ! email_prov.equals("")) {
			email = email_id+"@"+email_prov;
		}
		dto.setEmail(email);
	
		// getAttribute는 객체를 반환 : 형변환 필요
		dto.setId((String) request.getSession().getAttribute("memid"));	
	
		LogonDBBean dao = LogonDBBean.getInstance();
		int result = dao.modifyMember(dto);

		request.setAttribute("result", result);
		
		return "/member/modifyPro.jsp";
	}
}
