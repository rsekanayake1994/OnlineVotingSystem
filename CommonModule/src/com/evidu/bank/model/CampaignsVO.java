package com.evidu.bank.model;

public class CampaignsVO {

	private int campid;
	private String campname;
	private int userid;
	private String organization;
	private String createddate;
	private String csvname;
	public int getCampid() {
		return campid;
	}
	public void setCampid(int campid) {
		this.campid = campid;
	}
	public String getCampname() {
		return campname;
	}
	public void setCampname(String campname) {
		this.campname = campname;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}
	public String getCreateddate() {
		return createddate;
	}
	public void setCreateddate(String createddate) {
		this.createddate = createddate;
	}
	public String getCsvname() {
		return csvname;
	}
	public void setCsvname(String csvname) {
		this.csvname = csvname;
	}
	
}
