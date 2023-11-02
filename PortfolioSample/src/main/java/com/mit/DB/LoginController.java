package com.mit.DB;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mit.dao.MemberDAO;
import com.mit.dto.MemberVO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	PostDAO dao;
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new PostDAO();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url = "/WEB-INF/login.jsp";
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") != null) {// 이미 로그인 된 사용자이면
			url = "/WEB-INF/redirect.jsp"; // 메인 페이지로 이동한다.
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url = "/WEB-INF/login.jsp";
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.userCheck(user_id, user_pw);
		if (result == 1) {
			MemberVO mVo = mDao.getMember(user_id);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mVo);
			request.setAttribute("message", "회원 가입에 성공했습니다.");
			url = "/WEB-INF/redirect.jsp";
		} else if (result == 0) {
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
		} else if (result == -1) {
			request.setAttribute("message", "존재하지 않는 회원입니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
}
