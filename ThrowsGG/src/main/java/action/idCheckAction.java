package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.ActionForward;

public class idCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("action success");
		ActionForward forward = new ActionForward();
		forward.setPath("/join.jsp");
		MemberDAO member = new MemberDAO();
		
		return forward;
	}

}
