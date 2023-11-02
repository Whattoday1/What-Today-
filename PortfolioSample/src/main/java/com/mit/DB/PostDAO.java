package com.mit.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
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
	public void insert(Post s) { //Statement 생성
		open();
		String sql =
				"INSERT INTO postdata(po_id, user_id, po_category, po_title, po_contents, po_date, po_rec, po_file, po_count) " + "values(po_seq.NEXTVAL,?,?,?,?,?,?,?,?)";
		/*+ "values(?,?,?,?,?,?,?,?,?)" po_id는 시퀀스로 자동생성*/
		try {
			pstmt = conn.prepareStatement(sql);
			/* pstmt.setString(1, s.getPo_id());*/
			pstmt.setString(1, s.getUser_id());
			pstmt.setString(2, s.getPo_category());
			pstmt.setString(3, s.getPo_title());
			pstmt.setString(4, s.getPo_contents());	
			pstmt.setDate(5, s.getPo_date());			
			pstmt.setInt(6, s.getPo_rec());
			pstmt.setString(7, s.getPo_file());
			pstmt.setInt(8, s.getPo_count());			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	
	public void delete(Post s) { //Statement 생성
		open();
		String sql =
				"DELETE FROM POSTDATA WHERE PO_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			/* pstmt.setInt(1, s.getId()); */
			pstmt.setString(1, s.getPo_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	
	
	public List<Post> getAll() {
		open();
		List<Post> post = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM POSTDATA ORDER BY PO_DATE DESC, PO_ID DESC");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Post s = new Post();
				s.setPo_id(rs.getString("PO_ID"));
				s.setUser_id(rs.getString("USER_ID"));
				s.setPo_category(rs.getString("PO_CATEGORY"));
				s.setPo_title(rs.getString("PO_TITLE"));
				s.setPo_contents(rs.getString("PO_CONTENTS"));
				s.setPo_date(rs.getDate("PO_DATE"));
				s.setPo_rec(rs.getInt("PO_REC"));
				s.setPo_file(rs.getString("PO_FILE"));
				s.setPo_count(rs.getInt("PO_COUNT"));
				
				post.add(s);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return post;
	}
}
