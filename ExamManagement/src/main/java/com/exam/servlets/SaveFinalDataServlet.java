package com.exam.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.exam.entity.*;
import com.exam.helper.ConnectionProvider;
import com.exam.dao.*;

/**
 * Servlet implementation class SaveFinalDataServlet
 */
@WebServlet("/SaveFinalDataServlet")
public class SaveFinalDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveFinalDataServlet() {
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
		/* ArrayList<FinalData> list = new request.getParameter("allList"); */
		/*
		 * HttpSession session = request.getSession(); ArrayList<FinalData> list =
		 * (ArrayList<FinalData>) session.getAttribute("AllList");
		 */
		/* list.add(new FinalData("AdvancedJava3122",2)); */

		
		
		if(request.getParameter("type").equals("internal")) {
			int intern = Integer.parseInt(request.getParameter("internal"));
			String id = request.getParameter("ids");
			String type = request.getParameter("type"); 
			int year = Integer.parseInt(request.getParameter("year"));
			String subject = request.getParameter("subject");
			FinalDataDao f = new FinalDataDao(ConnectionProvider.getConnection());
			System.out.println("Internal Type : "+type+" "+year+" "+subject);
			if (f.updateI(id, intern)) {
				//System.out.print("YOUR DATA UPDATE");
				String m = "Value "+intern+" Updated At "+type;
				Messages msg = new Messages(m, "succes", "success-top");
				HttpSession s = request.getSession();
				s.setAttribute("msg", msg);
				response.sendRedirect("editable.jsp?yr="+year+"&&subnm="+subject+"&&type="+type);
			} else {
				String m = "YOUR DATA UNUPDATE";
				Messages msg = new Messages(m, "succes", "unsuccess-top");
				HttpSession s = request.getSession();
				s.setAttribute("msg", msg);
				response.sendRedirect("editable.jsp?yr="+year+"&&subnm="+subject+"&&type="+type);
	
			}
		} else if(request.getParameter("type").equals("mid-sem")) {
				int mid = Integer.parseInt(request.getParameter("mid-mar"));
				String id = request.getParameter("ids");
				String type = request.getParameter("type"); 
				int year = Integer.parseInt(request.getParameter("year"));
				String subject = request.getParameter("subject");
				FinalDataDao f = new FinalDataDao(ConnectionProvider.getConnection());
				System.out.println("Mid-Sem Type : "+type+" "+year+" "+subject+" "+id+" "+mid);
				if (f.updateM(id, mid)) {
					//System.out.print("YOUR DATA UPDATE");
					String m = "Value "+mid+" Updated At "+type;
					Messages msg = new Messages(m, "succes", "success-top");
					HttpSession s = request.getSession();
					s.setAttribute("msg", msg);
					response.sendRedirect("editable.jsp?yr="+year+"&&subnm="+subject+"&&type="+type);
				} else {
					String m = "YOUR DATA UNUPDATE";
					Messages msg = new Messages(m, "succes", "unsuccess-top");
					HttpSession s = request.getSession();
					s.setAttribute("msg", msg);
					response.sendRedirect("editable.jsp?yr="+year+"&&subnm="+subject+"&&type="+type);
		
				}
		}else if(request.getParameter("type").equals("final-sem")) {
			int finalM = Integer.parseInt(request.getParameter("final-mar"));
			System.out.println("PAPA TOTAL "+request.getParameter("grand-tot"));
			int totM = Integer.parseInt(request.getParameter("grand-tot"));
			//int totM = 10;
			String id = request.getParameter("ids");
			String type = request.getParameter("type"); 
			int year = Integer.parseInt(request.getParameter("year"));
			String subject = request.getParameter("subject");
			FinalDataDao f = new FinalDataDao(ConnectionProvider.getConnection());
			System.out.println("Final-Sem Type : "+type+" "+year+" "+subject+" "+id+" "+finalM);
			if (f.updateF(id, finalM,totM)) {
				//System.out.print("YOUR DATA UPDATE");
				String m = "Value "+finalM+" And Total "+ totM +" Updated At "+type;
				Messages msg = new Messages(m, "succes", "success-top");
				HttpSession s = request.getSession();
				s.setAttribute("msg", msg);
				response.sendRedirect("editable.jsp?yr="+year+"&&subnm="+subject+"&&type="+type);
			} else {
				String m = "YOUR DATA UNUPDATE";
				Messages msg = new Messages(m, "succes", "unsuccess-top");
				HttpSession s = request.getSession();
				s.setAttribute("msg", msg);
				response.sendRedirect("editable.jsp?yr="+year+"&&subnm="+subject+"&&type="+type);
	
			}
	} 

		doGet(request, response);
	}

}
