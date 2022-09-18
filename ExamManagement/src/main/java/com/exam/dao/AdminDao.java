package com.exam.dao;

import com.exam.entity.Admin;
import com.exam.entity.User;

import java.sql.*;
public class AdminDao {
	
	private Connection con;
	
	public AdminDao(Connection con) {
		this.con = con;
	}


	public Admin getAdminByEmailAndPassword(String id, String password){
	Admin admin = null;
			
	try {
			System.out.print("yes Admin hai");
			String query = "select * from admin where emailid =? and password=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			System.out.println(query);

			// Answer on table form
			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				admin = new Admin();

				admin.setEmail(password);
				admin.setPassword(set.getString("password"));
				admin.setName(set.getString("name"));

			}
	} catch (Exception e) {
		e.printStackTrace();
	}

	return admin;
	
	
	}
	



}