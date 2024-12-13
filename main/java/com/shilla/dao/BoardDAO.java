package com.shilla.dao;
/* BoardDAO */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.shilla.dto.BoardDTO;

public class BoardDAO {
	// 싱글톤 인스턴스
	private static BoardDAO instance = new BoardDAO();
	private BoardDAO() {}
	public static BoardDAO getInstance() {
		return instance;
	}
	
	// DB연결 관련 전역변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// DB 연결
	private void dbConn() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context)initctx.lookup("java:comp/env");
			DataSource ds = (DataSource)envctx.lookup("jdbc/pool");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 자원반납 3개(ResultSet, PreparedStatement, Connection)
	private static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if(rs != null) {
			try {
				rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	// 자원반납 2개(PreparedStatement, Connection)
	private static void close(PreparedStatement pstmt, Connection conn) {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	// 게시판 검색 기능
	public ArrayList<BoardDTO> searchBoard(String searchField, String searchText){
		ArrayList<BoardDTO> searchlist = new ArrayList<BoardDTO>();
		dbConn();
		try {
			String sql = "select * from shilla_board where "+searchField.trim();
			if(searchText != null && !searchText.equals("")) {
				sql += " LIKE '%"+searchText.trim()+"%' order by num desc";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO bean = new BoardDTO();
				bean.setNum(rs.getInt("num"));
				bean.setBrand(rs.getInt("brand"));
				bean.setCategory(rs.getString("category"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone"));
				bean.setBoard_id(rs.getString("board_id"));
				bean.setRegdate(rs.getDate("regdate"));
				bean.setReply(rs.getString("reply"));
				
				searchlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return searchlist;
	}
	
	   //getBoardList 15개
	   public ArrayList<BoardDTO> getBoardList_1_a(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=1 and category='a' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_1_b(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=1 and category='b' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_1_c(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=1 and category='c' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_1_d(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=1 and category='d' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_2_a(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=2 and category='a' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_2_b(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=2 and category='b' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_2_d(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=2 and category='d' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_2_e(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=2 and category='e' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }   
	   public ArrayList<BoardDTO> getBoardList_3_a(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=3 and category='a' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_3_b(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=3 and category='b' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }   
	   public ArrayList<BoardDTO> getBoardList_3_e(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=3 and category='e' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_3_f(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=3 and category='f' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_4_a(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=4 and category='a' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_4_b(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=4 and category='b' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }
	   public ArrayList<BoardDTO> getBoardList_4_f(){
	      ArrayList<BoardDTO> blist = new ArrayList<BoardDTO>();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where brand=4 and category='f' order by num desc";
	         pstmt = conn.prepareStatement(sql);   
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	            BoardDTO bvo = new BoardDTO();
	            bvo.setNum(rs.getInt("num"));
	            bvo.setBrand(rs.getInt("brand"));
	            bvo.setCategory(rs.getString("category"));
	            bvo.setTitle(rs.getString("title"));
	            bvo.setContent(rs.getString("content"));
	            
	            bvo.setName(rs.getString("name"));
	            bvo.setEmail(rs.getString("email"));
	            bvo.setPhone(rs.getString("phone"));
	            bvo.setBoard_id(rs.getString("board_id"));
	            bvo.setRegdate(rs.getDate("regdate"));
	            bvo.setReply(rs.getString("reply"));
	            
	            blist.add(bvo);
	         }
	         close(rs, pstmt, conn);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return blist;
	   }

	// 새글 추가메소드
	   public int addBoard(BoardDTO bean) {
		  int num=0;
	      dbConn();
	      try {
	         String sql = "insert into shilla_board values((select DISTINCT to_number(to_char(sysdate, 'yyyymmdd')) Converted from shilla_board) + shilla_board_seq.nextval,?,?,?,?,?,?,?,?, default, default)";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, bean.getBrand());
	         pstmt.setString(2, bean.getCategory());
	         pstmt.setString(3, bean.getTitle());
	         pstmt.setString(4, bean.getContent());
	         pstmt.setString(5, bean.getName());
	         pstmt.setString(6, bean.getEmail());
	         pstmt.setString(7, bean.getPhone());
	         pstmt.setString(8, bean.getBoard_id());
	         
	         pstmt.executeUpdate();
	         
	         sql = "select max(num) from shilla_board where board_id = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, bean.getBoard_id());
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 num = rs.getInt(1);
	         }
	         
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();// TODO: handle exception
	      }finally {
	         close(pstmt, conn);
	      }
	      return num;
	   }
	   
	   
	   // 하나의 글 가져오기
	   public BoardDTO getOneBoard(int num) {
	      BoardDTO bean = new BoardDTO();
	      dbConn();
	      try {
	         String sql = "select * from shilla_board where num = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, num);         
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            bean.setNum(rs.getInt(1));
	            bean.setBrand(rs.getInt(2));
	            bean.setCategory(rs.getString(3));
	            bean.setTitle(rs.getString(4));
	            bean.setContent(rs.getString(5));
	            bean.setName(rs.getString(6));
	            bean.setEmail(rs.getString(7));
	            bean.setPhone(rs.getString(8));
	            bean.setBoard_id(rs.getString(9));
	            bean.setRegdate(rs.getDate(10));
	            bean.setReply(rs.getString(11));            
	         }                  
	      }catch (Exception e) {
	         e.printStackTrace();// TODO: handle exception
	      }finally {
	         close(rs, pstmt, conn);
	      }
	      return bean;
	   }
	   
	   
	   // 업데이트 메소드
	   public void updateBoard(BoardDTO bean) {
	      dbConn();
	      try {
	         String sql = "update shilla_board set brand = ?, category = ?, title = ?, content = ? where num = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, bean.getBrand());
	         pstmt.setString(2, bean.getCategory());
	         pstmt.setString(3, bean.getTitle());
	         pstmt.setString(4, bean.getContent());         
	         pstmt.setInt(5, bean.getNum());
	         
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();// TODO: handle exception
	      }finally {
	         close(pstmt, conn);
	      }
	   }
	   
	   
	   // 글삭제 메소드
	   public void deleteBoard(int num) {
	      dbConn();
	      try {
	         String sql = "delete from shilla_board where num = ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();// TODO: handle exception
	      }finally {
	         close(pstmt, conn);
	      }
	   }
	   
	   // search id 메서드
	   public ArrayList<BoardDTO> idSearch(String user_id){
		   ArrayList<BoardDTO> abean = new ArrayList<BoardDTO>();
		   dbConn();
		   try {
			String sql = "select * from shilla_board where board_id=? order by num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO bean = new BoardDTO();
				bean.setNum(rs.getInt(1));
	            bean.setBrand(rs.getInt(2));
	            bean.setCategory(rs.getString(3));
	            bean.setTitle(rs.getString(4));
	            bean.setContent(rs.getString(5));
	            bean.setName(rs.getString(6));
	            bean.setEmail(rs.getString(7));
	            bean.setPhone(rs.getString(8));
	            bean.setBoard_id(rs.getString(9));
	            bean.setRegdate(rs.getDate(10));
	            bean.setReply(rs.getString(11));  
	            
	            abean.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			close(rs, pstmt, conn);
		}
		   return abean;
	   }
	   
	   
}	
