package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.idCheckAction;
import dao.LoginDAO;
import dao.MemberDAO;
import dao.MemberInsertDAO;
import vo.ActionForward;
import vo.LoginUser;

/**
 * Servlet implementation class loginController
 */
@WebServlet("*.lg")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/checkid.lg")) { // 회원가입시
			String id = request.getParameter("id"); // ajax값 가져오기
			System.out.println(id);
			MemberDAO member = new MemberDAO();
			response.getWriter().write(new MemberDAO().idCheck(id) + "");
		} else if (command.equals("/insert.lg")) {
			MemberInsertDAO insert = new MemberInsertDAO();
			String name = request.getParameter("name");
			String phoneNum = request.getParameter("phone");
			String email = request.getParameter("email");
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			System.out.println(name + " " + phoneNum + " " + email + " " + id + " " + pw);
			insert.insertMember(name, phoneNum, email, id, pw);
			response.sendRedirect("Welcome.jsp");
//			response.getWriter().write(new MemberInsertDAO().insertMember(name, phoneNum, email, id, pw) + "");
		} else if (command.equals("/login.lg")) {
			HttpSession session = request.getSession(true);
			LoginDAO login = new LoginDAO();
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			System.out.println("login : " + id + " " + pw);
			LoginUser check = new LoginDAO().checkInfo(id, pw);
			if (check != null) {	//로그인한 회원의 정보 세션에 저장
            session.setAttribute("id",id);
            session.setAttribute("password", pw);
            session.setAttribute("email", check.getEmail());
            session.setAttribute("phone", check.getPhone());
            session.setAttribute("name", check.getName());
            session.setAttribute("user", check);
			}
			System.out.println(check + "");
			response.getWriter().write(check + "");
		}
//         action = new idCheckAction();
//         try {
//            forward = action.execute(request, response);
//         } catch (Exception e) {
//            e.printStackTrace();
//         }
//      }
//      if (forward != null) {
//
//         if (forward.isRedirect()) {
//            response.sendRedirect(forward.getPath());
//         } else {
//            RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
//            dispatcher.forward(request, response);
//         }
//
//      }

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}