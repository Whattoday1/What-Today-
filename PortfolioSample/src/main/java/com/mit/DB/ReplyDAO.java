package com.mit.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReplyDAO {
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
	public void insert(Reply s) { //Statement 생성
		open();
		String sql =
				"INSERT INTO replydata(reply_id, po_id, user_id, reply_contents, reply_date) " + "values(reply_seq.NEXTVAL,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			/* pstmt.setInt(1, s.getId()); */
			/*pstmt.setString(1, s.getReply_id()); reply_id는 시퀀스로 자동생성*/
			pstmt.setString(1, s.getPo_id());
			pstmt.setString(2, s.getUser_id());
			pstmt.setString(3, s.getReply_contents());
			pstmt.setDate(4, s.getReply_date());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	
	public void delete(Reply s) { //Statement 생성
		open();
		String sql =
				"DELETE FROM REPLYDATA WHERE REPLY_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			/* pstmt.setInt(1, s.getId()); */
			pstmt.setString(1, s.getReply_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	
	
	public List<Reply> getAll() {
		open();
		List<Reply> reply = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM REPLYDATA ORDER BY REPLY_DATE DESC, REPLY_ID DESC");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply s = new Reply();
				s.setReply_id(rs.getString("REPLY_ID"));
				s.setPo_id(rs.getString("PO_ID"));
				s.setUser_id(rs.getString("USER_ID"));
				s.setReply_contents(rs.getString("REPLY_CONTENTS"));
				s.setReply_date(rs.getDate("REPLY_DATE"));
				
				reply.add(s);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return reply;
	}
}
