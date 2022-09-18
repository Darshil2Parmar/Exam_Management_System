package com.exam.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.exam.entity.QuestionsMcq;
import com.exam.entity.Result;
import com.exam.entity.UploadMark;
import com.exam.entity.User;
public class MarksUploadDao {

	static Connection con;

	public MarksUploadDao(Connection con) {

		this.con = con;

	}

	public boolean uploadMyData(UploadMark um) {
		boolean f = false;
		//System.out.println(Sname + " " + marks + " " + pType + " " + file);
		
		try {
			
			String qry = "insert into result(subname,marks,ptype,file,fmail) values (?,?,?,?,?)";
			PreparedStatement pst = this.con.prepareStatement(qry);

			pst.setString(1, um.getPaperNm());
			pst.setInt(2, um.getMarksUp());
			pst.setString(3, um.getPaperTy());
			pst.setString(4, um.getMarksFile());
			pst.setString(5, um.getFmail());
			System.out.println("HEre were dao return file : "+um.getMarksFile());
			System.out.println("VALUE OF F IS ::: " + f);

			if (pst.executeUpdate() != 0) {
				f = true;
			}

		} catch (Exception e) {
			System.out.println("Uploadation Fail");
			e.printStackTrace();

		}
		return f;
	}
	public ArrayList<UploadMark> getAllUploadData() {
		ArrayList<UploadMark> list = new ArrayList<>();

		try {
			
			String q = "select * from result";
			PreparedStatement pst = con.prepareStatement(q);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				UploadMark c = new UploadMark(set.getInt("id"), set.getString("subname"), set.getInt("marks"),
						set.getString("ptype"), set.getString("file"),set.getInt("conf"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public void setConf(int id) {		
		
		try {
				
			String qry = "SELECT * FROM result WHERE id=?";
			
			PreparedStatement pst = this.con.prepareStatement(qry);
			pst.setInt(1, id);
			ResultSet set = pst.executeQuery();
			set.next();		
			int i = set.getInt("conf");
			
//			Here update  code
			if(i==0) {
				qry = "UPDATE result SET conf = 1 WHERE id=?";
			} else {
				qry = "UPDATE result SET conf = 0 WHERE id=?";
			}
			pst = this.con.prepareStatement(qry);
			pst.setInt(1, id);
			
			if (pst.executeUpdate()!=0) {
				System.out.println("We set conf 1");
				//response.sendRedirect("admin/uploadMarkApr.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("We set can't conf 1");			
		}
	}
	public ArrayList<UploadMark> getFacUploadation(String id) {		
		ArrayList<UploadMark> list = new ArrayList<>();
		System.out.print("THE EMAIL ID IS : "+id);
		try {
			
			String qry = "SELECT * FROM result WHERE fmail=?";
			
			PreparedStatement pst = this.con.prepareStatement(qry);
			pst.setString(1, id);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				UploadMark c = new UploadMark(set.getInt("id"), set.getString("subname"), set.getInt("marks"), set.getString("ptype"), set.getString("file"), set.getString("fmail"), set.getInt("conf"));
				list.add(c);
			}
			System.out.println("LIST IS : "+list);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("We Get Your data On MArkUpDao.");			
		}
		return list;
	}

}
