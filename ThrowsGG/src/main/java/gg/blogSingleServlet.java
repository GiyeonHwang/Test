package gg;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.IndexCommentsDAO;
import vo.IndexCommentsVO;

/**
 * Servlet implementation class blogSingleServlet
 */
@WebServlet("/blog-single")
public class blogSingleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public blogSingleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
