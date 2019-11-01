package com.evidu.secure;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.evidu.secure.*;

import com.evidu.bank.sva.DatabaseController;

public class ChangeAllPwd {

	static PreparedStatement statement;
	static Connection con = null;
	Statement st = null;

	public static void main(String[] args) {

		getPasswordData();
		
	}
	
	public static void getPasswordData() {
		
		String SqlSelect = "SELECT * FROM tnp_dataentry_users";
		
		try {
			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();
			statement = con.prepareStatement(SqlSelect);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				String id = rs.getString("TNP_DATAENTRY_USER_AUTOID");
				String pwd = rs.getString("TNP_DATAENTRY_USER_PASSWORD");

				System.out.println("Password = "+pwd+" | Id = " + id);

				updatePwd(id, pwd);
			}
		} catch (Exception e) {
			System.out.println("Error On selecting data : " + e.toString());
		}
	}
	
	public static void updatePwd(String id, String pwd) {

		String updatedPwd = "";
		Secure sec;
		//EncryptionDecryptionAES encryptAES;
		try {
			sec = new Secure();
			updatedPwd = sec.encrypt(pwd);
			//encryptAES = new EncryptionDecryptionAES();
			//updatedPwd = EncryptionDecryptionAES.getKey(pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error in Secure class based object creation "+e.toString());
		}

		// find last character
		String lastChar = pwd.substring(pwd.length() - 1);

		System.out.println("Last Char is : " + lastChar);

		if (lastChar.equals("=")) {
			System.out.println("Password ("+pwd+") is allready encrypted....");
		} else if(!lastChar.equals("=")) {
			//System.out.println("Password ("+pwd+") is must encrypted....");
			String SqlChange = "UPDATE `tnp_dataentry_users` SET `TNP_DATAENTRY_USER_PASSWORD` = '" + updatedPwd
					+ "' WHERE TNP_DATAENTRY_USER_AUTOID = '" + id + "'";

			try {
				statement = con.prepareStatement(SqlChange);
				int row = statement.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Error while updating passwords "+e);
			}

		}else {
			System.out.println(".....else.....");
		}

//		if (con != null) {
//			try {
//				con.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}

	}
}
