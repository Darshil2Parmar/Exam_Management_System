package com.exam.entity;

public class FinalData {
	private String subnm;
	private int rollno;
	private String sname;
	private int intrtot;
	private int midsem;
	private int finalsem;
	private int grandtot;
	private String id;
	
	
	public FinalData() {
		super();
	}

	public FinalData(String subnm, int rollno, String sname, int intrtot, int midsem, int finalsem, int grandtot) {
		super();
		this.subnm = subnm;
		this.rollno = rollno;
		this.sname = sname;
		this.intrtot = intrtot;
		this.midsem = midsem;
		this.finalsem = finalsem;
		this.grandtot = grandtot;
	}
	
	

	public FinalData(String subnm, int rollno, String sname, int midsem) {
		super();
		this.subnm = subnm;
		this.rollno = rollno;
		this.sname = sname;
		this.midsem = midsem;
	}

	public FinalData(String id,String subnm, int rollno, int intrtot, String sname) {
		super();
		this.id = id;
		this.subnm = subnm;
		this.rollno = rollno;
		this.sname = sname;
		this.intrtot = intrtot;
	}
	
	public FinalData(String id, int intrtot) {
		super();
		this.intrtot = intrtot;
		this.id = id;
	}
	
	public FinalData(int midsem, String id) {
		super();
		this.midsem = midsem;
		this.id = id;
	}
	
	public FinalData( String id, int finalsem, int grandtot) {
		super();
		this.finalsem = finalsem;
		this.grandtot = grandtot;
		this.id = id;
	}

	
	
	public FinalData(String id,String subnm, int rollno, String sname, int intrtot, int midsem, int finalsem, int grandtot) {
		super();
		this.subnm = subnm;
		this.rollno = rollno;
		this.sname = sname;
		this.intrtot = intrtot;
		this.midsem = midsem;
		this.finalsem = finalsem;
		this.grandtot = grandtot;
		this.id = id;
	}

	public String getSubnm() {
		return subnm;
	}

	public void setSubnm(String subnm) {
		this.subnm = subnm;
	}

	public int getRollno() {
		return rollno;
	}

	public void setRollno(int rollno) {
		this.rollno = rollno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getIntrtot() {
		return intrtot;
	}

	public void setIntrtot(int intrtot) {
		this.intrtot = intrtot;
	}

	public int getMidsem() {
		return midsem;
	}

	public void setMidsem(int midsem) {
		this.midsem = midsem;
	}

	public int getFinalsem() {
		return finalsem;
	}

	public void setFinalsem(int finalsem) {
		this.finalsem = finalsem;
	}

	public int getGrandtot() {
		return grandtot;
	}

	public void setGrandtot(int grandtot) {
		this.grandtot = grandtot;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "FinalData [subnm=" + subnm + ", rollno=" + rollno + ", sname=" + sname + ", intrtot=" + intrtot
				+ ", midsem=" + midsem + ", finalsem=" + finalsem + ", grandtot=" + grandtot + ", id=" + id + "]";
	}
	
}
