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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HashMap<String, String> myHashMap1 = new HashMap<String, String>();
		PrintWriter out = response.getWriter();
		// 배열을 저장할 totalObject
		JSONObject totalObject = new JSONObject();
		JSONObject memberInfo = null;
		JSONArray memberArray = new JSONArray();
		// memberInfo JSON 객체를 저장할 배열
		System.out.println("blogSingleServlet : servlet호출 post 방식");
		response.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		System.out.println("blogSingleServlet  userid = " + userid);
		String content = request.getParameter("content");
		System.out.println("blogSingleServlet  content = " + content);
		String desertionNo = request.getParameter("desertionNo");
		System.out.println("blogSingleServlet  desertionNo = " + desertionNo);
		IndexCommentsDAO indexCommenysDAO = IndexCommentsDAO.getInstance();
		IndexCommentsDAO instance = IndexCommentsDAO.getInstance();
		instance.insertComments(content, userid, desertionNo);//db insert 함수 실행
		ArrayList<IndexCommentsVO> commentList = indexCommenysDAO.selectComments(desertionNo);//변경된 db의 데이터를 select
		for (IndexCommentsVO vo : commentList) {
			myHashMap1.put("userID", vo.getUserID());
			myHashMap1.put("comment", vo.getComment());
			myHashMap1.put("indexComment", Integer.toString(vo.getIndexComments()));
			memberInfo = new JSONObject(myHashMap1);
			memberArray.add(memberInfo);
		}
		totalObject.put("members", memberArray);
		String jsonInfo = totalObject.toJSONString();
		out.print(jsonInfo);
		out.close();
		return null; //foword를 안하기떄문에 null로 값 넘김 - mkc
	}

}
