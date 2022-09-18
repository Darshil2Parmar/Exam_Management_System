package com.exam.entity;

public class Subject {
	private int subId;
	private String subName;
	private int facultyid;
	private int subYear;
	private int subSem;
	private int subCreadit;
	
	
	
	@Override
	public String toString() {
		return "Subject [subId=" + subId + ", subName=" + subName + ", facultyid=" + facultyid + ", subYear=" + subYear
				+ ", subSem=" + subSem + ", subCreadit=" + subCreadit + "]";
	}

	public Subject() {
		super();
	}

	public Subject(int subId, String subName, int facultyid, int subYear, int subSem, int subCreadit) {
		super();
		this.subId = subId;
		this.subName = subName;
		this.facultyid = facultyid;
		this.subYear = subYear;
		this.subSem = subSem;
		this.subCreadit = subCreadit;
	}



	public Subject(String subName) {
		super();
		this.subName = subName;
	}

	public int getSubId() {
		return subId;
	}

	public void setSubId(int subId) {
		this.subId = subId;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public int getFacultyid() {
		return facultyid;
	}

	public void setFacultyid(int facultyid) {
		this.facultyid = facultyid;
	}

	public int getSubYear() {
		return subYear;
	}

	public void setSubYear(int subYear) {
		this.subYear = subYear;
	}

	public int getSubSem() {
		return subSem;
	}

	public void setSubSem(int subSem) {
		this.subSem = subSem;
	}

	public int getSubCreadit() {
		return subCreadit;
	}

	public void setSubCreadit(int subCreadit) {
		this.subCreadit = subCreadit;
	}

}
