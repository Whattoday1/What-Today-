package com.mit.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
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
	
	public List<User> getAll() {
		open();
		List<User> users = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("select * from userdata order by 1");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				User s = new User();
				s.setUser_id(rs.getString("user_id"));
				s.setUser_name(rs.getString("user_name"));
				s.setUser_nickname(rs.getString("user_nickname"));
				s.setUser_pw(rs.getString("user_pw"));
				s.setUser_gender(rs.getString("user_gender"));
				s.setUser_birth(rs.getDate("user_birth"));
				s.setUser_mail(rs.getString("user_mail"));
				s.setUser_image(rs.getString("user_image"));
				s.setUser_mailing(rs.getString("user_mailing"));
				
				
				users.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return users;
	}
}
