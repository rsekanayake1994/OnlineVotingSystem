package com.evidu.bank.model;

public class VoterVO {
	private String voter_id;
	private String voter_name;
	private String username;
	private String password;
	private String mobile;
	private String department;
	private String email;
	private String status;
	private String usertype;
	private String election_id;
	private String login_status;
	private int login_attempts;
	private int count;
	private int userid;

	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int i) {
		this.count = i;
	}
	public String getVoter_id() {
		return voter_id;
	}
	public void setVoter_id(String voter_id) {
		this.voter_id = voter_id;
	}
	public String getVoter_name() {
		return voter_name;
	}
	public void setVoter_name(String voter_name) {
		this.voter_name = voter_name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getElection_id() {
		return election_id;
	}
	public void setElection_id(String election_id) {
		this.election_id = election_id;
	}
	public String getLogin_status() {
		return login_status;
	}
	public void setLogin_status(String login_status) {
		this.login_status = login_status;
	}
	public int getLogin_attempts() {
		return login_attempts;
	}
	public void setLogin_attempts(int login_attempts) {
		this.login_attempts = login_attempts;
	}

}
