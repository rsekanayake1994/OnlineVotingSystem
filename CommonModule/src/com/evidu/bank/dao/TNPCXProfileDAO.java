package com.evidu.bank.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.evidu.bank.entitiy.Account;
import com.evidu.bank.entitiy.TemporyAccount;
import com.evidu.bank.sva.DatabaseController;

public class TNPCXProfileDAO {
	
public Account getverifyKycDetails(String SQL)  {	
		Connection con = null;  
		Statement st = null;
		String kycNo="000000";
		Account acc = new Account();
		try {
			
			DatabaseController d = DatabaseController.getInstance();
			con=d.getConnection();
			ResultSet rs = null;
			st = (Statement)con.createStatement();			
			rs = st.executeQuery(SQL);
			System.out.println("SQL "+SQL);
			while( rs.next() ){
				
				//kycNo= rs.getString("TNP_CX_PROFILE_KYC_FORM_NO");
				acc.setTNP_CX_PROFILE_KYC_FORM_NO(rs.getString("TNP_CX_PROFILE_KYC_FORM_NO"));
				acc.setTNP_CX_PROFILE_GENDER(rs.getString("TNP_CX_PROFILE_GENDER"));
				acc.setTNP_CX_PROFILE_FATHER_NAME(rs.getString("TNP_CX_PROFILE_FATHER_NAME"));
				acc.setTNP_CX_PROFILE_MOTHER_NAME(rs.getString("TNP_CX_PROFILE_MOTHER_NAME"));
				acc.setTNP_CX_PROFILE_NOMINEE_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_NAME"));
				acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_HOUSE_NO"));
				acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_STREET(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_STREET"));
				acc.setTNP_CX_PROFILE_MAILING_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_HOUSE_NO"));
				acc.setTNP_CX_PROFILE_MAILING_ADDRESS_STREET(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_STREET"));
				acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_UNION(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_UNION"));;
				acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_STATE"));
				acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_CITY"));
				acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_POSTCODE(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_POSTCODE"));
				
			} 
		} catch (Exception e) {
			System.out.println("Error On verified account details : "+e.toString());
		}
		finally{  
			if (con != null){  
				try { 
					con.close(); 
            } catch (SQLException e) {
    	    }
	            con = null;
	          }  
		}
		return acc;
	}

}
