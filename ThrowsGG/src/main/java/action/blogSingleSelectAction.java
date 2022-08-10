package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import action.Action;
import dao.IndexCommentsDAO;
import vo.ActionForward;
import vo.IndexCommentsVO;

public class blogSingleSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("blogSingleSelectAction");
		response.setContentType("text/html;charset=utf-8");
		HashMap<String, String> myHashMap1 = new HashMap<String, String>();
		PrintWriter out = response.getWriter();
		JSONObject totalObject = new JSONObject();
		JSONObject memberInfo = null;
		JSONArray memberArray = new JSONArray();
		String desertionNo = request.getParameter("desertionNo");
		IndexCommentsDAO instance = IndexCommentsDAO.getInstance();// db 인스턴스 생성
		ArrayList<IndexCommentsVO> commentList = instance.selectComments(desertionNo);// 변경된 db의 데이터를 select
		System.out.println(commentList.size());
		request.setAttribute("listsize", commentList.size()+"");
		for (IndexCommentsVO vo : commentList) {
			myHashMap1.put("userID", vo.getUserID());
			myHashMap1.put("comment", vo.getComment());
			myHashMap1.put("indexComment", Integer.toString(vo.getIndexComments()));
			myHashMap1.put("regist_date", vo.getRegist_date());
			memberInfo = new JSONObject(myHashMap1);
			memberArray.add(memberInfo);
		}
		totalObject.put("members", memberArray);
		totalObject.put("listsize", commentList.size());
		String jsonInfo = totalObject.toJSONString();
		out.print(jsonInfo);
		out.close();
		return null; // foword를 안하기떄문에 null로 값 넘김 - mkc
	}

}
