package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberInsertDAO {
	private Connection con;
	
	public MemberInsertDAO() {
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
	
	public boolean insertMember(String name, String phone, String email, String id, String pw) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String SQL = "INSERT INTO member (name,phone,email,id,password) "
				+"values (?,?,?,?,?)";
		System.out.println(SQL);
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, name);	//?에 들어갈 것
			pstmt.setString(2, phone);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			pstmt.setString(5, pw);
			System.out.println("insert : "+name+" "+phone+" "+email+" "+id+" "+pw);
			pstmt.executeUpdate();
			System.out.println("insert!!");
		
		return true;
	}catch(Exception e) {
		System.out.println("insert fail!!");
	}
		return true;
}
}
