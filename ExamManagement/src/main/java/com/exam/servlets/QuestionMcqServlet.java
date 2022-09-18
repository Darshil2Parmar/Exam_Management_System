package com.exam.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.dao.ExamChoiceDataDao;
import com.exam.dao.QuestionMcqDao;
import com.exam.entity.Messages;
import com.exam.entity.QuestionsMcq;
import com.exam.entity.User;
import com.exam.helper.ConnectionProvider;

/**
 * Servlet implementation class QuestionMcqServlet
 */
@WebServlet("/QuestionMcqServlet")
public class QuestionMcqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//static int count = 1;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuestionMcqServlet() {
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
	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int mark = Integer.parseInt(request.getParameter("mark"));
		String qus = request.getParameter("question");
		String a = request.getParameter("a");
		String b = request.getParameter("b");
		String c = request.getParameter("c");
		String d = request.getParameter("d");
		String ans = request.getParameter("QuesOption");
		int totmark = Integer.parseInt(request.getParameter("totmark"));
		int count = Integer.parseInt(request.getParameter("count"));
		
		if((totmark - mark)<0) {
			mark=totmark;
		}
		totmark = totmark - mark;
		if (ans.equals("a")) {
			ans = a;
		} else if (ans.equals("b")) {
			ans = b;
		} else if (ans.equals("c")) {
			ans = c;
		} else {
			ans = d;
		}

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");

		int id = (int) session.getAttribute("selSubId");

		ExamChoiceDataDao dD =new ExamChoiceDataDao(ConnectionProvider.getConnection());
		int exId = dD.getExamID();
		
		QuestionsMcq qs = new QuestionsMcq();
		qs.setMarks(mark);
		qs.setQuestion(qus);
		qs.setA(a);
		qs.setB(b);
		qs.setC(c);
		qs.setD(d);
		qs.setAnswer(ans);
		qs.setSubId(id);
		qs.setExamid(exId);
		
		QuestionMcqDao qm = new QuestionMcqDao(ConnectionProvider.getConnection());
		System.out.println("if pela count " + count + " no " + totmark);
		if (qm.uploadMyMcq(qs)) {
			System.out.println("We added.......with count" + count);
			System.out.println(mark+" "+qus + " " + a + " " + b + " " + c + " " + d + " " + ans + " " + id);
			count = count + 1;
		} else {
			System.out.println("ELSE MA... " + qus + " " + a + " " + b + " " + c + " " + d + " " + ans + " " + id);
			System.out.println("Something went wrong!");
		}
		if (totmark>0) {
			  response.sendRedirect("papers.jsp?marks="+totmark+"&&count="+count);
		} else {
			
			Messages msg = new Messages("!! MCQ Paper Successfully Uploaded !", "success", "success-top");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);	
			count=1;
			response.sendRedirect("faculty.jsp");
		
		}
		doGet(request, response);
	}

}
