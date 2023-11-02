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
@WebServlet("/sub.do")
public class SubController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	PostDAO dao;
	UserDAO dao2;
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new PostDAO();
		dao2 = new UserDAO();
	}
	
    public SubController() {
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
			getServletContext().getRequestDispatcher("/main.do?action=event").forward(request, response);
		} else {
			switch(action) {
			case "event": view = event(request, response);break;
			case "gg": view = gg(request, response);break;
			case "gg1": view = gg1(request, response);break;
			case "gg2": view = gg2(request, response);break;
			case "gg3": view = gg3(request, response);break;
			}
			getServletContext().getRequestDispatcher("/"+view).forward(request, response);
		}
	}
	
	public String event(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("post", dao.getAll());
		request.setAttribute("users", dao2.getAll());
		return "./WEB-INF/event.jsp";
	}
	
	public String gg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("post", dao.getAll());
		request.setAttribute("users", dao2.getAll());
		return "./WEB-INF/gg.jsp";
	}
	
	public String gg1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("post", dao.getAll());
		request.setAttribute("users", dao2.getAll());
		return "./WEB-INF/gg1.jsp";
	}
	
	public String gg2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("post", dao.getAll());
		request.setAttribute("users", dao2.getAll());
		return "./WEB-INF/gg2.jsp";
	}
	
	public String gg3(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("post", dao.getAll());
		request.setAttribute("users", dao2.getAll());
		return "./WEB-INF/gg3.jsp";
	}
}