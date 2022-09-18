package com.exam.helper;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con;

	public static Connection getConnection() {
		try {

			if (con == null) {

				Class.forName("com.mysql.cj.jdbc.Driver");

				// create a connection..
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "root");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/* System.out.println(con); */
		return con;
	}
}