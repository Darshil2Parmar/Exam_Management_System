package com.exam.entity;

import java.sql.Timestamp;

public class Result {
	
	private int ans;
	private int totque;
	private int stdId;
	private String subNm;
	private Timestamp date;
	public Result(int ans, int totque, int stdId,Timestamp date, String subNm) {
		super();
		this.ans = ans;
		this.totque = totque;
		this.stdId = stdId;
		this.subNm = subNm;
		this.date = date;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public Result() {
		super();
	}
	public int getAns() {
		return ans;
	}
	public void setAns(int ans) {
		this.ans = ans;
	}
	public int getTotque() {
		return totque;
	}
	public void setTotque(int totque) {
		this.totque = totque;
	}
	public int getStdId() {
		return stdId;
	}
	public void setStdId(int stdId) {
		this.stdId = stdId;
	}
	public String getSubNm() {
		return subNm;
	}
	public void setSubNm(String subNm) {
		this.subNm = subNm;
	}
	
	
	
}
