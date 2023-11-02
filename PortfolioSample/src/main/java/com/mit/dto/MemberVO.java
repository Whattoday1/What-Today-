package com.mit.dto;

import java.sql.Date;

public class MemberVO {
	private String user_id;
	private String user_name;
	private String user_nickname;
	private String user_pw;
	private String user_gender;
	private Date user_birth;
	private String user_mail;
	private String user_image;
	private String user_mailing;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public Date getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getUser_image() {
		return user_image;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	public String getUser_mailing() {
		return user_mailing;
	}
	public void setUser_mailing(String user_mailing) {
		this.user_mailing = user_mailing;
	}
	
	@Override
	public String toString() {
		return "MemberVO [user_id=" + user_id + ", user_name=" + user_name + ", user_nickname=" + user_nickname
				+ ", user_pw=" + user_pw + ", user_gender=" + user_gender + ", user_birth=" + user_birth + ", user_mail=" + user_mail + ", user_image=" + user_image + ", user_mailing=" + user_mailing
				+ "]";
	}
	
}
