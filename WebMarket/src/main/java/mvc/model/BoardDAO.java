package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {
	//싱글톤
	private static BoardDAO instance;
	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}	
	//board 테이블의 레코드 개수
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		String sql;
		
		if (items == null && text == null)
			sql = "select  count(*) from board";//검색하지 않거나, 전체검색
		else
			sql = "select  count(*) FROM board where " + items + " like '%" + text + "%'";
		
		System.out.println("sql:"+sql);
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				x = rs.getInt(1);
			
		} catch (Exception ex) {
			System.out.println("getListCount() 에러: " + ex);
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
	//board 테이블의 레코드 가져오기
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total_record = getListCount(items, text );
		int start = (page - 1) * limit;//현재페이지의 글번호
		int index = start + 1;//현제페이지의 인덱스 번호

		String sql;

		if (items == null && text == null)
			sql = "select * from board ORDER BY num DESC";
		else
			sql = "SELECT  * FROM board where " + items + " like '%" + text + "%' ORDER BY num DESC ";

		System.out.println("sql:"+sql);
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql,  
					ResultSet.TYPE_SCROLL_INSENSITIVE,
				    ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery();

			while (rs.absolute(index)) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				list.add(board);

				if (index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList() 에러 : " + ex);
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
	//member 테이블에서 인증된 id의 사용자명 가져오기
	public String getLoginNameById(String id) {
		 Connection conn=null;
		 PreparedStatement pstmt =null;
		 ResultSet rs=null;
		 String name=null;
		 String sql = "select * from member where id=?";
		 try {
			  conn = DBConnection.getConnection();
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, id);
			  rs = pstmt.executeQuery();
				if (rs.next()) 
					name = rs.getString("name");
			 return name;
		 }catch(Exception ex) {
			 System.out.println("getBoardByNum() 에러 : " + ex);
			 ex.printStackTrace();
		 }
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
		return null;
	}
	
	//board 테이블에 새로운 글 삽입하기
	public void insertBoard(BoardDTO board) {
		 Connection conn=null;
		 PreparedStatement pstmt =null;

		 String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?)";
		 try {
			  conn = DBConnection.getConnection();
			  pstmt = conn.prepareStatement(sql);
			  int index=1;
			  pstmt.setInt(index++, board.getNum());
			  pstmt.setString(index++, board.getId());
			  pstmt.setString(index++, board.getName());
			  pstmt.setString(index++, board.getSubject());
			  pstmt.setString(index++, board.getContent());
			  pstmt.setString(index++, board.getRegist_day());
			  pstmt.setInt(index++, board.getHit());
			  pstmt.setString(index++, board.getIp());
			  pstmt.executeUpdate();
				
		 }catch(Exception ex) {
			 System.out.println("insertBoard() 에러 : " + ex);
			 ex.printStackTrace();
		 }
	}
	//선택된 글 상세 내용 가져오기
	public BoardDTO getBoardByNum(int num, int pageNum) {
		//조회수 증가
		updateHit(num);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from board where num=?";
//board객체 얻기
		BoardDTO board = new BoardDTO();
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql,  
					ResultSet.TYPE_SCROLL_INSENSITIVE,
				    ResultSet.CONCUR_READ_ONLY);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
			}
			return board;
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 에러 : " + ex);
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
	
	//선택된 글의 조회수 증가하기
	public void updateHit(int num) {
		 Connection conn=null;
		 PreparedStatement pstmt =null;

		 String sql = "update board set hit=hit+1 where num=?";
		 try {
			  conn = DBConnection.getConnection();
			  pstmt = conn.prepareStatement(sql);
			 
			  pstmt.setInt(1, num);
			  pstmt.executeUpdate();
		 }catch(Exception ex) {
			 System.out.println("insertBoard() 에러 : " + ex);
			 ex.printStackTrace();
		 }
	}
	
	//선택된 글 내용 수정하기 - 수동 커밋처러
	public void updateBoard(BoardDTO board) {
		 Connection conn=null;
		 PreparedStatement pstmt =null;

		 String sql = "update board set name=?,subject=?,content=? where num=?";
		 
		 try {
			 conn = DBConnection.getConnection();
			  pstmt = conn.prepareStatement(sql);
			  
			  //자동커밋 비활성화
			  conn.setAutoCommit(false);
			 
			  pstmt.setString(1, board.getName());
			  pstmt.setString(2, board.getSubject());
			  pstmt.setString(3,board.getContent() );
			  pstmt.setInt(4, board.getNum());
			  
			  pstmt.executeUpdate();
			  //수동 커밋 - db저장
			  conn.commit();
		 }catch(Exception ex) {
			 System.out.println("insertBoard() 에러 : " + ex);
			 ex.printStackTrace();
			 try {
				conn.rollback();//오류시 rollback;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		 }finally {
			 try {
				conn.setAutoCommit(true);
			 } catch (SQLException e) {
				e.printStackTrace();
			 }
		 }
	}
	
	//글삭제
  public void deleteBoard(int num){
	 Connection conn=null;
	 PreparedStatement pstmt =null;

	  String sql = "delete from board where num=?";
	  try {
			  conn = DBConnection.getConnection();
			  pstmt = conn.prepareStatement(sql);
			 
			  pstmt.setInt(1, num);
			  pstmt.executeUpdate();
		 }catch(Exception ex) {
			 System.out.println("deleteBoard() 에러 : " + ex);
			 ex.printStackTrace();
		 }
	}
}
