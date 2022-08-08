package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import vo.IndexCommentsVO;

public class IndexCommentsDAO {
	/*
	 * DAO 클래스는 단순히 DB연동만 담당하기 때문에 불필요하게 객체를 여러개 생성 할 필요가 없습니다. 그래서 싱글톤 패턴을 적용해서 객체를
	 * 1개만 생성되도록 만듭니다.
	 */
	// 1. 스스로 객체를 1개 생성합니다.
	private static IndexCommentsDAO instance = new IndexCommentsDAO();
	// 2. 외부에서 생성자를 호출할 수 없도록 생성자에 private제한을 붙임
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource ds;

	public IndexCommentsDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	public static IndexCommentsDAO getInstance() {
		return instance;
	}

	public ArrayList<IndexCommentsVO> selectComments(String desertionNo) {
		ArrayList<IndexCommentsVO> dataList = new ArrayList<IndexCommentsVO>();
		String sql = "SELECT * FROM throwsgg.indexcomments WHERE desertionNo = ?";
		ResultSet rs = null;
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, desertionNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				IndexCommentsVO vo = new IndexCommentsVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
						rs.getInt(5), rs.getInt(6), rs.getString(7),rs.getString(8));
				dataList.add(vo);
			}

		} catch (Exception e) {
			System.out.println("연결 실패!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					rs.close();
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dataList;

	}

	public void insertComments(String comments, String userID, String desertionNo) {
		String sql = "INSERT INTO throwsgg.indexcomments (comment, desertionNo, classNum, groupNum, sequence, userID) "
				+ "VALUES (?, ?, 0, 0, 0, ?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comments);
			pstmt.setString(2, desertionNo);
			pstmt.setString(3, userID);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("연결 실패!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void deleteComments(int indexComments) {
		String sql = "DELETE FROM throwsgg.indexcomments WHERE (indexComments = ?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, indexComments);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("연결 실패!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void ModifyComments(String comments, String indexComments) {
		String sql = "UPDATE throwsgg.indexcomments SET comment = ? WHERE (indexComments = ?)";
		try {
			// conn 생성
			conn = ds.getConnection();
			// pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comments);
			pstmt.setInt(2, Integer.parseInt(indexComments));
			pstmt.executeUpdate();
			System.out.println("indexComments 수정 완료");
		} catch (Exception e) {
			System.out.println("연결 실패!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
