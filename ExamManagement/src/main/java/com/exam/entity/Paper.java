package com.exam.entity;

public class Paper {
	private int id;
	private String etype;
	private String ptype;
	private int totalMark;
	private String subject;
	private int year;
	private int etime;
	private String pdffile;
	
	
	public Paper(int id, String etype, String ptype, int totalMark, String subject, int year, int etime,
			String pdffile) {
		super();
		this.id = id;
		this.etype = etype;
		this.ptype = ptype;
		this.totalMark = totalMark;
		this.subject = subject;
		this.year = year;
		this.etime = etime;
		this.pdffile = pdffile;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getEtype() {
		return etype;
	}


	public void setEtype(String etype) {
		this.etype = etype;
	}


	public String getPtype() {
		return ptype;
	}


	public void setPtype(String ptype) {
		this.ptype = ptype;
	}


	public int getTotalMark() {
		return totalMark;
	}


	public void setTotalMark(int totalMark) {
		this.totalMark = totalMark;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public int getYear() {
		return year;
	}


	public void setYear(int year) {
		this.year = year;
	}


	public int getEtime() {
		return etime;
	}


	public void setEtime(int etime) {
		this.etime = etime;
	}


	public String getPdffile() {
		return pdffile;
	}


	public void setPdffile(String pdffile) {
		this.pdffile = pdffile;
	}
	
	
	
}
