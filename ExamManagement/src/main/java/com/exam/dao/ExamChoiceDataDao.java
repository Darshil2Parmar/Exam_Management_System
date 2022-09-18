package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import com.exam.entity.Examdata;
import com.exam.entity.Subject;
import com.exam.entity.User;
import javax.servlet.http.HttpServletResponse;
public class ExamChoiceDataDao {

	static Connection con;

	public ExamChoiceDataDao(Connection con) {
		this.con = con;
	}

	/// under same na hoy to chale (int id, String name)
	public boolean insertMyChoice(Examdata examdata) {
		boolean flag = false;
		try {

			String query = "insert into examdata(etype,ptype,totalMark,subject,year,etime) values (?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);

			pst.setString(1, examdata.getPtype());
			pst.setString(2, examdata.getEtype());
			pst.setInt(3, examdata.getTotmarks());
			pst.setString(4, examdata.getSubnm());
			pst.setInt(5, examdata.getYear());
			pst.setInt(6, examdata.getTime());

			/* pst.executeUpdate(); */

			if (pst.executeUpdate() != 0) {
				flag = true;
				System.out.println("EXAM +DATA INSERTED");

			}
		} catch (Exception e) {
			System.out.println("DATA NOT INSERTED");
			e.printStackTrace();
		}
		return flag;
	}
	public boolean insertMyChoiceWritten(Examdata examdata) {
		boolean flag = false;
		try {

			String query = "insert into paper(etype,ptype,totalMark,subject,year,etime) values (?,?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);

			pst.setString(1, examdata.getPtype());
			pst.setString(2, examdata.getEtype());
			pst.setInt(3, examdata.getTotmarks());
			pst.setString(4, examdata.getSubnm());
			pst.setInt(5, examdata.getYear());
			pst.setInt(6, examdata.getTime());

			/* pst.executeUpdate(); */

			if (pst.executeUpdate() != 0) {
				flag = true;
				System.out.println("EXAM +DATA+Written INSERTED");

			}
		} catch (Exception e) {
			System.out.println("DATA Written NOT INSERTED");
			e.printStackTrace();
		}
		return flag;
	}
	public int getExamID() {
		int id = 0;
		try {
			System.out.print("Hello me getExamID try bock");
			String q = "SELECT * FROM examdata ORDER BY id DESC LIMIT 1";

			PreparedStatement pst = con.prepareStatement(q);

			ResultSet rs = pst.executeQuery();
			rs.next();
			id = rs.getInt(1);
			System.out.println("value of id is : " + rs.getInt(1));

		} catch (Exception e) {
			System.out.print("Hello me getExamID catch bock");
			e.printStackTrace();
		}

		return id;

	}

	/**
	 * @return
	 */
	public ArrayList<Examdata> getAllExamData() {
		ArrayList<Examdata> list = new ArrayList<>();

		try {
			
			String q = "select * from examdata";
			PreparedStatement pst = con.prepareStatement(q);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				Examdata c = new Examdata(set.getInt("id"), set.getString("etype"), set.getString("ptype"),	set.getInt("totalMark"), set.getString("subject"),set.getInt("etime"),set.getInt("isexam"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public void setExam(int id) {

		try {
			String qry = "SELECT * FROM examdata WHERE id=?";
			PreparedStatement pst = this.con.prepareStatement(qry);
			pst.setInt(1, id);
			ResultSet set = pst.executeQuery();
			set.next();		
			int i = set.getInt("isexam");
			
			//HERE THE CODE OF REAL QUERY
			if(i==0) {
				qry = "UPDATE examdata SET isexam = 1 WHERE id=?";
			} else {
				qry = "UPDATE examdata SET isexam = 0 WHERE id=?";
			}
			pst = this.con.prepareStatement(qry);
			pst.setInt(1, id);

			if (pst.executeUpdate() != 0) {
				System.out.println("We set conf at ExamChoiceDataDao");
				// response.sendRedirect("admin/uploadMarkApr.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("We set can't conf 1 ExamChoiceDataDao");
		}
	}
	
	public Examdata getTodayExamDetail(int subYr) {
		Examdata examdata = new Examdata();

		try {

			String q = "SELECT * FROM examdata WHERE isExam=1 AND YEAR=?;";
			PreparedStatement pst = this.con.prepareStatement(q);
			pst.setInt(1, subYr);
			ResultSet set = pst.executeQuery();
			set.next();
			examdata = new Examdata(set.getInt("id"), set.getString("ptype"), set.getString("etype"), set.getInt("totalMark"), set.getString("subject"), set.getInt("etime"), set.getInt("isexam"), set.getInt("year"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return examdata;
	}
	public int getTime(int eid) {
		int tm = 0;

		try {
			System.out.print("Hello me getTime try bock");
			String q = "SELECT etime FROM examdata WHERE id=?";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setInt(1, eid);
			
			ResultSet rs = pst.executeQuery();
			rs.next();
			tm = rs.getInt(1);
			System.out.println("value is : " + tm);

		} catch (Exception e) {
			System.out.print("Hello me getTime catch bock");
			e.printStackTrace();
		}

		return tm;

	}
	public void closeExam(int id) {

		try {
			String qry = "UPDATE * isexam FROM examdata WHERE id=?";
			PreparedStatement pst = this.con.prepareStatement(qry);
			pst.setInt(1, id);

			if (pst.executeUpdate() != 0) {
				
				System.out.println("We Close EXam ExamChoiceDataDao");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("We set can't conf 1 ExamChoiceDataDao");
		}
	}
	public void removeCon(int id) {

		try {
			String qry = "UPDATE examdata SET isexam=0 WHERE id=?";
			PreparedStatement pst = this.con.prepareStatement(qry);
			pst.setInt(1, id);

			if (pst.executeUpdate() != 0) {
				
				System.out.println("We Close EXam ExamChoiceDataDao RemoveCon");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("We set can't conf 1 ExamChoiceDataDao RemoveCon");
		}
	}
	public Examdata getWrittenData(String sname) {
		Examdata examdata = new Examdata();

		try {
			System.out.println("WE GET SUB IN EXAMCHOICEDAO = "+sname);
			String q = "SELECT * FROM paper WHERE subject=? ORDER BY id DESC LIMIT 1;";
			PreparedStatement pst = this.con.prepareStatement(q);
			pst.setString(1, sname);
			ResultSet set = pst.executeQuery();
			if(set.next()){
				examdata = new Examdata(set.getString("ptype"),set.getInt("id"), set.getString("etype"), set.getInt("totalMark"), set.getString("subject"), set.getInt("etime"), set.getInt("year"));
			} else {
				System.out.println("SET IS NULL");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return examdata;
	}
}
