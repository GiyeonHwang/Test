package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {

   private static BoardDAO instance;
   private Connection conn;
   private PreparedStatement pstmt;
   private DataSource ds;

   private BoardDAO() {
      try {
         Context init = new InitialContext();
         ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
      } catch (NamingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

   public static BoardDAO getInstance() {
      if (instance == null)
         instance = new BoardDAO();
      return instance;
   }

   // board    ̺       ڵ      
   public int getListCount(String items, String text) {
      ResultSet rs = null;

      int x = 0;

      String sql;

      if (items == null && text == null)
         sql = "select  count(*) from board";
      else
         sql = "SELECT   count(*) FROM board where " + items + " like '%" + text + "%'";

      try {
         // conn 생성
         conn = ds.getConnection();
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();

         if (rs.next())
            x = rs.getInt(1);

      } catch (Exception ex) {
         System.out.println("getListCount()     : " + ex);
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
         }
      }
      return x;
   }

   // board    ̺       ڵ          
   public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
      ResultSet rs = null;

      int total_record = getListCount(items, text);
      int start = (page - 1) * limit;
      int index = start + 1;
      System.out.println(index);
      String sql;

      if (items == null && text == null)
         sql = "select * from throwsgg.board ORDER BY num DESC";
      else
         sql = "SELECT  * FROM board where " + items + " like '%" + text + "%' ORDER BY num DESC ";

      ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

      try {
         // conn 생성
         conn = ds.getConnection();
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         int i = 0;
         while (rs.next()) {
            if (i >= index-1) {
               BoardDTO board = new BoardDTO();
               board.setNum(rs.getInt("num"));
               board.setId(rs.getString("id"));
               board.setName(rs.getString("name"));
               board.setSubject(rs.getString("subject"));
               board.setContent(rs.getString("content"));
               board.setRegist_day(rs.getString("regist_day"));
               board.setHit(rs.getInt("hit"));
//               System.out.println(board.toString());
               list.add(board);

               if (index < (start + limit) && index <= total_record)
                  index++;
               else
                  break;
            }
            i++;
         }
         System.out.println(i);
         System.out.println("리스트 사이즈"+list.size());
         return list;
      } catch (Exception ex) {
         System.out.println("getBoardList()      : " + ex);
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
         }
      }
      return null;
   }

   // userinfo    ̺           id       ڸ          
   public String getLoginNameById(String id) {
      ResultSet rs = null;
      String name = null;
      String sql = "select * from member where id = ? ";

      try {
         // conn 생성
         conn = ds.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();

         if (rs.next())
            name = rs.getString("name");

         return name;
      } catch (Exception ex) {
         System.out.println("getBoardByNum()      : " + ex);
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
         }
      }
      return null;
   }

   // board    ̺     ο             
   public void insertBoard(BoardDTO board) {
      try {
         conn = ds.getConnection();

         String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?)";

         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, board.getNum());
         pstmt.setString(2, board.getId());
         pstmt.setString(3, board.getName());
         pstmt.setString(4, board.getSubject());
         pstmt.setString(5, board.getContent());
         pstmt.setString(6, board.getRegist_day());
         pstmt.setInt(7, board.getHit());

         pstmt.executeUpdate();
      } catch (Exception ex) {
         System.out.println("insertBoard()      : " + ex);
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
         }
      }
   }

   //    õ         ȸ        ϱ 
   public void updateHit(int num) {
      ResultSet rs = null;

      try {
         conn = ds.getConnection();

         String sql = "select hit from board where num = ? ";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery();
         int hit = 0;

         if (rs.next())
            hit = rs.getInt("hit") + 1;

         sql = "update board set hit=? where num=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, hit);
         pstmt.setInt(2, num);
         pstmt.executeUpdate();
      } catch (Exception ex) {
         System.out.println("updateHit()      : " + ex);
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
         }
      }
   }

   //    õ                     
   public BoardDTO getBoardByNum(int num, int page) {
      ResultSet rs = null;
      BoardDTO board = null;

      updateHit(num);
      String sql = "select * from board where num = ? ";

      try {
         conn = ds.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            board = new BoardDTO();
            board.setNum(rs.getInt("num"));
            board.setId(rs.getString("id"));
            board.setName(rs.getString("name"));
            board.setSubject(rs.getString("subject"));
            board.setContent(rs.getString("content"));
            board.setRegist_day(rs.getString("regist_day"));
            board.setHit(rs.getInt("hit"));
         }

         return board;
      } catch (Exception ex) {
         System.out.println("getBoardByNum()      : " + ex);
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
         }
      }
      return null;
   }

   //    õ               ϱ 
   public void updateBoard(BoardDTO board) {

      try {
         String sql = "update board set name=?, subject=?, content=? where num=?";

         conn = ds.getConnection();
         pstmt = conn.prepareStatement(sql);

         conn.setAutoCommit(false);

         pstmt.setString(1, board.getName());
         pstmt.setString(2, board.getSubject());
         pstmt.setString(3, board.getContent());
         pstmt.setInt(4, board.getNum());

         pstmt.executeUpdate();
         conn.commit();

      } catch (Exception ex) {
         System.out.println("updateBoard()      : " + ex);
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
         }
      }
   }

   //    õ          ϱ 
   public void deleteBoard(int num) {

      String sql = "delete from board where num=?";

      try {
         conn = ds.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         pstmt.executeUpdate();

      } catch (Exception ex) {
         System.out.println("deleteBoard()      : " + ex);
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
         }
      }
   }
}