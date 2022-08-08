package ajaxtest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	/* JDBC 설정
	 * private static final String DRIVER = "com.mysql.cj.jdbc.Driver"; //DRIVER
	 * NAME private static final String URL =
	 * "jdbc:mysql://127.0.0.1:3306/servletex?serverTimezone=Asia/Seoul"; //JDBC
	 * URL/스키마 private static final String USER = "servlet"; //DB ID private static
	 * final String PWD = "1234"; //DB PW
	 */	
	
	private Connection con;
	private PreparedStatement pstmt;
	//DataSource설정
	private DataSource ds;
	
	public MemberDAO() {
		try {
			//JNDI에 접근하기 위해 기본 경로를 지정
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			//context.xml에 설정한 name값을 이용해 톰캣이 미리 연결한 DataSource를 받아온다.
			ds = (DataSource) envContext.lookup("jdbc/mysql");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	} //생성자
	
	List<MemberVO> listMembers() {
		List<MemberVO> list = new ArrayList<>();

		try {
//			connectDB(); //JDBC설정
			
			//DataSource를 이용해 데이터베이스에 연결한다.
			con = ds.getConnection();
			String sql = "select * from member";
			System.out.println("Query : " + sql);
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				/*
				 * select문을 날려서 받아올 칼럼들.
				 * getString(String columnLabel)으로 받아온다.
				 * */
				String id = rs.getString("id");

				
				/*
				 * 받아온 데이터를
				 * MemberVO객체에 담는다.
				 * */
				MemberVO vo = new MemberVO();
				vo.setId(id);
				
				list.add(vo);
			}
			//연결했던 반대순서로 닫는다.
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	} //listMembers()
	
	
	public boolean idCheck(String id) {
        if(id == null || id.length() == 0) throw new NullPointerException("아이디가 없습니다.");
        System.out.println("id : " + id);

        final String SQL = "select id"
                + " frommember"
                +" where id = ?";
        System.out.println("SQL : " + SQL);

        try {
            //DB연결 - 쿼리 등록 - '?'에 값 매핑 - 쿼리 전송 - 결과
            con = ds.getConnection();
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, id);

            ResultSet rs = pstmt.executeQuery();

            //'result'라는 컬럼의 값을 받아온다.
            rs.next();
            String result = rs.getString(1);
            System.out.println("result : " +result);

            return Boolean.parseBoolean(result);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
	
	
//	 JDBC설정
	  private void connectDB() { try { Class.forName("com.mysql.cj.jdbc.Driver");
	  System.out.println("DRIVER LOADING....."); con =
	  DriverManager.getConnection("jdbc:mysql://localhost:3306/people?user=root&password=1234");
	  System.out.println("Connection 생성");
	  
	  } catch (Exception e) { e.printStackTrace(); } }
	 
}