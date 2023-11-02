package com.mit.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WishDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	
			//DB 연결
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String JDB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	
	public void open() {
		try{ 
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDB_URL, "pjt_user", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			pstmt.close();
			conn.close(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//찜목록 입력기능 
	public void insert(Wish s) { //Statement 생성
		open();
		String sql =
				"INSERT INTO wishlistdata(wish_id, contents_id, user_id) " + "values(wish_seq.NEXTVAL,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			/* pstmt.setInt(1, s.getId()); */
			/*pstmt.setString(1, s.getWish_id());wish_id는 시퀀스로 자동생성* */
			pstmt.setString(1, s.getContents_id());
			pstmt.setString(2, s.getUser_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	
	//찜목록 삭제기능 
	public void delete(Wish s) { //Statement 생성
		open();
		String sql =
				"DELETE FROM WISHLISTDATA WHERE WISH_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			/* pstmt.setInt(1, s.getId()); */
			pstmt.setString(1, s.getWish_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	
	
	
	
	public List<Wish> getAll() {
		open();
		List<Wish> wish = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("SELECT W.WISH_ID, C.CONTENTS_ID, C.CONTENTS_NAME, C.CONTENTS_IMG, C.CONTENTS_DAY1, C.CONTENTS_DAY2, W.USER_ID\r\n"
					+ "FROM WISHLISTDATA W, CONTENTSDATA C \r\n"
					+ "WHERE W.CONTENTS_ID = C.CONTENTS_ID");
			ResultSet rs = pstmt.executeQuery();//SELECT * FROM WISHLISTDATA ORDER BY WISH_ID DESC
			
			while(rs.next()) {
				Wish s = new Wish();
				s.setWish_id(rs.getString("WISH_ID"));
				s.setContents_id(rs.getString("CONTENTS_ID"));
				s.setUser_id(rs.getString("USER_ID"));
				s.setContents_name(rs.getString("CONTENTS_NAME"));
				s.setContents_img(rs.getString("CONTENTS_IMG"));
				s.setContents_day1(rs.getDate("CONTENTS_DAY1"));
				s.setContents_day2(rs.getDate("CONTENTS_DAY2"));
								
				wish.add(s);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return wish;
	}
}
