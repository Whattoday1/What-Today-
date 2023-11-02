package com.mit.DB;

import java.sql.Date;

public class Wish {
	private String wish_id;
	private String contents_id;
	private String user_id;
	
	private String contents_name;
	private String contents_img;
	private Date contents_day1;
	private Date contents_day2;
	
	
	public String getWish_id() {
		return wish_id;
	}
	public void setWish_id(String wish_id) {
		this.wish_id = wish_id;
	}
	public String getContents_id() {
		return contents_id;
	}
	public void setContents_id(String contents_id) {
		this.contents_id = contents_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContents_name() {
		return contents_name;
	}
	public void setContents_name(String contents_name) {
		this.contents_name = contents_name;
	}
	public String getContents_img() {
		return contents_img;
	}
	public void setContents_img(String contents_img) {
		this.contents_img = contents_img;
	}
	public Date getContents_day1() {
		return contents_day1;
	}
	public void setContents_day1(Date contents_day1) {
		this.contents_day1 = contents_day1;
	}
	public Date getContents_day2() {
		return contents_day2;
	}
	public void setContents_day2(Date contents_day2) {
		this.contents_day2 = contents_day2;
	}
	


	
	
		
}
