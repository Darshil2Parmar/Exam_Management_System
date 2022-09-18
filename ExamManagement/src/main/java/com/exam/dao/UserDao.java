package com.exam.dao;

import java.sql.*;
import java.util.ArrayList;
import com.exam.entity.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {

		this.con = con;

	}

	public User getUserByEmailAndPassword(int id, String password, String type) {
		User user = null;

		try {
			System.out.println("Type of it is : " + type);
				System.out.print("yes studetn hai sala");
				String query = "select * from student where id =? and password=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, id);
				pstmt.setString(2, password);
				System.out.println(query);

				// Answer on table form
				ResultSet set = pstmt.executeQuery();

				if (set.next()) {
					user = new User();

					// data from db
					// how to write second type
					// String type = set.getString("type");

					// set to user object

					user.setId(set.getInt("id"));
					user.setPassword(set.getString("password"));
					user.setName(set.getString("name"));
					user.setYear(set.getInt("year"));
					user.setType(set.getString("type"));
				}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}
	public User getFacByEmailAndPassword(String id, String password, String type) {
		User user = null;

		try {
			System.out.println("Type of it is : " + type);
			
				System.out.print("yes fac hai sala");
				
				String query = "select * from faculty where emailid =? and password=?";
				PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				System.out.println(query);

				// Answer on table form
				ResultSet set = pstmt.executeQuery();

				if (set.next()) {
					user = new User();

					// set to user object

					user.setId(set.getInt("id"));
					user.setPassword(set.getString("password"));
					user.setName(set.getString("name"));
					/* user.setSubject(set.getString("subject")); */
					user.setType(set.getString("type"));
					user.setEmail(set.getString("emailid"));
				}
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}
	public ArrayList<User> getAllStudentData() {
		ArrayList<User> list = new ArrayList<>();

		try {

			String q = "select * from student";
			PreparedStatement pst = con.prepareStatement(q);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				User c = new User(set.getInt("id"), set.getString("name"), set.getInt("year"),
						set.getString("password"), set.getString("type"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<User> getAllFacultyData() {
		ArrayList<User> list = new ArrayList<>();

		try {

			String q = "select * from faculty";
			PreparedStatement pst = con.prepareStatement(q);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				User c = new User(set.getInt("id"), set.getString("name"), set.getString("emailid"),
						set.getString("password"), set.getString("subject"), set.getString("type"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public int getCountMe(String tbl) {

		String k = "";
		if (tbl.equals("student")) {
			k = "SELECT COUNT(*) FROM student;";
		} else if (tbl.equals("faculty")) {
			k = "SELECT COUNT(*) FROM faculty;";
		} else if (tbl.equals("result")) {
			k = "SELECT COUNT(*) FROM result;";
		} else if (tbl.equals("examdata")) {
			k = "SELECT COUNT(*) FROM examdata;";
		} else if (tbl.equals("otherexam")) {
			k = "SELECT COUNT(*) FROM otherexam;";
		} else if (tbl.equals("subject")) {
			k = "SELECT COUNT(*) FROM otherexam;";
		}else if (tbl.equals("written")) {
			k = "SELECT COUNT(*) FROM paper;";
		}else if (tbl.equals("announce")) {
			k = "SELECT COUNT(*) FROM announcement;";
		}
		int c = 0;
		
		try {

			
			PreparedStatement pst = con.prepareStatement(k);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				c = set.getInt("count(*)");
			}

		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return c;
	}
}
