package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.blogSingleDeleteAction;
import action.blogSingleInsertAction;
import action.blogSingleModifyAction;
import action.blogSingleSelectAction;
import action.idCheckAction;
import dao.IndexCommentsDAO;
import vo.ActionForward;
import vo.IndexCommentsVO;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.bgs")
public class bgSingleCommentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("bgSingleCommentsController");
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		ActionForward forward = null;
		Action action = null;
		if (command.equals("/blog-singleInsert.bgs")) {
			action = new blogSingleInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blog-singleDelete.bgs")) {
			action = new blogSingleDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/blog-singleModify.bgs")) {
			action = new blogSingleModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/blog-singleSelect.bgs")) {
			action = new blogSingleSelectAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (forward != null) {

			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}

		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		System.out.println("blogSingleServlet : servlet호출 get 방식");
		String desertionNo = request.getParameter("DesertionNo");
		System.out.println("blogSingleServlet desertionNo getParameter = " + desertionNo);
		request.setAttribute("desertionNo", desertionNo);
		ServletContext context = this.getServletContext();
		IndexCommentsDAO indexCommenysDAO = IndexCommentsDAO.getInstance();
		ArrayList<IndexCommentsVO> commentList = indexCommenysDAO.selectComments(desertionNo);
		request.setAttribute("commentList", commentList);
		RequestDispatcher dispatcher = context.getRequestDispatcher("/blog-single.jsp"); // 넘길 페이지 주소
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
