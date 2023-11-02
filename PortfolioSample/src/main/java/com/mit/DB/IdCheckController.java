package com.mit.DB;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mit.dao.MemberDAO;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/idCheck.do")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.confirmID(user_id);
		request.setAttribute("user_id", user_id);
		request.setAttribute("result", result);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/WEB-INF/idCheck.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
