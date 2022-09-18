package com.exam.entity;

public class Announc {
	
	private int id;
	private String date;
	private String desc;
	private String file;
	
	public Announc(int id, String date, String desc, String file) {
		super();
		this.id = id;
		this.date = date;
		this.desc = desc;
		this.file = file;
	}

	public Announc(String date, String desc, String file) {
		super();
		this.date = date;
		this.desc = desc;
		this.file = file;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}
