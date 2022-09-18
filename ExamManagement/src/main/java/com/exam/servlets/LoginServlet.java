package com.exam.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.dao.UserDao;
import com.exam.entity.User;
import com.exam.helper.ConnectionProvider;
import com.exam.entity.Messages;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<!DOCTYPE html>");
		out.println("<head>");
		out.println("<title>Log In Servlet</title>");
		out.println("</head>");
		out.println("<body>");

		// login

		// fetch username and password from 
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User u = null;
		String userType = request.getParameter("utype");
		System.out.println("HERE IN STUDENT WITH UTYPE "+userType);
		if(userType.equals("student")) {
			int userId = Integer.valueOf(request.getParameter("uname"));
			String userPassword = request.getParameter("password");
			u = dao.getUserByEmailAndPassword(userId, userPassword, userType);
			System.out.println("IN STUDENT SERV");
		} else {
			String facmail = request.getParameter("uname");
			String userPassword = request.getParameter("password");
			u = dao.getFacByEmailAndPassword(facmail, userPassword, userType);
			System.out.println("IN FACULTY SERV");
		}
		


		if (u == null) {
			// login.................

			// out.println("Invalid Details..try again");
			System.out.println("Invalid Details..try again");

			Messages msg = new Messages("Invalid Details..try again", "error", "err");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("login.jsp");

		} else {
			// ......
			//login success

			HttpSession session = request.getSession();
			session.setAttribute("currentUser", u);
			
			//out.println("Done By loginServlet");
			if((u.getType()).equals("student")){
				System.out.println("Student Login Done by Login Servlet.");
				response.sendRedirect("index.jsp");
			}
			else
			{
				System.out.println("Faculty Login Done by Login Servlet");
				response.sendRedirect("faculty.jsp");
				
			}


		}
	}
}
