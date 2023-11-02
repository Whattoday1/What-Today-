package com.mit.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReplyImageDAO {
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
	
	public void close() {			// 연결 해제
		try {
			pstmt.close();
			conn.close(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insert(User s) { //Statement 생성
		open();
		String sql =
				"INSERT INTO userdata(user_id, user_name, user_nickname, user_pw, user_gender, user_birth, user_mail, user_image, user_mailing) " + "values(?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			/* pstmt.setInt(1, s.getId()); */
			pstmt.setString(1, s.getUser_id());
			pstmt.setString(2, s.getUser_name());
			pstmt.setString(3, s.getUser_nickname());
			pstmt.setString(4, s.getUser_pw());
			pstmt.setString(5, s.getUser_gender());
			pstmt.setDate(6, s.getUser_birth());
			pstmt.setString(7, s.getUser_mail());
			pstmt.setString(8, s.getUser_image());
			pstmt.setString(9, s.getUser_mailing());
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public List<ReplyImage> getAll() {
		open();
		List<ReplyImage> replyimages = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("select r.reply_id, r.user_id, u.user_image"
					+ " from userdata u, replydata"
					+ " where u.user_id = r.user_id;");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyImage s = new ReplyImage();
				s.setReply_id(rs.getString("reply_id"));
				s.setUser_id(rs.getString("user_id"));
				s.setUser_image(rs.getString("user_image"));
				
				replyimages.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return replyimages;
	}
}
