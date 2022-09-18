package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.exam.entity.*;
public class FinalDataDao {

	static Connection con;

	public FinalDataDao(Connection con) {

		this.con = con;

	}
	public boolean AddMeAs(String sname,int year) {
		ArrayList<User> list = new ArrayList<>();
		boolean f = false;
		try {

			String q = "select * from student Where year=(?)";
			String id = null;
			PreparedStatement pst = con.prepareStatement(q);
			pst.setInt(1, year);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				User c = new User(set.getInt("id"),set.getString("name"));
				list.add(c);
			}
			for (User user : list) {
					id = sname+ user.getId();
					
					q = "SELECT COUNT(*) FROM finaldata WHERE id=(?)";
					
					pst = con.prepareStatement(q);
					pst.setString(1, id);
					set = pst.executeQuery();
					set.next();
					if(set.getInt("count(*)")==1)
					{
						System.out.println("DATA ALREADY ON DATABASE : "+set.getInt("count(*)"));
					} else {
						System.out.println("DATA Inserted ON DATABASE : "+set.getInt("count(*)"));
						q = "INSERT INTO finaldata (id,subject,rollno,sname) VALUES (?,?,?,?)";
						pst = con.prepareStatement(q);
						pst.setString(1, id);
						pst.setString(2, sname);
						pst.setInt(3, user.getId());
						pst.setString(4, user.getName());
						if (pst.executeUpdate() != 0) {
							System.out.println("We inserted final Data : ");
						}
						else {
							System.out.println("Data Insertion Fail by FinalDataDao");
						}
					}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public ArrayList<FinalData> getAllInternalData(String sub,String type) {
		ArrayList<FinalData> list = new ArrayList<>();

		try {
			
			String q = "select * from finaldata where subject= (?)";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setString(1, sub);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				FinalData c = new FinalData(set.getString("id"),set.getString("subject"),set.getInt("rollno"), set.getString("sname"), set.getInt("intrtot"), set.getInt("midsem"), set.getInt("finalsem"), set.getInt("grandtot"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public ArrayList<FinalData> getAllMidData(String sub,String type) {
		ArrayList<FinalData> list = new ArrayList<>();

		try {
			
			String q = "select * from finaldata where subject= (?)";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setString(1, sub);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				FinalData c = new FinalData(set.getString("id"),set.getString("subject"),set.getInt("rollno"), set.getString("sname"), set.getInt("intrtot"), set.getInt("midsem"), set.getInt("finalsem"), set.getInt("grandtot"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public ArrayList<FinalData> getAllFinalData(String sub,String type) {
		ArrayList<FinalData> list = new ArrayList<>();

		try {
			
			String q = "select * from finaldata where subject= (?)";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setString(1, sub);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				FinalData c = new FinalData(set.getString("id"),set.getString("subject"),set.getInt("rollno"), set.getString("sname"), set.getInt("intrtot"), set.getInt("midsem"), set.getInt("finalsem"), set.getInt("grandtot"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public boolean updateI(String id,int intern) {
		boolean flag = false;
		try {

			String query = "UPDATE finaldata SET intrtot = (?) WHERE id = (?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, intern);
			pst.setString(2, id);
			
			if (pst.executeUpdate() != 0) {
				flag = true;
				System.out.println("Internal sem Data Updated");
			}
		} catch (Exception e) {
			System.out.println("INTER DATA NOT INSERTED");
			e.printStackTrace();
		}
		return flag;
	}
	public boolean updateM(String id,int mid) {
		boolean flag = false;
		try {

			String query = "UPDATE finaldata SET midsem = (?) WHERE id = (?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, mid);
			pst.setString(2, id);
			
			if (pst.executeUpdate() != 0) {
				flag = true;
				System.out.println("Mid sem Data Updated");

			}
		} catch (Exception e) {
			System.out.println("MID DATA NOT INSERTED");
			e.printStackTrace();
		}
		return flag;
	}
	public boolean updateF(String id,int fin,int gra) {
		boolean flag = false;
		try {

			String query = "UPDATE finaldata SET finalsem = (?),grandtot = (?) WHERE id = (?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, fin);
			pst.setInt(2, gra);
			pst.setString(3, id);
			
			if (pst.executeUpdate() != 0) {
				flag = true;
				System.out.println("Final sem Data Updated");
			}
		} catch (Exception e) {
			System.out.println("FINAL DATA NOT INSERTED");
			e.printStackTrace();
		}
		return flag;
	}
	public ArrayList<FinalData> getAllFinalDataSub(int rll) {
		ArrayList<FinalData> list = new ArrayList<>();

		try {
			
			String q = "select * from finaldata where rollno= (?)";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setInt(1, rll);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				FinalData c = new FinalData(set.getString("id"),set.getString("subject"),set.getInt("rollno"), set.getString("sname"), set.getInt("intrtot"), set.getInt("midsem"), set.getInt("finalsem"), set.getInt("grandtot"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
