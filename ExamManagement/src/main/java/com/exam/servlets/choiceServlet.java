package com.exam.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.dao.ExamChoiceDataDao;
import com.exam.dao.QuestionMcqDao;
import com.exam.dao.SubjectDao;
import com.exam.entity.Examdata;
import com.exam.entity.QuestionsMcq;
import com.exam.helper.ConnectionProvider;

/**
 * Servlet implementation class choiceServlet
 */
@WebServlet("/choiceServlet")
public class choiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public choiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s = request.getSession();
		String etype = request.getParameter("examtype");
		
		String ptype = request.getParameter("typ");
		
		int totmarks = Integer.parseInt(request.getParameter("tmarkMCQ"));
		String nmSub = request.getParameter("subnm");
		
		SubjectDao sd = new SubjectDao(ConnectionProvider.getConnection());
		int yr = sd.subYrByName(nmSub);
		int time = Integer.parseInt(request.getParameter("etime"));
		int idSub = sd.subIdByName(nmSub);
		s.setAttribute("selSubId", idSub);
		Examdata e = new Examdata(ptype,etype,totmarks,nmSub,time,yr);
			
		ExamChoiceDataDao ed = new ExamChoiceDataDao(ConnectionProvider.getConnection());
		System.out.println("type "+ptype);
		if(ptype.equals("Written")) {
			if(ed.insertMyChoiceWritten(e)==false) {
				System.out.print("Written Dao return False");
			}
			else {
				System.out.println("Your Query Done");
			}
		}else {
			if(ed.insertMyChoice(e)==false) {
				System.out.print("Dao return False");
			}
			else {
				System.out.println("Your Query Done");
			}
		}
		
		
		
		
		//System.out.println("The value of idSub is : "+idSub);
		
		
		  if(ptype.equals("MCQ")) 
		  {
			  response.sendRedirect("papers.jsp?marks="+totmarks+"&&count=1");
		  } else { 
			  response.sendRedirect("written.jsp?sub="+nmSub); 
		  }
		 
		//QuestionMcqDao qd = new QuestionMcqDao(ConnectionProvider.getConnection());
			
		doGet(request, response);
	}

}
