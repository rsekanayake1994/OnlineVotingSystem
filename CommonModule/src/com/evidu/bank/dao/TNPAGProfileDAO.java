package com.evidu.bank.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.evidu.bank.sva.DatabaseController;

public class TNPAGProfileDAO {
	
	public String getKycNo(String SQL)  {	
		Connection con = null;  
		Statement st = null;
		String kycNo="000000";
		
		try {
			DatabaseController d = DatabaseController.getInstance();
			con=d.getConnection();
			ResultSet rs = null;
			st = (Statement)con.createStatement();			
			rs = st.executeQuery(SQL);
			System.out.println("SQL "+SQL);
			while( rs.next() ){
				
				kycNo= rs.getString("TNP_AG_PROFILE_KYC_FORM_NO");
				
			} 
		} catch (Exception e) {
			System.out.println("Error On TNP_AG_PROFILE_KYC_FORM_NO details : "+e.toString());
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
		return kycNo;
	}

}
