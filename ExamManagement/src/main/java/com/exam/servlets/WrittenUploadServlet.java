package com.exam.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.exam.dao.SubjectDao;
import com.exam.entity.Messages;
import com.exam.helper.ConnectionProvider;
import com.exam.helper.Helper;

/**
 * Servlet implementation class WrittenUploadServlet
 */
@WebServlet("/WrittenUploadServlet")
@MultipartConfig
public class WrittenUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WrittenUploadServlet() {
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
		String sname = request.getParameter("sname");
		  Part part = request.getPart("fileName");
	        
	      String fileName = part.getSubmittedFileName();
	      SubjectDao s = new SubjectDao(ConnectionProvider.getConnection());
	      boolean f = s.updateFilePaper(sname, fileName);
		 if(f==true) {
				//System.out.println("GET REAL PATH : "+request.getRealPath("/"));
				//String path = request.getRealPath("/") + "uploads" + File.separator + part.getSubmittedFileName();
				String path = "C:\\Users\\parma\\eclipse-workspace\\ExamManagement\\src\\main\\webapp\\written" + File.separator + part.getSubmittedFileName();
	            Helper.saveFile(part.getInputStream(), path);
	            System.out.println("done");
				//out.println("We Successfully Upload Data to server...");
				//System.out.println("message", fileName + " File uploaded successfully!");
				Messages msg = new Messages("!! Alert : "+fileName + "written Paper File uploaded successfully!", "success", "suc-me-up");
				HttpSession sv = request.getSession();
				sv.setAttribute("msg", msg);

				response.sendRedirect("faculty.jsp");
				
			}
			else
			{
				System.out.println("error");
				System.out.println("Opps something went wrong...!");
			}
		doGet(request, response);
	}

}
