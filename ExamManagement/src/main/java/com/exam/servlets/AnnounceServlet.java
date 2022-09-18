package com.exam.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.exam.dao.AnnounceDao;
import com.exam.dao.OtherExamDataDao;
import com.exam.entity.Messages;
import com.exam.helper.ConnectionProvider;
import com.exam.helper.Helper;

/**
 * Servlet implementation class AnnounceServlet
 */
@WebServlet("/AnnounceServlet")
@MultipartConfig

public class AnnounceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnnounceServlet() {
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
		String dt = request.getParameter("date");
		String desc = request.getParameter("descr");
		String file = request.getParameter("file");
		Part part = request.getPart("file");
		
		String fileName = part.getSubmittedFileName();
			
		System.out.println("The selected file name is : "+fileName);
		AnnounceDao mu = new AnnounceDao(ConnectionProvider.getConnection());
		boolean f = mu.uploadOtherAnnounce(dt,desc,fileName);
		
		if(f == true) 
		{
			/*
			 * System.out.println("GET REAL PATH : "+request.getRealPath("/"));
			 */			//String path = request.getRealPath("/") + "uploads" + File.separator + part.getSubmittedFileName();
			String path = "C:\\Users\\parma\\eclipse-workspace\\ExamManagement\\src\\main\\webapp\\admin\\announcement" + File.separator + part.getSubmittedFileName();
            Helper.saveFile(part.getInputStream(), path);
            System.out.println("done on Servlet at OtherExamDataServlet");


			Messages msg = new Messages("!! Alert : Announcement and "+fileName + "	 File uploaded successfully!", "success", "success-top");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);

			response.sendRedirect("admin/otherExamData.jsp");
			
		}
		else
		{
			System.out.println("error--");
			System.out.println("--Opps something went wrong...!");
			
			Messages msg = new Messages("!! Alert : File uploaded Faied!", "unsuccess", "unsuccess-top");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);

			response.sendRedirect("admin/otherExamData.jsp");
		}
		doGet(request, response);
	}

}
