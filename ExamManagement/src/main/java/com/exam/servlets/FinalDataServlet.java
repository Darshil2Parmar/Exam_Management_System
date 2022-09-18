package com.exam.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.exam.entity.*;
import com.exam.helper.ConnectionProvider;
import com.exam.dao.*;
/**
 * Servlet implementation class FinalDataServlet
 */
@WebServlet("/FinalDataServlet")
public class FinalDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinalDataServlet() {
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
		String subnm = request.getParameter("paperNme");
		System.out.println("Sub nm : "+subnm+" "+(request.getParameter("stdyr")));
		int year = Integer.parseInt(request.getParameter("stdyr"));
		String type = request.getParameter("paperTy");
		FinalDataDao f = new FinalDataDao(ConnectionProvider.getConnection());
		boolean b = f.AddMeAs(subnm,year);
		response.sendRedirect("editable.jsp?yr="+year+"&&subnm="+subnm+"&&type="+type);
		doGet(request, response);
	}

}
