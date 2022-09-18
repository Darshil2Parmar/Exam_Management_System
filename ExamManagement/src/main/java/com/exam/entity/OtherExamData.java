package com.exam.entity;

import java.sql.Timestamp;

public class OtherExamData {
	private int id;
	private String file;
	private Timestamp date;
	
	public OtherExamData(String file) {
		super();
		this.file = file;
	}

	public OtherExamData(int id, String file, Timestamp date) {
		super();
		this.id = id;
		this.file = file;
		this.date = date;
	}
	
	public OtherExamData() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	
	
}
