package com.exam.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.exam.entity.*;


public class ExamDivDao {
	
	static Connection con;

	public ExamDivDao(Connection con) {

		this.con = con;

	}
	
	public void setConf(int y) {		
		
		try {
				
			String qry = "SELECT * FROM examdiv WHERE year=?";
			
			PreparedStatement pst = this.con.prepareStatement(qry);
			pst.setInt(1, y);
			ResultSet set = pst.executeQuery();
			set.next();		
			String sh = set.getString("showMe");
			
//			Here update  code
			if(sh.equals("no")) {
				qry = "UPDATE examdiv SET showMe='yes' WHERE year=?";
			} else {
				qry = "UPDATE examdiv SET showMe= 'no' WHERE year=?";
			}
			pst = this.con.prepareStatement(qry);
			pst.setInt(1, y);
			
			if (pst.executeUpdate()!=0) {
				System.out.println("We set conf yes");
				

			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("We set can't conf yes");			
		}
	}
	public boolean checkDiv(int y) {
		boolean f = false;
		
		try {
			
			String qry = "SELECT * FROM examdiv WHERE year = ?";
			PreparedStatement pst = this.con.prepareStatement(qry);

			pst.setInt(1, y);
			ResultSet set = pst.executeQuery();
			set.next();
			if(set.getString("showMe").equals("no")) {
				f=false;
			} else {
				f=true;
			}


		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public ArrayList<ExamDiv> getAllExamDiv() {
		ArrayList<ExamDiv> list = new ArrayList<>();

		try {
			
			String q = "select * from examdiv";
			PreparedStatement pst = con.prepareStatement(q);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				ExamDiv c = new ExamDiv(set.getInt("year"), set.getString("showMe"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
