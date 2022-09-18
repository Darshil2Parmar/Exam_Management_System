package com.exam.dao;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.exam.entity.*;
public class OtherExamDataDao {
	static Connection con;

	public OtherExamDataDao(Connection con) {

		this.con = con;

	}
	
	public boolean uploadOtherExamData(String um) {
		boolean f = false;
		//System.out.println(Sname + " " + marks + " " + pType + " " + file);
		
		try {
			
			String qry = "insert into otherexam(file) values (?)";
			PreparedStatement pst = this.con.prepareStatement(qry);

			pst.setString(1, um);

			System.out.println("HEre were dao return file : "+um);

			if (pst.executeUpdate() != 0) {
				f = true;
			}
			System.out.println("VALUE OF F IS ::: " + f);

		} catch (Exception e) {
			System.out.println("Uploadation Fail");
			e.printStackTrace();

		}
		return f;
	}
	
	public ArrayList<OtherExamData> getAllOtherExamData() {
		ArrayList<OtherExamData> list = new ArrayList<>();

		try {
			
			String q = "select * from otherexam";
			PreparedStatement pst = con.prepareStatement(q);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				OtherExamData c = new OtherExamData(set.getInt("id"), set.getString("file"),set.getTimestamp("date"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
