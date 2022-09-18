package com.exam.entity;

public class User {
	private int id;
	private String name;
	private int year;
	private String password;
	private String subject;
	private String type;
	private String emailId;
	//For faculty upload

	
	public User() {
		super();
	}
	

	public User(int id, String name, int year, String password, String subject, String type, String email) {
		super();
		this.id = id;
		this.name = name;
		this.year = year;
		this.password = password;
		this.subject = subject;
		this.type = type;
		this.emailId = email;
	}
	

	public User(int id, String name, int year, String password, String type) {
		super();
		this.id = id;
		this.name = name;
		this.year = year;
		this.password = password;
		this.type = type;
	}


	public User(int id, String name, String emailId, String password, String subject, String type) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.subject = subject;
		this.type = type;
		this.emailId = emailId;
	}


	public User(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}


	public String getEmail() {
		return emailId;
	}


	public void setEmail(String email) {
		this.emailId = email;
	}
	
	
}
