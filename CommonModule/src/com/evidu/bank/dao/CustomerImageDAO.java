package com.evidu.bank.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.evidu.bank.model.CustomerImagesVO;
import com.evidu.bank.sva.DatabaseController;

public class CustomerImageDAO {

	public CustomerImagesVO getCustomerImagesVO(String uuid) {
		Connection connection = null;
		Statement statement = null;
		CustomerImagesVO customerImagesVO = null;
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			String query = "SELECT * FROM tnp_cx_profile_images WHERE TNP_CX_PROFILE_IMAGES_PROFILE_UUID='"+ uuid + "'";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				customerImagesVO = new CustomerImagesVO();
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_AUTOID(rs.getInt("tNP_CX_PROFILE_IMAGES_AUTOID"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM(rs.getBytes("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_CREATE_DATE(rs.getDate("TNP_CX_PROFILE_IMAGES_CREATE_DATE"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_CREATEBY(rs.getString("TNP_CX_PROFILE_IMAGES_CREATEBY"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_KYC_FORM(rs.getBytes("TNP_CX_PROFILE_IMAGES_KYC_FORM"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_KYC_NO(rs.getString("TNP_CX_PROFILE_IMAGES_KYC_NO"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_IMAGES_MOBILE_NUMBER"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_NFO1(rs.getString("TNP_CX_PROFILE_IMAGES_NFO1"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_NFO2(rs.getString("TNP_CX_PROFILE_IMAGES_NFO2"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_NFO3(rs.getString("TNP_CX_PROFILE_IMAGES_NFO3"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_NFO4(rs.getString("TNP_CX_PROFILE_IMAGES_NFO4"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_NFO5(rs.getString("TNP_CX_PROFILE_IMAGES_NFO5"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_NID(rs.getBytes("TNP_CX_PROFILE_IMAGES_NID"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_OTHER(rs.getBytes("TNP_CX_PROFILE_IMAGES_OTHER"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_PHOTO(rs.getBytes("TNP_CX_PROFILE_IMAGES_PHOTO"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_IMAGES_PROFILE_UUID"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_REF_NO(rs.getString("TNP_CX_PROFILE_IMAGES_REF_NO"));
				customerImagesVO.setTNP_CX_PROFILE_IMAGES_TIN_FORM(rs.getBytes("TNP_CX_PROFILE_IMAGES_TIN_FORM"));
				

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return customerImagesVO;
	}

	/*
	 * public byte[] getTNP_CX_PROFILE_IMAGES_PHOTO( ) { Connection con = null;
	 * Statement statement = null;
	 * 
	 * try { DatabaseController d = DatabaseController.getInstance(); con =
	 * (Connection) d.getConnection(); String query =
	 * "SELECT TNP_CX_PROFILE_IMAGES_PHOTO FROM tnp_cx_profile_images WHERE TNP_CX_PROFILE_IMAGES_PROFILE_UUID='"
	 * + uuid + "'"; ResultSet rs = null; statement = (Statement)
	 * con.createStatement(); rs = statement.executeQuery(query);
	 * System.out.println("SQL " + query); while (rs.next()) {
	 * TNP_CX_PROFILE_IMAGES_PHOTO = rs
	 * .getBytes("TNP_CX_PROFILE_IMAGES_PHOTO"); } } catch (SQLException e) { //
	 * TODO Auto-generated catch block e.printStackTrace(); } finally { if (con
	 * != null) { try { con.close(); } catch (SQLException e) { } con = null; }
	 * } return TNP_CX_PROFILE_IMAGES_PHOTO; }
	 */

	/*
	public byte[] getTNP_CX_PROFILE_IMAGES_NID() {
		Connection con = null;
		Statement statement = null;
		byte[] TNP_CX_PROFILE_IMAGES_NID = null;
		
		try {
			DatabaseController d = DatabaseController.getInstance();
			con = (Connection) d.getConnection();
			String query = "SELECT TNP_CX_PROFILE_IMAGES_NID FROM tnp_cx_profile_images WHERE TNP_CX_PROFILE_IMAGES_PROFILE_UUID='"
					+ uuid + "'";
			ResultSet rs = null;
			statement = (Statement) con.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				TNP_CX_PROFILE_IMAGES_NID = rs
						.getBytes("TNP_CX_PROFILE_IMAGES_NID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
				con = null;
			}
		}
		return TNP_CX_PROFILE_IMAGES_NID;
	}
	*/														 
															 
}
