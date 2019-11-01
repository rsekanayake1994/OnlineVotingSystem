package com.evidu.bank.model;

public class ElectionsVO {
	private int election_id;

	private String election_name;
	private String status;
	private String startdate;
	private String enddate;
	private String userid;
	private String faculty;
	private String election_type;
	public String getElection_type() {
		return election_type;
	}
	public void setElection_type(String election_type ) {
		this.election_type = election_type;
	}
	public String getFaculty() {
		return faculty;
	}
	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	public String getElection_name() {
		return election_name;
	}
	public void setElection_name(String election_name) {
		this.election_name = election_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getElection_id() {
		return election_id;
	}
	public void setElection_id(int election_id) {
		this.election_id = election_id;
	}
}
