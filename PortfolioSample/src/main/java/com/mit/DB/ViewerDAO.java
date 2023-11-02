package com.mit.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ViewerDAO {
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
	
	public List<Viewer> getAll() {
		open();
		List<Viewer> viewers = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("SELECT C.CONTENTS_ID, C.CONTENTS_NAME, COUNT(U.USER_GENDER) AS TOTAL_VIEWER, "
					+ "COUNT(DECODE(U.USER_GENDER,'F',1)) AS FCOUNT, "
					+ "COUNT(DECODE(U.USER_GENDER,'M',1)) AS MCOUNT, "
					+ "TRUNC(AVG(2023-EXTRACT(YEAR FROM U.USER_BIRTH))) AS AVG_AGE, "
					+ "COUNT(CASE WHEN 2023-EXTRACT(YEAR FROM U.USER_BIRTH)<20 AND 2023-EXTRACT(YEAR FROM U.USER_BIRTH)>=10 THEN 1 END) AS AGE10COUNT, "
					+ "COUNT(CASE WHEN 2023-EXTRACT(YEAR FROM U.USER_BIRTH)<30 AND 2023-EXTRACT(YEAR FROM U.USER_BIRTH)>=20 THEN 1 END) AS AGE20COUNT, "
					+ "COUNT(CASE WHEN 2023-EXTRACT(YEAR FROM U.USER_BIRTH)<40 AND 2023-EXTRACT(YEAR FROM U.USER_BIRTH)>=30 THEN 1 END) AS AGE30COUNT, "
					+ "COUNT(CASE WHEN 2023-EXTRACT(YEAR FROM U.USER_BIRTH)>=40 THEN 1 END) AS OVER40COUNT "
					+ "FROM CONTENTSDATA C, "
					+ "USERDATA U, REVIEWDATA R WHERE C.CONTENTS_ID = R.CONTENTS_ID AND U.USER_ID = R.USER_ID GROUP BY C.CONTENTS_ID, C.CONTENTS_NAME");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Viewer v = new Viewer();
				v.setContents_id(rs.getString("CONTENTS_ID"));
				v.setContents_name(rs.getString("CONTENTS_NAME"));
				v.setTotal_viewer(rs.getInt("TOTAL_VIEWER"));
				v.setFcount(rs.getInt("FCOUNT"));
				v.setMcount(rs.getInt("MCOUNT"));
				v.setAgeavg(rs.getInt("AVG_AGE"));
				v.setAge10count(rs.getInt("AGE10COUNT"));
				v.setAge20count(rs.getInt("AGE20COUNT"));
				v.setAge30count(rs.getInt("AGE30COUNT"));
				v.setOver40count(rs.getInt("OVER40COUNT"));
				
				viewers.add(v);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return viewers;
	}
}
