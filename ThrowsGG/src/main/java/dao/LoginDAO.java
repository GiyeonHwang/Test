package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.LoginUser;

public class LoginDAO {
	private Connection con;

	public LoginDAO() {
		System.out.println("it me!");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("DRIVER LOADING.....");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/people?user=root&password=1234");
			System.out.println("Connection success!");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public LoginUser checkInfo(String id, String pw) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String SQL = "select id,AES_DECRYPT(UNHEX(password), ?),name,phone,email from member where id = ? AND password = HEX(AES_ENCRYPT(?,?));";
		System.out.println(SQL);
		String key = "1234";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, key);
			pstmt.setString(2, id); // ?에 들어갈 것
			pstmt.setString(3, pw);
			pstmt.setString(4, key);
			System.out.println("login : " + id + " " + pw);
			rs = pstmt.executeQuery();
			System.out.println("login!!");
			if (rs.next()) { // 결과가 있다면
				System.out.println("복호화 패스워드 : "+rs.getString(2));
				LoginUser user = new LoginUser(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
				return user; // 이미 존재하는 아이디
			} else {
				return null; // 가입 가능한 아이디
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("login fail!!");
		}
		return null;
	}

}
