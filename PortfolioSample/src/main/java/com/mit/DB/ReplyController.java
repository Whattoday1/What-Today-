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
@WebServlet("/replyController")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ReplyDAO dao;
	PostDAO dao2;
	UserDAO dao3;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new ReplyDAO();
		dao2 = new PostDAO();
		dao3 = new UserDAO();

	}
	
    public ReplyController() {
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
			getServletContext().getRequestDispatcher("/replyController?action=list").forward(request, response);
		} else {
			switch(action) {
			case "list": view = list(request, response);break;
			case "insert": view = insert(request, response);break;
			case "delete": view = delete(request, response);break;
			}
			getServletContext().getRequestDispatcher("/"+view).forward(request, response);
		}
	}
	
	public String list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("reply", dao.getAll());
		request.setAttribute("post", dao2.getAll());
		request.setAttribute("users", dao3.getAll());
		
		return "/WEB-INF/commu2.jsp";
	}
	
	
	
	//입력란
	public String insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Reply s = new Reply();
		try {
			BeanUtils.populate(s, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
		dao.insert(s);
		/* return "DB/contents_page.jsp"; */
		
		return list(request, response);
	}
	
	public String delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Reply s = new Reply();
		try {
			BeanUtils.populate(s, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
		dao.delete(s);
		/* return "DB/contents_page.jsp"; */
		
		return list(request, response);
	}
	
}