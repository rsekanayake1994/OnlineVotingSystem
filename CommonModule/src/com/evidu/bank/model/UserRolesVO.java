package com.evidu.bank.model;

public class UserRolesVO {

	private String USER_ROLE_ID;
	private String USER_ROLE_NAME;
	private String USER_PARENT_USER_TYPE;
	
	public String getUSER_ROLE_ID() {
		return USER_ROLE_ID;
	}
	public void setUSER_ROLE_ID(String USER_ROLE_ID) {
		this.USER_ROLE_ID = USER_ROLE_ID;
	}
	public String getUSER_ROLE_NAME() {
		return USER_ROLE_NAME;
	}
	public void setUSER_ROLE_NAME(String USER_ROLE_NAME) {
		this.USER_ROLE_NAME = USER_ROLE_NAME;
	}
	public String getUSER_PARENT_USER_TYPE() {
		return USER_PARENT_USER_TYPE;
	}
	public void setUSER_PARENT_USER_TYPE(
			String USER_PARENT_USER_TYPE) {
		this.USER_PARENT_USER_TYPE = USER_PARENT_USER_TYPE;
	}
}
