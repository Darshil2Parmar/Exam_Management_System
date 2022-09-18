package com.exam.entity;

public class ExamDiv {
	private int year;
	private String showMe;
	
	public ExamDiv(int year, String showMe) {
		super();
		this.year = year;
		this.showMe = showMe;
	}
	public ExamDiv() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getShowMe() {
		return showMe;
	}
	public void setShow(String showMe) {
		this.showMe = showMe;
	}
	
	
}
