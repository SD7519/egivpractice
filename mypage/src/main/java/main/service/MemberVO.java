package main.service;

public class MemberVO {
	
	private String userid;
	private String userpass;
	private String email;
	private String name;
	private String birth;
	private String phonenum;
	
	private String emailh;
	private String emailt;
	
	
	public String getUsesrid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsesrpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	
	public String getEmailh() {
		return emailh;
	}
	public String getEmailt() {
		return emailt;
	}
	public void setEmailh(String emailh) {
		this.emailh = emailh;
	}
	public void setEmailt(String emailt) {
		this.emailt = emailt;
	}
	
}
