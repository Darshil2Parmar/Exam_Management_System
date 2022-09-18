package com.exam.servlets;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.dao.AdminDao;
import com.exam.entity.Messages;
import com.exam.helper.ConnectionProvider;
import com.exam.entity.Admin;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String sname = request.getParameter("paperNme");
		System.out.println("SNAME IS : "+sname);
		response.sendRedirect("index.jsp?subjectName="+sname);
			
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("uname");
		String userPassword = request.getParameter("password");
		/*
		 * AdminDao dao = new AdminDao(ConnectionProvider.getConnection());
		 */
		AdminDao dao = new AdminDao(ConnectionProvider.getConnection());
		Admin u = dao.getAdminByEmailAndPassword(userId, userPassword);

		if (u == null) {
			// login.................

			// out.println("Invalid Details..try again");
			System.out.println("Invalid Details..try again");

			Messages msg = new Messages("Invalid Details..try again", "error", "err");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("admin/adminLogin.jsp");

		} else {
			// ......
			// login success

			HttpSession session = request.getSession();
			session.setAttribute("currentUser", u);

			System.out.println("Admin Login Done by Login Servlet.");
			response.sendRedirect("admin/adminHome.jsp");

			/* doGet(request, response); */
		}

	}
}
