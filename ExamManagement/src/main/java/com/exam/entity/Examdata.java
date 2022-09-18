package com.exam.entity;

public class Examdata {

	private int edtid;
	private String ptype;
	private String etype;
	private int totmarks;
	private String subnm;
	private int time;
	private int isexam;
	private int year;
	




	

	public Examdata(String ptype, int edtid,  String etype, int totmarks, String subnm, int time, int year) {
		super();
		this.edtid = edtid;
		this.ptype = ptype;
		this.etype = etype;
		this.totmarks = totmarks;
		this.subnm = subnm;
		this.time = time;
		this.year = year;
	}

	public Examdata(int edtid, String ptype, String etype, int totmarks, String subnm, int time, int isexam) {
		super();
		this.edtid = edtid;
		this.ptype = ptype;
		this.etype = etype;
		this.totmarks = totmarks;
		this.subnm = subnm;
		this.time = time;
		this.isexam = isexam;
	}

	public Examdata(int edtid, String ptype, String etype, int totmarks, String subnm, int time, int isexam, int year) {
		super();
		this.edtid = edtid;
		this.ptype = ptype;
		this.etype = etype;
		this.totmarks = totmarks;
		this.subnm = subnm;
		this.time = time;
		this.isexam = isexam;
		this.year = year;
	}

	public Examdata(String ptype, String etype, int totmarks, String subnm, int time,int year) {
		super();
		this.ptype = ptype;
		this.etype = etype;
		this.totmarks = totmarks;
		this.subnm = subnm;
		this.time = time;
		this.year = year;
	}
	
	public Examdata(int edtid, String ptype, String etype, int totmarks, String subnm, int time) {
		super();
		this.edtid = edtid;
		this.ptype = ptype;
		this.etype = etype;
		this.totmarks = totmarks;
		this.subnm = subnm;
		this.time = time;
	}

	public Examdata() {
		super();
	}

	public int getEdtid() {
		return edtid;
	}

	public void setEdtid(int edtid) {
		this.edtid = edtid;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getEtype() {
		return etype;
	}

	public void setEtype(String etype) {
		this.etype = etype;
	}

	public int getTotmarks() {
		return totmarks;
	}

	public void setTotmarks(int totmarks) {
		this.totmarks = totmarks;
	}

	

	public String getSubnm() {
		return subnm;
	}

	public void setSubnm(String subnm) {
		this.subnm = subnm;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getIsexam() {
		return isexam;
	}

	public void setIsexam(int isexam) {
		this.isexam = isexam;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}
	
	
}
