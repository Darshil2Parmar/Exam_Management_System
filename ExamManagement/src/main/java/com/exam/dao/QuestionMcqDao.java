package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.exam.entity.QuestionsMcq;
import com.exam.entity.Subject;

public class QuestionMcqDao {
	
	static Connection con;

	public QuestionMcqDao(Connection con) {

		this.con = con;

	}

	public boolean uploadMyMcq(QuestionsMcq mcq) {
		boolean f = false;
		//System.out.println(Sname + " " + marks + " " + pType + " " + file);
		
		try {
			
			String qry = "insert into mcqtest(subid,question,a,b,c,d,ans,marks,examid) values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = this.con.prepareStatement(qry);
			pst.setInt(1, mcq.getSubId());
			pst.setString(2, mcq.getQuestion());
			pst.setString(3, mcq.getA());
			pst.setString(4, mcq.getB());
			pst.setString(5, mcq.getC());
			pst.setString(6, mcq.getD());
			pst.setString(7, mcq.getAnswer());			
			pst.setInt(8, mcq.getMarks());
			pst.setInt(9, mcq.getExamid());
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
	
	public ArrayList<QuestionsMcq> getAllExamQueById(int id) {
		ArrayList<QuestionsMcq> list = new ArrayList<>();

		try {

			String q = "SELECT * FROM mcqtest WHERE examid=? ORDER BY marks";
		PreparedStatement pst = this.con.prepareStatement(q);
		pst.setInt(1, id);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				QuestionsMcq c = new QuestionsMcq(set.getString("question"), set.getString("a"), set.getString("b"), set.getString("c"), set.getString("d"), set.getString("ans"), set.getInt("subid"),set.getInt("marks"));
				list.add(c);
			}
			//System.out.print("-------------------------------------------------TRUE");
			//System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("+++++++++++++++++++++++++++++++++++++++++++++++++++FALSE");
		}

		return list;
	}


}
