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

public class blogSingleModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("blogSingleModifyAction");
		response.setContentType("text/html;charset=utf-8");
		HashMap<String, String> myHashMap1 = new HashMap<String, String>();
		PrintWriter out = response.getWriter();
		// 배열을 저장할 totalObject
		JSONObject totalObject = new JSONObject();
		JSONObject memberInfo = null;
		JSONArray memberArray = new JSONArray();
		// memberInfo JSON 객체를 저장할 배열
		String content = request.getParameter("Comments");//수정내용
		String indexComments = request.getParameter("indexComments");
		String desertionNo = request.getParameter("desertionNo");
		String userid = request.getParameter("userid");
		IndexCommentsDAO instance = IndexCommentsDAO.getInstance();//db 인스턴스 생성
		instance.ModifyComments(content,indexComments);//db insert 함수 실행
		ArrayList<IndexCommentsVO> commentList = instance.selectComments(desertionNo);//변경된 db의 데이터를 select
		for (IndexCommentsVO vo : commentList) {
			myHashMap1.put("userID", vo.getUserID());
			myHashMap1.put("comment", vo.getComment());
			myHashMap1.put("indexComment", Integer.toString(vo.getIndexComments()));
			myHashMap1.put("regist_date", vo.getRegist_date());
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
