package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.IndexCommentsDAO;
import vo.ActionForward;
import vo.IndexCommentsVO;

public class blogSingleInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("test_doMapping02");
		ActionForward forward = new ActionForward();
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
		forward.setPath("/blog-single.jsp");
		return forward;
	}

}
