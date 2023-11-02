package com.mit.DB;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentController
 */
@WebServlet("/main.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	PostDAO dao;
	UserDAO dao2;
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new PostDAO();
		dao2 = new UserDAO();
	}
	
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String view = "";
		
		if(action == null) {
			getServletContext().getRequestDispatcher("/main.do?action=list").forward(request, response);
		} else {
			switch(action) {
			case "list": view = list(request, response);break;
			}
			getServletContext().getRequestDispatcher("/"+view).forward(request, response);
		}
	}
	
	public String list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("post", dao.getAll());
		request.setAttribute("users", dao2.getAll());
		return "./WEB-INF/index.jsp";
	}
}