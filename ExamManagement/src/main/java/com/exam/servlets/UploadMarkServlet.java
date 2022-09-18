package com.exam.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.exam.dao.MarksUploadDao;
import com.exam.entity.Messages;
import com.exam.entity.UploadMark;
import com.exam.helper.ConnectionProvider;
import com.exam.helper.Helper;

import javax.servlet.annotation.MultipartConfig;

/**
 * Servlet implementation class UploadMarksData
 */

@MultipartConfig
public class UploadMarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private static final String UPLOAD_DIR = "uploads";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadMarkServlet() {
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
		//here file code
		String subNm = request.getParameter("paperNm");
		int markS = Integer.parseInt(request.getParameter("marksUp"));
		String ptype = request.getParameter("paperTy");
		String facmail = request.getParameter("facmail");
		//String fileName = request.getParameter("fileName");
        Part part = request.getPart("fileName");
        
        String fileName = part.getSubmittedFileName();
		/*Here code of file upload*/	  
		// TODO Auto-generated method stub
				
		        doGet(request, response);
		/*---------*/
		
		System.out.println("The selected file name is : "+fileName);
		UploadMark marks = new UploadMark(subNm, markS, ptype,fileName,facmail);
		MarksUploadDao mu = new MarksUploadDao(ConnectionProvider.getConnection());
		boolean f = mu.uploadMyData(marks);

		if(f == true) 
		{
			//System.out.println("GET REAL PATH : "+request.getRealPath("/"));
			//String path = request.getRealPath("/") + "uploads" + File.separator + part.getSubmittedFileName();
			String path = "C:\\Users\\parma\\eclipse-workspace\\ExamManagement\\src\\main\\webapp\\uploads" + File.separator + part.getSubmittedFileName();
            Helper.saveFile(part.getInputStream(), path);
            System.out.println("done");
			//out.println("We Successfully Upload Data to server...");
			//System.out.println("message", fileName + " File uploaded successfully!");
			Messages msg = new Messages("!! Alert : "+fileName + "	 File uploaded successfully!", "success", "suc-me-up");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);

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