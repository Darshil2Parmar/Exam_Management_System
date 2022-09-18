package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.exam.entity.QuestionsMcq;
import com.exam.entity.Result;

public class ResultDao {

	static Connection con;

	public ResultDao(Connection con) {
		this.con = con;
	}

	/// under same na hoy to chale (int id, String name)
	public boolean insertResult(Result result) {
		boolean flag = false;
		try {

			String query = "insert into ExamAnsr(ans,totque,stdId,subNm) values (?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);

			pst.setInt(1, result.getAns());
			pst.setInt(2, result.getTotque());
			pst.setInt(3, result.getStdId());
			pst.setString(4, result.getSubNm());

			/* pst.executeUpdate(); */

			if (pst.executeUpdate() != 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("DATA NOT INSERTED");
			e.printStackTrace();
		}
		return flag;
	}

	public ArrayList<Result> getAllExamData(int id) {
		ArrayList<Result> list = new ArrayList<>();

		try {
			
			String q = "select * from ExamAnsr where stdId=?";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setInt(1, id);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				Result c = new Result(set.getInt("ans"), set.getInt("totque"), set.getInt("stdId"),
						set.getTimestamp("date"), set.getString("subNm"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
