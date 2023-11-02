package com.mit.DB;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

/**
 * Servlet implementation class StudentController
 */
@WebServlet("/reviewController")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ReviewDAO dao;
	ContentsDAO dao2;
	ViewerDAO dao3;
	UserDAO dao4;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new ReviewDAO();
		dao2 = new ContentsDAO();
		dao3 = new ViewerDAO();
		dao4 = new UserDAO();
	}
	
    public ReviewController() {
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
			getServletContext().getRequestDispatcher("/reviewController?action=list").forward(request, response);
		} else {
			switch(action) {
			case "list": view = list(request, response);break;
			case "insert": view = insert(request, response);break;
			}
			getServletContext().getRequestDispatcher("/"+view).forward(request, response);
		}
	}
	
	public String list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("review", dao.getAll());
		request.setAttribute("contents", dao2.getAll());
		request.setAttribute("viewers", dao3.getAll());
		request.setAttribute("users", dao4.getAll());
		
		return "/WEB-INF/contents_page.jsp";
	}
	
	
	
	//입력란
	public String insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Review s = new Review();
		try {
			BeanUtils.populate(s, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
		dao.insert(s);
		/* return "DB/contents_page.jsp"; */
		
		return list(request, response);
	}
	
	
}