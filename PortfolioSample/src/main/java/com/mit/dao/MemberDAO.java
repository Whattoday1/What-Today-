package com.mit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mit.dto.MemberVO;

public class MemberDAO {
	private MemberDAO() {
	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/xe");
		conn = ds.getConnection();
		return conn;
	}

	// 사용자 인증시 사용하는 메소드
	public int userCheck(String user_id, String user_pw) {
		int result = -1;
		String sql = "select user_pw from userdata where user_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("user_pw") != null
						&& rs.getString("user_pw").equals(user_pw)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	// 아이디로 회원 정보 가져오는 메소드
	public MemberVO getMember(String user_id) {
		MemberVO mVo = null;
		String sql = "select * from userdata where user_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mVo = new MemberVO();
				mVo.setUser_id(rs.getString("user_id"));
				mVo.setUser_name(rs.getString("user_name"));
				mVo.setUser_nickname(rs.getString("user_nickname"));
				mVo.setUser_pw(rs.getString("user_pw"));
				mVo.setUser_gender(rs.getString("user_gender"));
				mVo.setUser_birth(rs.getDate("user_birth"));
				mVo.setUser_mail(rs.getString("user_mail"));
				mVo.setUser_image(rs.getString("user_image"));
				mVo.setUser_mailing(rs.getString("user_mailing"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return mVo;
	}
//아이디 중복체크구간
	public int confirmID(String user_id) {
		int result = -1;
		String sql = "SELECT USER_ID FROM USERDATA WHERE USER_ID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public int insertMember(MemberVO mVo) {
		int result = -1;
		String sql = "INSERT INTO USERDATA VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getUser_id());
			pstmt.setString(2, mVo.getUser_name());
			pstmt.setString(3, mVo.getUser_nickname());
			pstmt.setString(4, mVo.getUser_pw());
			pstmt.setString(5, mVo.getUser_gender());
			pstmt.setDate(6, mVo.getUser_birth());
			pstmt.setString(7, mVo.getUser_mail());
			pstmt.setString(8, mVo.getUser_image());
			pstmt.setString(9, mVo.getUser_mailing());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public int updateMember(MemberVO mVo) {
		int result = -1;
		String sql = "update userdata set user_id=?, user_name=?, user_nickname=?,"
				+ "user_pw=?, user_gender=?, user_birth=?, user_mail=?, user_image=?, user_mailing=? where user_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getUser_id());
			pstmt.setString(2, mVo.getUser_name());
			pstmt.setString(3, mVo.getUser_nickname());
			pstmt.setString(4, mVo.getUser_pw());
			pstmt.setString(5, mVo.getUser_gender());
			pstmt.setDate(6, mVo.getUser_birth());
			pstmt.setString(7, mVo.getUser_mail());
			pstmt.setString(8, mVo.getUser_image());
			pstmt.setString(9, mVo.getUser_mailing());
			pstmt.setString(10, mVo.getUser_id());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
