package com.evidu.bank.entitiy;

public class AccountImg {

	private String TNP_CX_PROFILE_IMAGES_PROFILE_UUID;
	private String TNP_CX_PROFILE_IMAGES_MOBILE_NUMBER;
	private String TNP_CX_PROFILE_IMAGES_REF_NO;
	private String TNP_CX_PROFILE_IMAGES_KYC_NO;
	private String TNP_CX_PROFILE_IMAGES_NID;
	private String TNP_CX_PROFILE_IMAGES_PHOTO; 
	private String TNP_CX_PROFILE_IMAGES_KYC_FORM;
	private String TNP_CX_PROFILE_IMAGES_TIN;
	private String TNP_CX_PROFILE_IMAGES_CITIZEN;
	private String TNP_CX_PROFILE_IMAGES_OTHER;
	private String TNP_CX_PROFILE_IMAGES_NFO1;
	private String TNP_CX_PROFILE_IMAGES_NFO2;
	private String TNP_CX_PROFILE_IMAGES_NFO3;
	private String TNP_CX_PROFILE_IMAGES_NFO4;
	private String TNP_CX_PROFILE_IMAGES_NFO5;
	private String TNP_CX_PROFILE_IMAGES_STATUS;
	private String image_nid;
	private String image_photo;
	private String image_kyc;
	private String image_tin;
	private String image_citizen;
	private String image_other;
	
	private String image_nid_path;
	private String image_photo_path;
	private String image_kyc_path;
	private String image_tin_path;
	private String image_citizen_path;
	private String image_other_path;
	
	private String lock_status;
	private String lock_by;
	private String lock_time;
	private String createDate;
	private String bankDate;
	
