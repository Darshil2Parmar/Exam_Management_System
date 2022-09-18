package com.exam.entity;

public class QuestionsMcq {

		
		private int subid;
		private String question;
		private String a;
		private String b;
		private String c;
		private String d;
		private String answer;
		private int subId;
		private int marks;
		private int examid;
		private String MyAns;
		
		
		@Override
		public String toString() {
			return "QuestionsMcq [subid=" + subid + ", question=" + question + ", a=" + a + ", b=" + b + ", c=" + c
					+ ", d=" + d + ", answer=" + answer + ", subId=" + subId + ", marks=" + marks + ", examid=" + examid
					+ ", MyAns=" + MyAns + "]";
		}

		@Override
		public int hashCode() {
		// TODO Auto-generated method stub
		return question.length()+answer.length()+a.length();
		}

		@Override
		public boolean equals(Object obj) {
		// TODO Auto-generated method stub
			return (this.question.equals(((QuestionsMcq)obj).question)&&this.answer.equals(((QuestionsMcq)obj).answer)&&this.a.equals(((QuestionsMcq)obj).a)&&this.b.equals(((QuestionsMcq)obj).b)&&this.c.equals(((QuestionsMcq)obj).c)&&this.d.equals(((QuestionsMcq)obj).d));	 
		}
		
		public QuestionsMcq(String question, String a, String b, String c, String d, String answer, int subId,int marks) {
		super();
		this.question = question;
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
		this.answer = answer;
		this.subId = subId;
		this.marks = marks;
	}
		
		
		
		public QuestionsMcq(int subid, String question, String a, String b, String c, String d, String answer,
				int subId2, int marks, int examid) {
			super();
			this.subid = subid;
			this.question = question;
			this.a = a;
			this.b = b;
			this.c = c;
			this.d = d;
			this.answer = answer;
			subId = subId2;
			this.marks = marks;
			this.examid = examid;
		}



		public int getSubid() {
			return subid;
		}

		public void setSubid(int subid) {
			this.subid = subid;
		}

		public int getExamid() {
			return examid;
		}

		public void setExamid(int examid) {
			this.examid = examid;
		}

		public QuestionsMcq() {
			super();
		}
		
		public int getMarks() {
			return marks;
		}

		public void setMarks(int marks) {
			this.marks = marks;
		}

		public int getSubId() {
			return subId;
		}
		public void setSubId(int subId) {
			this.subId = subId;
		}
		public String getQuestion() {
			return question;
		}
		public void setQuestion(String question) {
			this.question = question;
		}
		public String getA() {
			return a;
		}
		public void setA(String a) {
			this.a = a;
		}
		public String getB() {
			return b;
		}
		public void setB(String b) {
			this.b = b;
		}
		public String getC() {
			return c;
		}
		public void setC(String c) {
			this.c = c;
		}
		public String getD() {
			return d;
		}
		public void setD(String d) {
			this.d = d;
		}
		public String getAnswer() {
			return answer;
		}
		public void setAnswer(String answer) {
			this.answer = answer;
		}

		public String getMyAns() {
			return MyAns;
		}

		public void setMyAns(String myAns) {
			MyAns = myAns;
		}
		
		
}
