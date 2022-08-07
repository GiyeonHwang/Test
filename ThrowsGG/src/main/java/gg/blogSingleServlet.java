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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HashMap<String, String> myHashMap1 = new HashMap<String, String>();
		PrintWriter out = response.getWriter();
		// 배열을 저장할 totalObject
		JSONObject totalObject = new JSONObject();
		JSONObject memberInfo = null;
		// memberInfo JSON 객체를 저장할 배열
		JSONArray memberArray = new JSONArray();
		IndexCommentsDAO indexCommenysDAO = IndexCommentsDAO.getInstance();
		System.out.println("blogSingleServlet : servlet호출 post 방식");
		response.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		System.out.println("blogSingleServlet  userid = " + userid);
		String content = request.getParameter("content");
		System.out.println("blogSingleServlet  content = " + content);
		String desertionNo = request.getParameter("desertionNo");
		System.out.println("blogSingleServlet  desertionNo = " + desertionNo);
		IndexCommentsDAO instance = IndexCommentsDAO.getInstance();
		instance.insertComments(content, userid, desertionNo);
		ArrayList<IndexCommentsVO> commentList = indexCommenysDAO.selectComments(desertionNo);
		for (IndexCommentsVO vo : commentList) {
			myHashMap1.put("userID", vo.getUserID());
			myHashMap1.put("comment", vo.getComment());
			memberInfo = new JSONObject(myHashMap1);
			memberArray.add(memberInfo);
		}
		totalObject.put("members", memberArray);
		String jsonInfo = totalObject.toJSONString();
		out.print(jsonInfo);
		out.close();
	}
}
