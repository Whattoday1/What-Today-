package com.mit.DB;

import java.sql.Date;

public class Post {
	private String po_id;
	private String user_id;
	private String po_category;
	private String po_title;
	private String po_contents;
	private Date po_date;
	private int po_rec; //추천수
	private String po_file; //파일
	private int po_count; //조회수
	
	
	
	public String getPo_id() {
		return po_id;
	}
	public void setPo_id(String po_id) {
		this.po_id = po_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPo_category() {
		return po_category;
	}
	public void setPo_category(String po_category) {
		this.po_category = po_category;
	}
	public String getPo_title() {
		return po_title;
	}
	public void setPo_title(String po_title) {
		this.po_title = po_title;
	}
	public String getPo_contents() {
		return po_contents;
	}
	public void setPo_contents(String po_contents) {
		this.po_contents = po_contents;
	}
	public Date getPo_date() {
		return po_date;
	}
	public void setPo_date(Date po_date) {
		this.po_date = po_date;
	}
	public int getPo_rec() {
		return po_rec;
	}
	public void setPo_rec(int po_rec) {
		this.po_rec = po_rec;
	}
	public String getPo_file() {
		return po_file;
	}
	public void setPo_file(String po_file) {
		this.po_file = po_file;
	}
	public int getPo_count() {
		return po_count;
	}
	public void setPo_count(int po_count) {
		this.po_count = po_count;
	}
	
	
		
}
