package com.exam.entity;

public class UploadMark {

	private int id;
	private String paperNm;
	private int marksUp;
	private String paperTy;
	private String marksFile;
	private String fmail;
	private int conf;
	
	public UploadMark() {
			super();
			// TODO Auto-generated constructor stub
		}

	

	public UploadMark(String paperNm, int marksUp, String paperTy, String marksFile, int conf) {
		super();
		this.paperNm = paperNm;
		this.marksUp = marksUp;
		this.paperTy = paperTy;
		this.marksFile = marksFile;
		this.conf = conf;
	}

	public UploadMark(String paperNm, int marksUp, String paperTy, String marksFile, String fmail) {
		super();
		this.paperNm = paperNm;
		this.marksUp = marksUp;
		this.paperTy = paperTy;
		this.marksFile = marksFile;
		this.fmail = fmail;
	}



	public UploadMark(int id, String paperNm, int marksUp, String paperTy, String marksFile, int conf) {
		super();
		this.id = id;
		this.paperNm = paperNm;
		this.marksUp = marksUp;
		this.paperTy = paperTy;
		this.marksFile = marksFile;
		this.conf = conf;
	}
	

	public UploadMark(String paperNm, int marksUp, String paperTy, String marksFile) {
		super();
		this.paperNm = paperNm;
		this.marksUp = marksUp;
		this.paperTy = paperTy;
		this.marksFile = marksFile;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPaperNm() {
		return paperNm;
	}

	public void setPaperNm(String paperNm) {
		this.paperNm = paperNm;
	}

	public int getMarksUp() {
		return marksUp;
	}

	public void setMarksUp(int marksUp) {
		this.marksUp = marksUp;
	}

	public String getPaperTy() {
		return paperTy;
	}

	public void setPaperTy(String paperTy) {
		this.paperTy = paperTy;
	}

	public String getMarksFile() {
		return marksFile;
	}

	public void setMarksFile(String marksFile) {
		this.marksFile = marksFile;
	}

	public int getConf() {
		return conf;
	}

	public void setConf(int conf) {
		this.conf = conf;
	}

	public String getFmail() {
		return fmail;
	}

	public void setFmail(String fmail) {
		this.fmail = fmail;
	}

	public UploadMark(int id, String paperNm, int marksUp, String paperTy, String marksFile, String fmail, int conf) {
		super();
		this.id = id;
		this.paperNm = paperNm;
		this.marksUp = marksUp;
		this.paperTy = paperTy;
		this.marksFile = marksFile;
		this.fmail = fmail;
		this.conf = conf;
	}
	
}
