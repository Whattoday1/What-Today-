package com.mit.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
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
	
	
	//리뷰 입력기능 
	public void insert(Review s) { //Statement 생성
		open();
		String sql =
				"INSERT INTO reviewdata(review_id, contents_id, user_id, review_contents, review_score, review_rec, review_date) " + "values(review_seq.NEXTVAL,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			/* pstmt.setInt(1, s.getId()); */
			/*pstmt.setString(1, s.getReview_id());*/
			pstmt.setString(1, s.getContents_id());
			pstmt.setString(2, s.getUser_id());
			pstmt.setString(3, s.getReview_contents());
			pstmt.setInt(4, s.getReview_score());
			pstmt.setInt(5, s.getReview_rec());	
			pstmt.setDate(6, s.getReview_date());			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	
	
	
	
	
	public List<Review> getAll() {
		open();
		List<Review> review = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM REVIEWDATA ORDER BY REVIEW_DATE DESC, REVIEW_ID DESC");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review s = new Review();
				s.setReview_id(rs.getString("REVIEW_ID"));
				s.setContents_id(rs.getString("CONTENTS_ID"));
				s.setUser_id(rs.getString("USER_ID"));
				s.setReview_contents(rs.getString("REVIEW_CONTENTS"));
				s.setReview_score(rs.getInt("REVIEW_SCORE"));
				s.setReview_rec(rs.getInt("REVIEW_REC"));
				s.setReview_date(rs.getDate("REVIEW_DATE"));
				
				review.add(s);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return review;
	}
}
