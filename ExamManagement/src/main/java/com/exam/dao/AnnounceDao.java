package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.exam.entity.*;

public class AnnounceDao {
static Connection con;

	public AnnounceDao(Connection con) {

		this.con = con;

	}
	
	public boolean uploadOtherAnnounce(String date,String desc,String file) {
		boolean f = false;
		
		try {
			
			String qry = "insert into announcement(date,descr,file) values (?,?,?)";
			PreparedStatement pst = this.con.prepareStatement(qry);

			pst.setString(1, date);
			pst.setString(2, desc);
			pst.setString(3, file);
			
			System.out.println("HEre were dao return file : "+date+" "+desc+" "+file);

			if (pst.executeUpdate() != 0) {
				f = true;
				System.out.println("HEre were dao return file : "+date+" "+desc+" "+file);
			}
			System.out.println("VALUE OF F IS ::: " + f);

		} catch (Exception e) {
			System.out.println("Uploadation Fail");
			e.printStackTrace();

		}
		return f;
	}
	public ArrayList<Announc> getAllAnnounceData() {
		ArrayList<Announc> list = new ArrayList<>();

		try {
			
			String q = "select * from announcement";
			PreparedStatement pst = con.prepareStatement(q);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				Announc c = new Announc(set.getInt("id"),set.getString("date"), set.getString("descr"), set.getString("file"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
