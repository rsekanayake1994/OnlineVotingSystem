package com.evidu.bank.sva;

import java.sql.Blob;

public class BOApprovedStatus {
	
	private String id;
	private String refNo;
	private String accountName;
	private String cutomer;
	private String mobileNo;
	private String status;
	private String totalPending;
	private String fatherName;
	private String motherName;
	private String spouseName;
	private String birthday;
	private String profession;
	private String sourceIncome;
	private String otherBankName;
	private String otherAccountNo;
	private String otherBranchName;
	private String idType;
	private String idNumber;
	private String mailHome;
	private String mailStreet;
	private String mailCity;
	private String mailstate;
	private String permentHome;
	private String permanatStreet;
	private String permentCity;
	private String permanatState;
	private String anticipatedAmount;
	private String nomineeName;
	private String nomineeBranch;
	private String nomineeFather;
	private String nomineeMother;
	private String nomineeHome;
	private String nomineeStreet;
	private String nomineeCity;
	private String nomineeState;
	private String nomineeContactNumber;
	private String clientIdVerfy;
	private String faceInterview;
	private Blob userImg;
	private Blob nicImg;
	private String blobimge;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Blob getUserImg() {
		return userImg;
	}
	public void setUserImg(Blob userImg) {
		this.userImg = userImg;
	}
	public Blob getNicImg() {
		return nicImg;
	}
	public void setNicImg(Blob nicImg) {
		this.nicImg = nicImg;
	}
	public String getBlobimge() {
		return blobimge;
	}
	public void setBlobimge(String blobimge) {
		this.blobimge = blobimge;
	}
	public String getMailstate() {
		return mailstate;
	}
	public void setMailstate(String mailstate) {
		this.mailstate = mailstate;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getSpouseName() {
		return spouseName;
	}
	public void setSpouseName(String spouseName) {
		this.spouseName = spouseName;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getSourceIncome() {
		return sourceIncome;
	}
	public void setSourceIncome(String sourceIncome) {
		this.sourceIncome = sourceIncome;
	}
	public String getOtherBankName() {
		return otherBankName;
	}
	public void setOtherBankName(String otherBankName) {
		this.otherBankName = otherBankName;
	}
	public String getOtherAccountNo() {
		return otherAccountNo;
	}
	public void setOtherAccountNo(String otherAccountNo) {
		this.otherAccountNo = otherAccountNo;
	}
	public String getOtherBranchName() {
		return otherBranchName;
	}
	public void setOtherBranchName(String otherBranchName) {
		this.otherBranchName = otherBranchName;
	}
	public String getIdType() {
		return idType;
	}
	public void setIdType(String idType) {
		this.idType = idType;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getMailHome() {
		return mailHome;
	}
	public void setMailHome(String mailHome) {
		this.mailHome = mailHome;
	}
	public String getMailStreet() {
		return mailStreet;
	}
	public void setMailStreet(String mailStreet) {
		this.mailStreet = mailStreet;
	}
	public String getMailCity() {
		return mailCity;
	}
	public void setMailCity(String mailCity) {
		this.mailCity = mailCity;
	}
	public String getPermentHome() {
		return permentHome;
	}
	public void setPermentHome(String permentHome) {
		this.permentHome = permentHome;
	}
	public String getPermanatStreet() {
		return permanatStreet;
	}
	public void setPermanatStreet(String permanatStreet) {
		this.permanatStreet = permanatStreet;
	}
	public String getPermentCity() {
		return permentCity;
	}
	public void setPermentCity(String permentCity) {
		this.permentCity = permentCity;
	}
	public String getPermanatState() {
		return permanatState;
	}
	public void setPermanatState(String permanatState) {
		this.permanatState = permanatState;
	}
	public String getAnticipatedAmount() {
		return anticipatedAmount;
	}
	public void setAnticipatedAmount(String anticipatedAmount) {
		this.anticipatedAmount = anticipatedAmount;
	}
	public String getNomineeName() {
		return nomineeName;
	}
	public void setNomineeName(String nomineeName) {
		this.nomineeName = nomineeName;
	}
	public String getNomineeBranch() {
		return nomineeBranch;
	}
	public void setNomineeBranch(String nomineeBranch) {
		this.nomineeBranch = nomineeBranch;
	}
	public String getNomineeFather() {
		return nomineeFather;
	}
	public void setNomineeFather(String nomineeFather) {
		this.nomineeFather = nomineeFather;
	}
	public String getNomineeMother() {
		return nomineeMother;
	}
	public void setNomineeMother(String nomineeMother) {
		this.nomineeMother = nomineeMother;
	}
	public String getNomineeHome() {
		return nomineeHome;
	}
	public void setNomineeHome(String nomineeHome) {
		this.nomineeHome = nomineeHome;
	}
	public String getNomineeStreet() {
		return nomineeStreet;
	}
	public void setNomineeStreet(String nomineeStreet) {
		this.nomineeStreet = nomineeStreet;
	}
	public String getNomineeCity() {
		return nomineeCity;
	}
	public void setNomineeCity(String nomineeCity) {
		this.nomineeCity = nomineeCity;
	}
	public String getNomineeState() {
		return nomineeState;
	}
	public void setNomineeState(String nomineeState) {
		this.nomineeState = nomineeState;
	}
	public String getNomineeContactNumber() {
		return nomineeContactNumber;
	}
	public void setNomineeContactNumber(String nomineeContactNumber) {
		this.nomineeContactNumber = nomineeContactNumber;
	}
	public String getClientIdVerfy() {
		return clientIdVerfy;
	}
	public void setClientIdVerfy(String clientIdVerfy) {
		this.clientIdVerfy = clientIdVerfy;
	}
	public String getFaceInterview() {
		return faceInterview;
	}
	public void setFaceInterview(String faceInterview) {
		this.faceInterview = faceInterview;
	}
	public String getTotalPending() {
		return totalPending;
	}
	public void setTotalPending(String totalPending) {
		this.totalPending = totalPending;
	}
	public String getRefNo() {
		return refNo;
	}
	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getCutomer() {
		return cutomer;
	}
	public void setCutomer(String cutomer) {
		this.cutomer = cutomer;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
