package com.mit.DB;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mit.dao.MemberDAO;
import com.mit.dto.MemberVO;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/memberUpdate.do")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberUpdateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = mDao.getMember(user_id);
		request.setAttribute("mVo", mVo);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/WEB-INF/memberUpdate.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 깨짐을 방지
		// 폼에서 입력한 회원 정보 얻어오기
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String user_nickname = request.getParameter("user_nickname");
		String user_pw = request.getParameter("user_pw");
		String user_gender = request.getParameter("user_gender");
		
		/*Date user_birth = request.getParameter("user_birth");*/
		String user_birthStr = request.getParameter("user_birth");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date user_birthUtil = null;
		try {
		    user_birthUtil = dateFormat.parse(user_birthStr);
		} catch (ParseException e) {
		    e.printStackTrace(); // 날짜 파싱 오류 처리
		}		
		
	
		String user_mail = request.getParameter("user_mail");
		String user_image = request.getParameter("user_image");
		String user_mailing = request.getParameter("user_mailing");
		
		// 회원 정보를 저장할 객체 생성
		MemberVO mVo = new MemberVO();
		mVo.setUser_id(user_id);
		mVo.setUser_name(user_name);
		mVo.setUser_nickname(user_nickname);
		mVo.setUser_pw(user_pw);
		mVo.setUser_gender(user_gender);
		
		java.sql.Date user_birth = new java.sql.Date(user_birthUtil.getTime());
		mVo.setUser_birth(user_birth); 
		
		mVo.setUser_mail(user_mail);
		mVo.setUser_image(user_image);
		mVo.setUser_mailing(user_mailing);
		
		
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.updateMember(mVo);
		response.sendRedirect("login.do");
	}

}
