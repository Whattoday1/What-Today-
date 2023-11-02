package com.mit.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContentsDAO {
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
	
	public List<Contents> getAll() {
		open();
		List<Contents> contents = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("SELECT CONTENTS_ID, CONTENTS_NAME, CONTENTS_TYPE, CONTENTS_SCORE, CONTENTS_GENRE, CONTENTS_RT, CONTENTS_DESC, CONTENTS_TICKET, CONTENTS_LOCATION, CONTENTS_IMG, TO_CHAR(CONTENTS_DAY1,'YYYY-MM-DD') AS CONTENTS_DAY1, TO_CHAR(CONTENTS_DAY2,'YYYY-MM-DD') AS CONTENTS_DAY2  FROM CONTENTSDATA ORDER BY CONTENTS_ID");
			ResultSet rs = pstmt.executeQuery();
			//수정된 부분 있음. (Contents c 말고 s 였음.)
			while(rs.next()) {
				Contents c = new Contents();
				c.setContents_id(rs.getString("CONTENTS_ID"));
				c.setContents_name(rs.getString("CONTENTS_NAME"));
				c.setContents_type(rs.getString("CONTENTS_TYPE"));
				c.setContents_day1(rs.getString("CONTENTS_DAY1"));
				c.setContents_day2(rs.getString("CONTENTS_DAY2"));
				c.setContents_score(rs.getFloat("CONTENTS_SCORE"));
				c.setContents_genre(rs.getString("CONTENTS_GENRE"));
				c.setContents_rt(rs.getString("CONTENTS_RT"));
				c.setContents_desc(rs.getString("CONTENTS_DESC"));
				c.setContents_ticket(rs.getString("CONTENTS_TICKET"));
				c.setContents_location(rs.getString("CONTENTS_LOCATION"));
				c.setContents_img(rs.getString("CONTENTS_IMG"));
				
				contents.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return contents;
	}
}
