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
@WebServlet("/postController4")
public class PostController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	PostDAO dao;
	UserDAO dao2;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new PostDAO();
		dao2 = new UserDAO();
	}
	
    public PostController4() {
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
			getServletContext().getRequestDispatcher("/postController4?action=list").forward(request, response);
		} else {
			switch(action) {
			case "list": view = list(request, response);break;
			case "insert": view = insert(request, response);break;
			}
			getServletContext().getRequestDispatcher("/"+view).forward(request, response);
		}
	}

	public String list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("post", dao.getAll());
		request.setAttribute("users", dao2.getAll());
		
		return "/WEB-INF/commu4.jsp";
	}

	
	
	//입력란
	public String insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Post s = new Post();
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