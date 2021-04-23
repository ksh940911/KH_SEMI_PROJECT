package com.kh.test.model;

import java.sql.Date;

public class Test {
	
	private int seq;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	
	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Test(int seq, String writer, String title, String content, Date regDate) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