	private int OFFICER1_REJECT_COUNT;
	private int OFFICER2_REJECT_COUNT;
	
	
	public String getBankDate() {
		return bankDate;
	}
	public void setBankDate(String bankDate) {
		this.bankDate = bankDate;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getLock_status() {
		return lock_status;
	}
	public void setLock_status(String lock_status) {
		this.lock_status = lock_status;
	}
	public String getLock_by() {
		return lock_by;
	}
	public void setLock_by(String lock_by) {
		this.lock_by = lock_by;
	}
	public String getLock_time() {
		return lock_time;
	}
	public void setLock_time(String lock_time) {
		this.lock_time = lock_time;
	}
	public String getImage_nid() {
		return image_nid;
	}
	public void setImage_nid(String image_nid) {
		this.image_nid = image_nid;
	}
	public String getImage_photo() {
		return image_photo;
	}
	public void setImage_photo(String image_photo) {
		this.image_photo = image_photo;
	}
	public String getImage_kyc() {
		return image_kyc;
	}
	public void setImage_kyc(String image_kyc) {
		this.image_kyc = image_kyc;
	}
	public String getImage_tin() {
		return image_tin;
	}
	public void setImage_tin(String image_tin) {
		this.image_tin = image_tin;
	}
	public String getImage_citizen() {
		return image_citizen;
	}
	public void setImage_citizen(String image_citizen) {
		this.image_citizen = image_citizen;
	}
	public String getImage_other() {
		return image_other;
	}
	public void setImage_other(String image_other) {
		this.image_other = image_other;
	}
	public String getTNP_CX_PROFILE_IMAGES_KYC_NO() {
		return TNP_CX_PROFILE_IMAGES_KYC_NO;
	}
	public void setTNP_CX_PROFILE_IMAGES_KYC_NO(String tNP_CX_PROFILE_IMAGES_KYC_NO) {
		TNP_CX_PROFILE_IMAGES_KYC_NO = tNP_CX_PROFILE_IMAGES_KYC_NO;
	}
	public String getTNP_CX_PROFILE_IMAGES_PROFILE_UUID() {
		return TNP_CX_PROFILE_IMAGES_PROFILE_UUID;
	}
	public void setTNP_CX_PROFILE_IMAGES_PROFILE_UUID(String tNP_CX_PROFILE_IMAGES_PROFILE_UUID) {
		TNP_CX_PROFILE_IMAGES_PROFILE_UUID = tNP_CX_PROFILE_IMAGES_PROFILE_UUID;
	}
	public String getTNP_CX_PROFILE_IMAGES_MOBILE_NUMBER() {
		return TNP_CX_PROFILE_IMAGES_MOBILE_NUMBER;
	}
	public void setTNP_CX_PROFILE_IMAGES_MOBILE_NUMBER(String tNP_CX_PROFILE_IMAGES_MOBILE_NUMBER) {
		TNP_CX_PROFILE_IMAGES_MOBILE_NUMBER = tNP_CX_PROFILE_IMAGES_MOBILE_NUMBER;
	}
	public String getTNP_CX_PROFILE_IMAGES_REF_NO() {
		return TNP_CX_PROFILE_IMAGES_REF_NO;
	}
	public void setTNP_CX_PROFILE_IMAGES_REF_NO(String tNP_CX_PROFILE_IMAGES_REF_NO) {
		TNP_CX_PROFILE_IMAGES_REF_NO = tNP_CX_PROFILE_IMAGES_REF_NO;
	}
	public String getTNP_CX_PROFILE_IMAGES_NID() {
		return TNP_CX_PROFILE_IMAGES_NID;
	}
	public void setTNP_CX_PROFILE_IMAGES_NID(String tNP_CX_PROFILE_IMAGES_NID) {
		TNP_CX_PROFILE_IMAGES_NID = tNP_CX_PROFILE_IMAGES_NID;
	}
	public String getTNP_CX_PROFILE_IMAGES_PHOTO() {
		return TNP_CX_PROFILE_IMAGES_PHOTO;
	}
	public void setTNP_CX_PROFILE_IMAGES_PHOTO(String tNP_CX_PROFILE_IMAGES_PHOTO) {
		TNP_CX_PROFILE_IMAGES_PHOTO = tNP_CX_PROFILE_IMAGES_PHOTO;
	}
	public String getTNP_CX_PROFILE_IMAGES_KYC_FORM() {
		return TNP_CX_PROFILE_IMAGES_KYC_FORM;
	}
	public void setTNP_CX_PROFILE_IMAGES_KYC_FORM(String tNP_CX_PROFILE_IMAGES_KYC_FORM) {
		TNP_CX_PROFILE_IMAGES_KYC_FORM = tNP_CX_PROFILE_IMAGES_KYC_FORM;
	}
	
	public String getTNP_CX_PROFILE_IMAGES_OTHER() {
		return TNP_CX_PROFILE_IMAGES_OTHER;
	}
	public void setTNP_CX_PROFILE_IMAGES_OTHER(String tNP_CX_PROFILE_IMAGES_OTHER) {
		TNP_CX_PROFILE_IMAGES_OTHER = tNP_CX_PROFILE_IMAGES_OTHER;
	}
	public String getTNP_CX_PROFILE_IMAGES_NFO1() {
		return TNP_CX_PROFILE_IMAGES_NFO1;
	}
	public void setTNP_CX_PROFILE_IMAGES_NFO1(String tNP_CX_PROFILE_IMAGES_NFO1) {
		TNP_CX_PROFILE_IMAGES_NFO1 = tNP_CX_PROFILE_IMAGES_NFO1;
	}
	public String getTNP_CX_PROFILE_IMAGES_NFO2() {
		return TNP_CX_PROFILE_IMAGES_NFO2;
	}
	public void setTNP_CX_PROFILE_IMAGES_NFO2(String tNP_CX_PROFILE_IMAGES_NFO2) {
		TNP_CX_PROFILE_IMAGES_NFO2 = tNP_CX_PROFILE_IMAGES_NFO2;
	}
	public String getTNP_CX_PROFILE_IMAGES_NFO3() {
		return TNP_CX_PROFILE_IMAGES_NFO3;
	}
	public void setTNP_CX_PROFILE_IMAGES_NFO3(String tNP_CX_PROFILE_IMAGES_NFO3) {
		TNP_CX_PROFILE_IMAGES_NFO3 = tNP_CX_PROFILE_IMAGES_NFO3;
	}
	public String getTNP_CX_PROFILE_IMAGES_NFO4() {
		return TNP_CX_PROFILE_IMAGES_NFO4;
	}
	public void setTNP_CX_PROFILE_IMAGES_NFO4(String tNP_CX_PROFILE_IMAGES_NFO4) {
		TNP_CX_PROFILE_IMAGES_NFO4 = tNP_CX_PROFILE_IMAGES_NFO4;
	}
	public String getTNP_CX_PROFILE_IMAGES_NFO5() {
		return TNP_CX_PROFILE_IMAGES_NFO5;
	}
	public void setTNP_CX_PROFILE_IMAGES_NFO5(String tNP_CX_PROFILE_IMAGES_NFO5) {
		TNP_CX_PROFILE_IMAGES_NFO5 = tNP_CX_PROFILE_IMAGES_NFO5;
	}
	public String getTNP_CX_PROFILE_IMAGES_TIN() {
		return TNP_CX_PROFILE_IMAGES_TIN;
	}
	public void setTNP_CX_PROFILE_IMAGES_TIN(String tNP_CX_PROFILE_IMAGES_TIN) {
		TNP_CX_PROFILE_IMAGES_TIN = tNP_CX_PROFILE_IMAGES_TIN;
	}
	public String getTNP_CX_PROFILE_IMAGES_CITIZEN() {
		return TNP_CX_PROFILE_IMAGES_CITIZEN;
	}
	public void setTNP_CX_PROFILE_IMAGES_CITIZEN(String tNP_CX_PROFILE_IMAGES_CITIZEN) {
		TNP_CX_PROFILE_IMAGES_CITIZEN = tNP_CX_PROFILE_IMAGES_CITIZEN;
	}
	public String getTNP_CX_PROFILE_IMAGES_STATUS() {
		return TNP_CX_PROFILE_IMAGES_STATUS;
	}
	public void setTNP_CX_PROFILE_IMAGES_STATUS(String tNP_CX_PROFILE_IMAGES_STATUS) {
		TNP_CX_PROFILE_IMAGES_STATUS = tNP_CX_PROFILE_IMAGES_STATUS;
	}
	public String getImage_nid_path() {
		return image_nid_path;
	}
	public void setImage_nid_path(String image_nid_path) {
		this.image_nid_path = image_nid_path;
	}
	public String getImage_photo_path() {
		return image_photo_path;
	}
	public void setImage_photo_path(String image_photo_path) {
		this.image_photo_path = image_photo_path;
	}
	public String getImage_kyc_path() {
		return image_kyc_path;
	}
	public void setImage_kyc_path(String image_kyc_path) {
		this.image_kyc_path = image_kyc_path;
	}
	public String getImage_tin_path() {
		return image_tin_path;
	}
	public void setImage_tin_path(String image_tin_path) {
		this.image_tin_path = image_tin_path;
	}
	public String getImage_citizen_path() {
		return image_citizen_path;
	}
	public void setImage_citizen_path(String image_citizen_path) {
		this.image_citizen_path = image_citizen_path;
	}
	public String getImage_other_path() {
		return image_other_path;
	}
	public void setImage_other_path(String image_other_path) {
		this.image_other_path = image_other_path;
	}
	public int getOFFICER1_REJECT_COUNT() {
		return OFFICER1_REJECT_COUNT;
	}
	public void setOFFICER1_REJECT_COUNT(int oFFICER1_REJECT_COUNT) {
		OFFICER1_REJECT_COUNT = oFFICER1_REJECT_COUNT;
	}
	public int getOFFICER2_REJECT_COUNT() {
		return OFFICER2_REJECT_COUNT;
	}
	public void setOFFICER2_REJECT_COUNT(int oFFICER2_REJECT_COUNT) {
		OFFICER2_REJECT_COUNT = oFFICER2_REJECT_COUNT;
	}
	

}
