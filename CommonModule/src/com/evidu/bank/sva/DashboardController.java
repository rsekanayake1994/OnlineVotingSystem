package com.evidu.bank.sva;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;

import com.evidu.bank.entitiy.*;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DashboardController {
	
	public UserInfo getlogCurrentUserDetails(String SQL){
			
			UserInfo uInfo = new UserInfo();
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				DatabaseController dc = DatabaseController.getInstance();
				con = (Connection) dc.getConnection();
	
				stmt = con.createStatement();
	
				rs = stmt.executeQuery(SQL);
				
				while(rs.next()) {
//					
//					uInfo.setTNP_DATAENTRY_USER_ID(rs.getString("TNP_DATAENTRY_USER_ID"));
//					uInfo.setTNP_DATAENTRY_USER_NAME(rs.getString("TNP_DATAENTRY_USER_NAME"));
//					uInfo.setTNP_DATAENTRY_USER_PASSWORD(rs.getString("TNP_DATAENTRY_USER_PASSWORD"));
//					uInfo.setTNP_DATAENTRY_USER_PARENT_ID(rs.getString("TNP_DATAENTRY_USER_PARENT_ID"));
//					uInfo.setTNP_DATAENTRY_USER_OWNER_ID(rs.getString("TNP_DATAENTRY_USER_OWNER_ID"));
//					uInfo.setTNP_DATAENTRY_USER_ROLE(rs.getString("TNP_DATAENTRY_USER_ROLE"));
//					uInfo.setTNP_DATAENTRY_USER_FULLNAME(rs.getString("TNP_DATAENTRY_USER_FULLNAME"));
//					uInfo.setTNP_DATAENTRY_USER_PHONE(rs.getString("TNP_DATAENTRY_USER_PHONE"));
//					uInfo.setTNP_DATAENTRY_USER_EMAIL(rs.getString("TNP_DATAENTRY_USER_EMAIL"));
//					uInfo.setTNP_DATAENTRY_USER_ADDRESS_HOUSE_NO(rs.getString("TNP_DATAENTRY_USER_ADDRESS_HOUSE_NO"));
//					uInfo.setTNP_DATAENTRY_USER_ADDRESS_CITY(rs.getString("TNP_DATAENTRY_USER_ADDRESS_CITY"));
//					uInfo.setTNP_DATAENTRY_USER_ADDRESS_STATE(rs.getString("TNP_DATAENTRY_USER_ADDRESS_STATE"));
//					uInfo.setTNP_DATAENTRY_USER_ADDRESS_STREET(rs.getString("TNP_DATAENTRY_USER_ADDRESS_STREET"));
//					uInfo.setTNP_DATAENTRY_USER_ADDRESS_DISTRICT(rs.getString("TNP_DATAENTRY_USER_ADDRESS_DISTRICT"));
//					uInfo.setTNP_DATAENTRY_USER_ADDRESS_THANA(rs.getString("TNP_DATAENTRY_USER_ADDRESS_THANA"));
//					uInfo.setTNP_DATAENTRY_USER_ADDRESS_UNION(rs.getString("TNP_DATAENTRY_USER_ADDRESS_UNION"));
//					uInfo.setTNP_DATAENTRY_USER_ADDRESS_DIVISION(rs.getString("TNP_DATAENTRY_USER_ADDRESS_DIVISION"));
//					uInfo.setTNP_DATAENTRY_USER_ADDRESS_POSTCODE(rs.getString("TNP_DATAENTRY_USER_ADDRESS_POSTCODE"));
//					uInfo.setTNP_DATAENTRY_USER_CREATED_BY(rs.getString("TNP_DATAENTRY_USER_CREATED_BY"));
//					uInfo.setTNP_DATAENTRY_USER_CREATED_DATE(rs.getString("TNP_DATAENTRY_USER_CREATED_DATE"));
//					uInfo.setTNP_DATAENTRY_USER_CREATED_BRANCH(rs.getString("TNP_DATAENTRY_USER_CREATED_BRANCH"));
//					uInfo.setTNP_DATAENTRY_USER_LAST_LOGIN_DATE(rs.getString("TNP_DATAENTRY_USER_LAST_LOGIN_DATE"));
//					uInfo.setTNP_DATAENTRY_STATUS(rs.getString("TNP_DATAENTRY_STATUS"));
//					/*uInfo.setLast_login_date(rs.getString("LAST_LOGIN_DATE"));*/
					}
				
			} catch (Exception e) {
				System.out.println("Error in get log Current User Details(String sql) method"+e);
				e.printStackTrace();
			}
	
			// to close DB connection
			finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						System.out.println("error in connection close "+e);
					}
					con = null;
				}
			}
			
			return uInfo;
		}
	
	public static Integer getTotalApplication(String SQL) throws SQLException{

	   // List<Integer> countlist = new ArrayList<Integer>();
		int count=0;
	    Connection connection = null;
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();

	   Statement stmt = null;
	   ResultSet rs=null;

	   try {
	        stmt = (Statement) connection.createStatement();
	        rs = stmt.executeQuery(SQL);
	        while (rs.next()){
	           count=Integer.parseInt(rs.getString("count"));
	        }
	   
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	finally{
	        try {
	            connection.close();
	            stmt.close();
	        }catch (SQLException e) {

	            e.printStackTrace();
	        }
	}

	return count;

	}
	
	public static Integer getvofVerifiedCount(String SQL) throws SQLException{

		   // List<Integer> countlist = new ArrayList<Integer>();
			int count=0;
		    Connection connection = null;
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

		   Statement stmt = null;
		   ResultSet rs=null;

		   try {
		        stmt = (Statement) connection.createStatement();
		        rs = stmt.executeQuery(SQL);
		        while (rs.next()){
		           count=Integer.parseInt(rs.getString("count"));
		        }
		   
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		finally{
		        try {
		            connection.close();
		            stmt.close();
		        }catch (SQLException e) {

		            e.printStackTrace();
		        }
		}

		return count;

		}
	
	public static Integer getvof_reject_count(String SQL) throws SQLException{

		   // List<Integer> countlist = new ArrayList<Integer>();
			int count=0;
		    Connection connection = null;
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

		   Statement stmt = null;
		   ResultSet rs=null;

		   try {
		        stmt = (Statement) connection.createStatement();
		        rs = stmt.executeQuery(SQL);
		        while (rs.next()){
		           count=Integer.parseInt(rs.getString("count"));
		        }
		   
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		finally{
		        try {
		            connection.close();
		            stmt.close();
		        }catch (SQLException e) {

		            e.printStackTrace();
		        }
		}

		return count;

		}
	
	
	public static Integer getuploadPendingCountS(String SQL) throws SQLException{

		   // List<Integer> countlist = new ArrayList<Integer>();
			int count=0;
		    Connection connection = null;
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

		   Statement stmt = null;
		   ResultSet rs=null;

		   try {
		        stmt = (Statement) connection.createStatement();
		        rs = stmt.executeQuery(SQL);
		        while (rs.next()){
		           count=Integer.parseInt(rs.getString("count"));
		        }
		   
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		finally{
		        try {
		            connection.close();
		            stmt.close();
		        }catch (SQLException e) {

		            e.printStackTrace();
		        }
		}

		return count;

		}
	
	public static Integer getagentUploadPendingCountS(String SQL) throws SQLException{

		   // List<Integer> countlist = new ArrayList<Integer>();
			int count=0;
		    Connection connection = null;
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

		   Statement stmt = null;
		   ResultSet rs=null;

		   try {
		        stmt = (Statement) connection.createStatement();
		        rs = stmt.executeQuery(SQL);
		        while (rs.next()){
		           count=Integer.parseInt(rs.getString("count"));
		        }
		   
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		finally{
		        try {
		            connection.close();
		            stmt.close();
		        }catch (SQLException e) {

		            e.printStackTrace();
		        }
		}

		return count;

		}
	
	
	public static Integer getagentVeryfyCountS(String SQL) throws SQLException{

		   // List<Integer> countlist = new ArrayList<Integer>();
			int count=0;
		    Connection connection = null;
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

		   Statement stmt = null;
		   ResultSet rs=null;

		   try {
		        stmt = (Statement) connection.createStatement();
		        rs = stmt.executeQuery(SQL);
		        while (rs.next()){
		           count=Integer.parseInt(rs.getString("count"));
		        }
		   
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		finally{
		        try {
		            connection.close();
		            stmt.close();
		        }catch (SQLException e) {

		            e.printStackTrace();
		        }
		}

		return count;

		}
	
	public static Integer getagentRejectCountS(String SQL) throws SQLException{

		   // List<Integer> countlist = new ArrayList<Integer>();
			int count=0;
		    Connection connection = null;
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

		   Statement stmt = null;
		   ResultSet rs=null;

		   try {
		        stmt = (Statement) connection.createStatement();
		        rs = stmt.executeQuery(SQL);
		        System.out.println("SQL : "+SQL);
		        while (rs.next()){
		           count=Integer.parseInt(rs.getString("count"));
		        }
		   
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		finally{
		        try {
		            connection.close();
		            stmt.close();
		        }catch (SQLException e) {

		            e.printStackTrace();
		        }
		}

		return count;

		}
	
	
	public static Integer getTemporyPendingCount(String SQL){

		   // List<Integer> countlist = new ArrayList<Integer>();
			int count=0;
		    Connection connection = null;
		    Statement stmt = null;
			ResultSet rs=null;
		   try {
			   DatabaseController d = DatabaseController.getInstance();
				connection =(Connection) d.getConnection();

		        stmt = (Statement) connection.createStatement();
		        rs = stmt.executeQuery(SQL);
		        while (rs.next()){
		           count=Integer.parseInt(rs.getString("count"));
		        }
		   
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		finally{
			
			if (connection != null) { 
			    try { 
			     connection.close(); 
			    }catch (SQLException e) {
			     
			    }
			    connection = null;
			   }
		       /* try {
		            connection.close();
		            stmt.close();
		        }catch (SQLException e) {

		            e.printStackTrace();
		        }*/
		}

		return count;

		}
	
	public static Integer getCXImgApprovalCount(String SQL) throws SQLException{

		   // List<Integer> countlist = new ArrayList<Integer>();
			int count=0;
		    Connection connection = null;
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

		   Statement stmt = null;
		   ResultSet rs=null;

		   try {
		        stmt = (Statement) connection.createStatement();
		        rs = stmt.executeQuery(SQL);
		        while (rs.next()){
		           count=Integer.parseInt(rs.getString("count"));
		        }
		   
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		finally{
		        try {
		            connection.close();
		            stmt.close();
		        }catch (SQLException e) {

		            e.printStackTrace();
		        }
		}

		return count;

		}
	
	public static Integer getTemporyRejectCountResult(String SQL) throws SQLException{

		   // List<Integer> countlist = new ArrayList<Integer>();
			int count=0;
		    Connection connection = null;
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

		   Statement stmt = null;
		   ResultSet rs=null;

		   try {
		        stmt = (Statement) connection.createStatement();
		        rs = stmt.executeQuery(SQL);
		        while (rs.next()){
		           count=Integer.parseInt(rs.getString("count"));
		        }
		   
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		finally{
		        try {
		            connection.close();
		            stmt.close();
		        }catch (SQLException e) {

		            e.printStackTrace();
		        }
		}

		return count;

		}
	
	public static Integer getCXImgRejectCount(String SQL) throws SQLException{

		   // List<Integer> countlist = new ArrayList<Integer>();
			int count=0;
		    Connection connection = null;
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

		   Statement stmt = null;
		   ResultSet rs=null;

		   try {
		        stmt = (Statement) connection.createStatement();
		        rs = stmt.executeQuery(SQL);
		        while (rs.next()){
		           count=Integer.parseInt(rs.getString("count"));
		        }
		   
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		finally{
		        try {
		            connection.close();
		            stmt.close();
		        }catch (SQLException e) {

		            e.printStackTrace();
		        }
		}

		return count;

		}
	
	public List<Account> getPendingCustomerList(String SQL) throws SQLException{
		
	  	List<Account> customerPending = new ArrayList<Account>();
        Connection connection = null;
        DatabaseController d = DatabaseController.getInstance();
        connection = (Connection) d.getConnection();
		
        Statement stmt = null;
        ResultSet rs=null;
        
        try {
        	System.out.println("getPendingCustomerList SQL : "+SQL);
            stmt = (Statement) connection.createStatement();
                rs = stmt.executeQuery(SQL);
                while (rs.next()){
                	//UrlTotal urlTot = new UrlTotal();
                	Account acc = new Account();
                	//System.out.println("88888888888888 "+rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_THANA"));
                	acc.setTNP_CX_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_UUID"));
                	acc.setTNP_CX_PROFILE_KYC_FORM_NO(rs.getString("TNP_CX_PROFILE_KYC_FORM_NO"));
                	acc.setTNP_CX_PROFILE_REF_NO(rs.getString("TNP_CX_PROFILE_REF_NO"));
                	acc.setTNP_CX_PROFILE_TYPE(rs.getString("TNP_CX_PROFILE_TYPE"));
                	acc.setTNP_CX_PROFILE_CREATED_BY(rs.getString("TNP_CX_PROFILE_CREATED_BY"));
                	acc.setTNP_CX_PROFILE_CREATED_DATE(rs.getString("TNP_CX_PROFILE_CREATED_DATE"));
                	acc.setTNP_CX_PROFILE_CREATED_BRANCH(rs.getString("TNP_CX_PROFILE_CREATED_BRANCH"));
                	acc.setTNP_CX_PROFILE_MODIFIED_BY(rs.getString("TNP_CX_PROFILE_MODIFIED_BY"));
                	acc.setTNP_CX_PROFILE_MODIFIED_DATE(rs.getString("TNP_CX_PROFILE_MODIFIED_DATE"));
                	acc.setTNP_CX_PROFILE_MODIFIED_COMMENT(rs.getString("TNP_CX_PROFILE_MODIFIED_COMMENT"));
                	acc.setTNP_CX_PROFILE_STATUS(rs.getString("TNP_CX_PROFILE_STATUS"));
                	acc.setTNP_CX_PROFILE_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_MOBILE_NUMBER"));
                	acc.setTNP_CX_PROFILE_NAME(rs.getString("TNP_CX_PROFILE_NAME"));
                	acc.setTNP_CX_PROFILE_DATE_OF_BIRTH(rs.getString("TNP_CX_PROFILE_DATE_OF_BIRTH"));
                	acc.setTNP_CX_PROFILE_GENDER(rs.getString("TNP_CX_PROFILE_GENDER"));
                	acc.setTNP_CX_PROFILE_NATIONALITY(rs.getString("TNP_CX_PROFILE_NATIONALITY"));
                	acc.setTNP_CX_PROFILE_ID_TYPE(rs.getString("TNP_CX_PROFILE_ID_TYPE"));
                	acc.setTNP_CX_PROFILE_ID_NUMBER(rs.getString("TNP_CX_PROFILE_ID_NUMBER"));
                	acc.setTNP_CX_PROFILE_TIN_NO(rs.getString("TNP_CX_PROFILE_TIN_NO"));
                	acc.setTNP_CX_PROFILE_EMAIL_ID(rs.getString("TNP_CX_PROFILE_EMAIL_ID"));
                	acc.setTNP_CX_PROFILE_OTHER_CONTACT_NO(rs.getString("TNP_CX_PROFILE_OTHER_CONTACT_NO"));
                	acc.setTNP_CX_PROFILE_EMERGENCY_CONTACT_NO(rs.getString("TNP_CX_PROFILE_EMERGENCY_CONTACT_NO"));
                	acc.setTNP_CX_PROFILE_PROFESSION(rs.getString("TNP_CX_PROFILE_PROFESSION"));
                	acc.setTNP_CX_PROFILE_FATHER_NAME(rs.getString("TNP_CX_PROFILE_FATHER_NAME"));
                	acc.setTNP_CX_PROFILE_MOTHER_NAME(rs.getString("TNP_CX_PROFILE_MOTHER_NAME"));
                	acc.setTNP_CX_PROFILE_SPOUSE_NAME(rs.getString("TNP_CX_PROFILE_SPOUSE_NAME"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_HOUSE_NO"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_CITY"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_STREET(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_STREET"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_STATE"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_DISTRICT(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_DISTRICT"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_THANA(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_THANA"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_UNION(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_UNION"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_DIVISION(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_DIVISION"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_POSTCODE(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_POSTCODE"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_HOUSE_NO"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_CITY"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_STREET(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_STREET"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_STATE"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_DISTRICT(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_DISTRICT"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_THANA(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_THANA"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_UNION(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_UNION"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_DIVISION(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_DIVISION"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_POSTCODE(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_POSTCODE"));
                	acc.setTNP_CX_PROFILE_PURPOSE_OF_TRANSACTIONS(rs.getString("TNP_CX_PROFILE_PURPOSE_OF_TRANSACTIONS"));
                	acc.setTNP_CX_PROFILE_BANK_ACC_NAME(rs.getString("TNP_CX_PROFILE_BANK_ACC_NAME"));
                	acc.setTNP_CX_PROFILE_BANK_ACC_NO(rs.getString("TNP_CX_PROFILE_BANK_ACC_NO"));
                	acc.setTNP_CX_PROFILE_BANK_NAME(rs.getString("TNP_CX_PROFILE_BANK_NAME"));
                	acc.setTNP_CX_PROFILE_BANK_BRANCH(rs.getString("TNP_CX_PROFILE_BANK_BRANCH"));
                	acc.setTNP_CX_PROFILE_NOMINEE_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_NAME"));
                	acc.setTNP_CX_PROFILE_NOMINEE_RELATION(rs.getString("TNP_CX_PROFILE_NOMINEE_RELATION"));
                	acc.setTNP_CX_PROFILE_NOMINEE_CONTACT_NO(rs.getString("TNP_CX_PROFILE_NOMINEE_CONTACT_NO"));
                	acc.setTNP_CX_PROFILE_NOMINEE_FATHERS_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_FATHERS_NAME"));
                	acc.setTNP_CX_PROFILE_NOMINEE_MOTHERS_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_MOTHERS_NAME"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ID_TYPE(rs.getString("TNP_CX_PROFILE_NOMINEE_ID_TYPE"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ID_NUMBER(rs.getString("TNP_CX_PROFILE_NOMINEE_ID_NUMBER"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_HOUSE_NO"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_CITY"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_STATE"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_STEET(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_STEET"));
                	acc.setTNP_CX_PROFILE_NOMINEE_DISTRICT(rs.getString("TNP_CX_PROFILE_NOMINEE_DISTRICT"));
                	acc.setTNP_CX_PROFILE_NOMINEE_THANA(rs.getString("TNP_CX_PROFILE_NOMINEE_THANA"));
                	acc.setTNP_CX_PROFILE_NOMINEE_UNION(rs.getString("TNP_CX_PROFILE_NOMINEE_UNION"));
                	acc.setTNP_CX_PROFILE_NOMINEE_DIVISION(rs.getString("TNP_CX_PROFILE_NOMINEE_DIVISION"));
                	acc.setTNP_CX_PROFILE_NOMINEE_POSTCODE(rs.getString("TNP_CX_PROFILE_NOMINEE_POSTCODE"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_ID(rs.getString("TNP_CX_PROFILE_INTRODUCER_ID"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_NAME(rs.getString("TNP_CX_PROFILE_INTRODUCER_NAME"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_BRANCH_NAME(rs.getString("TNP_CX_PROFILE_INTRODUCER_BRANCH_NAME"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_MOBILE_NUM(rs.getString("TNP_CX_PROFILE_INTRODUCER_MOBILE_NUM"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_HOME_NO(rs.getString("TNP_CX_PROFILE_INTRODUCER_HOME_NO"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_CITY(rs.getString("TNP_CX_PROFILE_INTRODUCER_CITY"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_STATE(rs.getString("TNP_CX_PROFILE_INTRODUCER_STATE"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_STREET(rs.getString("TNP_CX_PROFILE_INTRODUCER_STREET"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_DISTRICT(rs.getString("TNP_CX_PROFILE_INTRODUCER_DISTRICT"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_THANA(rs.getString("TNP_CX_PROFILE_INTRODUCER_THANA"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_UNION(rs.getString("TNP_CX_PROFILE_INTRODUCER_UNION"));
                	acc.setTNP_CX_PROFILE_VERIFIED_USER(rs.getString("TNP_CX_PROFILE_VERIFIED_USER"));
                	acc.setTNP_CX_PROFILE_APPROVAL_STATUS(rs.getString("TNP_CX_PROFILE_APPROVAL_STATUS"));
                	acc.setTNP_CX_PROFILE_APPROVAL_COMMENTS(rs.getString("TNP_CX_PROFILE_APPROVAL_COMMENTS"));
                	acc.setTNP_CX_PROFILE_REFERANCE_NO_OTHER(rs.getString("TNP_CX_PROFILE_REFERANCE_NO_OTHER"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_PHOTO(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_PHOTO"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_NIC(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_NIC"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_KYC_FORM(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_KYC_FORM"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_TIN_FORM(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_TIN_FORM"));
                	acc.setTNP_CX_PROFILE_VERIFIED_CITIZENSHIP_CERITIFICATE_FROM(rs.getString("TNP_CX_PROFILE_VERIFIED_CITIZENSHIP_CERITIFICATE_FROM"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_OTHER(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_OTHER"));
                	//acc.setTNP_CX_PROFILE_KYC_FORM_NO(rs.getString("TNP_CX_PROFILE_KYC_FORM_NO"));
                	customerPending.add(acc);
                	
                }
                }catch (Exception e) {
                	System.out.println("** getPendinglList **"+e.toString());
					e.printStackTrace();
                }
        finally{
        	if ( connection != null ){
				try{ 
					connection.close(); 
				}catch(Exception ce){
					ce.printStackTrace();
					}
			}
        }
		return customerPending;
	}
	
	public Account getCustomerApiDeatails (String SQL)throws Exception{
		
		Account acc = new Account();
		
		Connection con = null;  
		Statement st = null;
		try {
			DatabaseController d = DatabaseController.getInstance();
			con=d.getConnection();
			ResultSet rs = null;
			st = (Statement)con.createStatement();			
			rs = st.executeQuery(SQL);
			//System.out.println("SQL "+SQL);
				while( rs.next() ){
					
					acc.setTNP_CX_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_UUID"));
                	acc.setTNP_CX_PROFILE_KYC_FORM_NO(rs.getString("TNP_CX_PROFILE_KYC_FORM_NO"));
                	acc.setTNP_CX_PROFILE_REF_NO(rs.getString("TNP_CX_PROFILE_REF_NO"));
                	acc.setTNP_CX_PROFILE_TYPE(rs.getString("TNP_CX_PROFILE_TYPE"));
                	acc.setTNP_CX_PROFILE_CREATED_BY(rs.getString("TNP_CX_PROFILE_CREATED_BY"));
                	acc.setTNP_CX_PROFILE_CREATED_DATE(rs.getString("TNP_CX_PROFILE_CREATED_DATE"));
                	acc.setTNP_CX_PROFILE_CREATED_BRANCH(rs.getString("TNP_CX_PROFILE_CREATED_BRANCH"));
                	acc.setTNP_CX_PROFILE_MODIFIED_BY(rs.getString("TNP_CX_PROFILE_MODIFIED_BY"));
                	acc.setTNP_CX_PROFILE_MODIFIED_DATE(rs.getString("TNP_CX_PROFILE_MODIFIED_DATE"));
                	acc.setTNP_CX_PROFILE_MODIFIED_COMMENT(rs.getString("TNP_CX_PROFILE_MODIFIED_COMMENT"));
                	acc.setTNP_CX_PROFILE_STATUS(rs.getString("TNP_CX_PROFILE_STATUS"));
                	acc.setTNP_CX_PROFILE_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_MOBILE_NUMBER"));
                	acc.setTNP_CX_PROFILE_NAME(rs.getString("TNP_CX_PROFILE_NAME"));
                	acc.setTNP_CX_PROFILE_DATE_OF_BIRTH(rs.getString("TNP_CX_PROFILE_DATE_OF_BIRTH"));
                	acc.setTNP_CX_PROFILE_GENDER(rs.getString("TNP_CX_PROFILE_GENDER"));
                	acc.setTNP_CX_PROFILE_NATIONALITY(rs.getString("TNP_CX_PROFILE_NATIONALITY"));
                	acc.setTNP_CX_PROFILE_ID_TYPE(rs.getString("TNP_CX_PROFILE_ID_TYPE"));
                	acc.setTNP_CX_PROFILE_ID_NUMBER(rs.getString("TNP_CX_PROFILE_ID_NUMBER"));
                	acc.setTNP_CX_PROFILE_TIN_NO(rs.getString("TNP_CX_PROFILE_TIN_NO"));
                	acc.setTNP_CX_PROFILE_EMAIL_ID(rs.getString("TNP_CX_PROFILE_EMAIL_ID"));
                	acc.setTNP_CX_PROFILE_OTHER_CONTACT_NO(rs.getString("TNP_CX_PROFILE_OTHER_CONTACT_NO"));
                	acc.setTNP_CX_PROFILE_EMERGENCY_CONTACT_NO(rs.getString("TNP_CX_PROFILE_EMERGENCY_CONTACT_NO"));
                	acc.setTNP_CX_PROFILE_PROFESSION(rs.getString("TNP_CX_PROFILE_PROFESSION"));
                	acc.setTNP_CX_PROFILE_FATHER_NAME(rs.getString("TNP_CX_PROFILE_FATHER_NAME"));
                	acc.setTNP_CX_PROFILE_MOTHER_NAME(rs.getString("TNP_CX_PROFILE_MOTHER_NAME"));
                	acc.setTNP_CX_PROFILE_SPOUSE_NAME(rs.getString("TNP_CX_PROFILE_SPOUSE_NAME"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_HOUSE_NO"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_CITY"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_STREET(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_STREET"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_STATE"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_DISTRICT(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_DISTRICT"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_THANA(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_THANA"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_UNION(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_UNION"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_DIVISION(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_DIVISION"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_POSTCODE(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_POSTCODE"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_HOUSE_NO"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_CITY"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_STREET(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_STREET"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_STATE"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_DISTRICT(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_DISTRICT"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_THANA(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_THANA"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_UNION(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_UNION"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_DIVISION(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_DIVISION"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_POSTCODE(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_POSTCODE"));
                	acc.setTNP_CX_PROFILE_PURPOSE_OF_TRANSACTIONS(rs.getString("TNP_CX_PROFILE_PURPOSE_OF_TRANSACTIONS"));
                	acc.setTNP_CX_PROFILE_BANK_ACC_NAME(rs.getString("TNP_CX_PROFILE_BANK_ACC_NAME"));
                	acc.setTNP_CX_PROFILE_BANK_ACC_NO(rs.getString("TNP_CX_PROFILE_BANK_ACC_NO"));
                	acc.setTNP_CX_PROFILE_BANK_NAME(rs.getString("TNP_CX_PROFILE_BANK_NAME"));
                	acc.setTNP_CX_PROFILE_BANK_BRANCH(rs.getString("TNP_CX_PROFILE_BANK_BRANCH"));
                	acc.setTNP_CX_PROFILE_NOMINEE_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_NAME"));
                	acc.setTNP_CX_PROFILE_NOMINEE_RELATION(rs.getString("TNP_CX_PROFILE_NOMINEE_RELATION"));
                	acc.setTNP_CX_PROFILE_NOMINEE_CONTACT_NO(rs.getString("TNP_CX_PROFILE_NOMINEE_CONTACT_NO"));
                	acc.setTNP_CX_PROFILE_NOMINEE_FATHERS_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_FATHERS_NAME"));
                	acc.setTNP_CX_PROFILE_NOMINEE_MOTHERS_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_MOTHERS_NAME"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ID_TYPE(rs.getString("TNP_CX_PROFILE_NOMINEE_ID_TYPE"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ID_NUMBER(rs.getString("TNP_CX_PROFILE_NOMINEE_ID_NUMBER"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_HOUSE_NO"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_CITY"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_STATE"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_STEET(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_STEET"));
                	acc.setTNP_CX_PROFILE_NOMINEE_DISTRICT(rs.getString("TNP_CX_PROFILE_NOMINEE_DISTRICT"));
                	acc.setTNP_CX_PROFILE_NOMINEE_THANA(rs.getString("TNP_CX_PROFILE_NOMINEE_THANA"));
                	acc.setTNP_CX_PROFILE_NOMINEE_UNION(rs.getString("TNP_CX_PROFILE_NOMINEE_UNION"));
                	acc.setTNP_CX_PROFILE_NOMINEE_DIVISION(rs.getString("TNP_CX_PROFILE_NOMINEE_DIVISION"));
                	acc.setTNP_CX_PROFILE_NOMINEE_POSTCODE(rs.getString("TNP_CX_PROFILE_NOMINEE_POSTCODE"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_ID(rs.getString("TNP_CX_PROFILE_INTRODUCER_ID"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_NAME(rs.getString("TNP_CX_PROFILE_INTRODUCER_NAME"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_BRANCH_NAME(rs.getString("TNP_CX_PROFILE_INTRODUCER_BRANCH_NAME"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_MOBILE_NUM(rs.getString("TNP_CX_PROFILE_INTRODUCER_MOBILE_NUM"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_HOME_NO(rs.getString("TNP_CX_PROFILE_INTRODUCER_HOME_NO"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_CITY(rs.getString("TNP_CX_PROFILE_INTRODUCER_CITY"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_STATE(rs.getString("TNP_CX_PROFILE_INTRODUCER_STATE"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_STREET(rs.getString("TNP_CX_PROFILE_INTRODUCER_STREET"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_DISTRICT(rs.getString("TNP_CX_PROFILE_INTRODUCER_DISTRICT"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_THANA(rs.getString("TNP_CX_PROFILE_INTRODUCER_THANA"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_UNION(rs.getString("TNP_CX_PROFILE_INTRODUCER_UNION"));
                	acc.setTNP_CX_PROFILE_VERIFIED_USER(rs.getString("TNP_CX_PROFILE_VERIFIED_USER"));
                	acc.setTNP_CX_PROFILE_APPROVAL_STATUS(rs.getString("TNP_CX_PROFILE_APPROVAL_STATUS"));
                	acc.setTNP_CX_PROFILE_APPROVAL_COMMENTS(rs.getString("TNP_CX_PROFILE_APPROVAL_COMMENTS"));
                	acc.setTNP_CX_PROFILE_REFERANCE_NO_OTHER(rs.getString("TNP_CX_PROFILE_REFERANCE_NO_OTHER"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_PHOTO(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_PHOTO"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_NIC(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_NIC"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_KYC_FORM(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_KYC_FORM"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_TIN_FORM(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_TIN_FORM"));
                	acc.setTNP_CX_PROFILE_VERIFIED_CITIZENSHIP_CERITIFICATE_FROM(rs.getString("TNP_CX_PROFILE_VERIFIED_CITIZENSHIP_CERITIFICATE_FROM"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_OTHER(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_OTHER"));
                	acc.setLockStatus(rs.getString("TNP_CX_PROFILE_LOCK_STATUS"));
					
				}
			} catch (Exception e) {
				System.out.println("Error On get Customer API Details : "+e.toString());
				throw e;
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
	
	 public boolean updateAPIStatus(String sql){
			boolean status=false;
			Connection con = null;
			try {
				DatabaseController d = DatabaseController.getInstance();	
				con=(Connection)d.getConnection();	
				Statement stmt = (Statement) con.createStatement();
			    stmt.execute(sql);
			    status=true;
			    System.out.println("update API Status SQL : "+sql);
			} catch (SQLException e) {
				System.out.println("Error On API update Status : "+e.toString());
			}
			finally{  
				if (con != null) { 
					try { 
						con.close(); 
					}catch (SQLException e) {
						
					}
					con = null;
				} 
			}
			System.out.println("status : "+status);
			return status;
		}
	 
	 public boolean updateAPILock(String sql){
			boolean status=false;
			Connection con = null;
			try {
				DatabaseController d = DatabaseController.getInstance();	
				con=(Connection)d.getConnection();	
				Statement stmt = (Statement) con.createStatement();
			    stmt.execute(sql);
			    status=true;
			    System.out.println("update API Lock SQL : "+sql);
			} catch (SQLException e) {
				System.out.println("Error On API lock Status : "+e.toString());
			}
			finally{  
				if (con != null) { 
					try { 
						con.close(); 
					}catch (SQLException e) {
						
					}
					con = null;
				} 
			}
			System.out.println("status : "+status);
			return status;
		}
	 
	 public AccountImg getCustomerImgDetailsAPI (String SQL){
			
		  AccountImg accImg = new AccountImg();
			Connection con = null;  
			Statement st = null;
			try {
				
				DatabaseController d = DatabaseController.getInstance();
				con=d.getConnection();
				ResultSet rs = null;
				st = (Statement)con.createStatement();			
				rs = st.executeQuery(SQL);
				System.out.println("Img API SQL "+SQL);
				
				while( rs.next() ){
					
					accImg.setImage_nid_path(rs.getString("TNP_CX_PROFILE_IMAGES_NID_PATH"));
					accImg.setImage_photo_path(rs.getString("TNP_CX_PROFILE_IMAGES_PHOTO_PATH"));
					accImg.setImage_kyc_path(rs.getString("TNP_CX_PROFILE_IMAGES_KYC_FORM_PATH"));
					accImg.setImage_tin_path(rs.getString("TNP_CX_PROFILE_IMAGES_TIN_FORM_PATH"));
					accImg.setImage_citizen_path(rs.getString("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM_PATH"));
					accImg.setImage_other_path(rs.getString("TNP_CX_PROFILE_IMAGES_OTHER_PATH"));
					
				} 
			} catch (Exception e) {
				System.out.println("Error On get API Image details details : "+e.toString());
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
			
			return accImg;
		}
	
public List<Account> getRejectCustomerList(String SQL) throws SQLException{
		
	  	List<Account> customerReject = new ArrayList<Account>();
        Connection connection = null;
        DatabaseController d = DatabaseController.getInstance();
        connection = (Connection) d.getConnection();
		
        Statement stmt = null;
        ResultSet rs=null;
        
        try {
        	System.out.println("getRejectCustomerList SQL : "+SQL);
            stmt = (Statement) connection.createStatement();
                rs = stmt.executeQuery(SQL);
                while (rs.next()){
                	//UrlTotal urlTot = new UrlTotal();
                	Account acc = new Account();
                	//System.out.println("88888888888888 "+rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_THANA"));
                	acc.setTNP_CX_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_UUID"));
                	acc.setTNP_CX_PROFILE_KYC_FORM_NO(rs.getString("TNP_CX_PROFILE_KYC_FORM_NO"));
                	acc.setTNP_CX_PROFILE_REF_NO(rs.getString("TNP_CX_PROFILE_REF_NO"));
                	acc.setTNP_CX_PROFILE_TYPE(rs.getString("TNP_CX_PROFILE_TYPE"));
                	acc.setTNP_CX_PROFILE_CREATED_BY(rs.getString("TNP_CX_PROFILE_CREATED_BY"));
                	acc.setTNP_CX_PROFILE_CREATED_DATE(rs.getString("TNP_CX_PROFILE_CREATED_DATE"));
                	acc.setTNP_CX_PROFILE_CREATED_BRANCH(rs.getString("TNP_CX_PROFILE_CREATED_BRANCH"));
                	acc.setTNP_CX_PROFILE_MODIFIED_BY(rs.getString("TNP_CX_PROFILE_MODIFIED_BY"));
                	acc.setTNP_CX_PROFILE_MODIFIED_DATE(rs.getString("TNP_CX_PROFILE_MODIFIED_DATE"));
                	acc.setTNP_CX_PROFILE_MODIFIED_COMMENT(rs.getString("TNP_CX_PROFILE_MODIFIED_COMMENT"));
                	acc.setTNP_CX_PROFILE_STATUS(rs.getString("TNP_CX_PROFILE_STATUS"));
                	acc.setTNP_CX_PROFILE_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_MOBILE_NUMBER"));
                	acc.setTNP_CX_PROFILE_NAME(rs.getString("TNP_CX_PROFILE_NAME"));
                	acc.setTNP_CX_PROFILE_DATE_OF_BIRTH(rs.getString("TNP_CX_PROFILE_DATE_OF_BIRTH"));
                	acc.setTNP_CX_PROFILE_GENDER(rs.getString("TNP_CX_PROFILE_GENDER"));
                	acc.setTNP_CX_PROFILE_NATIONALITY(rs.getString("TNP_CX_PROFILE_NATIONALITY"));
                	acc.setTNP_CX_PROFILE_ID_TYPE(rs.getString("TNP_CX_PROFILE_ID_TYPE"));
                	acc.setTNP_CX_PROFILE_ID_NUMBER(rs.getString("TNP_CX_PROFILE_ID_NUMBER"));
                	acc.setTNP_CX_PROFILE_TIN_NO(rs.getString("TNP_CX_PROFILE_TIN_NO"));
                	acc.setTNP_CX_PROFILE_EMAIL_ID(rs.getString("TNP_CX_PROFILE_EMAIL_ID"));
                	acc.setTNP_CX_PROFILE_OTHER_CONTACT_NO(rs.getString("TNP_CX_PROFILE_OTHER_CONTACT_NO"));
                	acc.setTNP_CX_PROFILE_EMERGENCY_CONTACT_NO(rs.getString("TNP_CX_PROFILE_EMERGENCY_CONTACT_NO"));
                	acc.setTNP_CX_PROFILE_PROFESSION(rs.getString("TNP_CX_PROFILE_PROFESSION"));
                	acc.setTNP_CX_PROFILE_FATHER_NAME(rs.getString("TNP_CX_PROFILE_FATHER_NAME"));
                	acc.setTNP_CX_PROFILE_MOTHER_NAME(rs.getString("TNP_CX_PROFILE_MOTHER_NAME"));
                	acc.setTNP_CX_PROFILE_SPOUSE_NAME(rs.getString("TNP_CX_PROFILE_SPOUSE_NAME"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_HOUSE_NO"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_CITY"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_STREET(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_STREET"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_STATE"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_DISTRICT(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_DISTRICT"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_THANA(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_THANA"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_UNION(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_UNION"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_DIVISION(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_DIVISION"));
                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_POSTCODE(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_POSTCODE"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_HOUSE_NO"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_CITY"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_STREET(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_STREET"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_STATE"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_DISTRICT(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_DISTRICT"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_THANA(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_THANA"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_UNION(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_UNION"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_DIVISION(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_DIVISION"));
                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_POSTCODE(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_POSTCODE"));
                	acc.setTNP_CX_PROFILE_PURPOSE_OF_TRANSACTIONS(rs.getString("TNP_CX_PROFILE_PURPOSE_OF_TRANSACTIONS"));
                	acc.setTNP_CX_PROFILE_BANK_ACC_NAME(rs.getString("TNP_CX_PROFILE_BANK_ACC_NAME"));
                	acc.setTNP_CX_PROFILE_BANK_ACC_NO(rs.getString("TNP_CX_PROFILE_BANK_ACC_NO"));
                	acc.setTNP_CX_PROFILE_BANK_NAME(rs.getString("TNP_CX_PROFILE_BANK_NAME"));
                	acc.setTNP_CX_PROFILE_BANK_BRANCH(rs.getString("TNP_CX_PROFILE_BANK_BRANCH"));
                	acc.setTNP_CX_PROFILE_NOMINEE_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_NAME"));
                	acc.setTNP_CX_PROFILE_NOMINEE_RELATION(rs.getString("TNP_CX_PROFILE_NOMINEE_RELATION"));
                	acc.setTNP_CX_PROFILE_NOMINEE_CONTACT_NO(rs.getString("TNP_CX_PROFILE_NOMINEE_CONTACT_NO"));
                	acc.setTNP_CX_PROFILE_NOMINEE_FATHERS_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_FATHERS_NAME"));
                	acc.setTNP_CX_PROFILE_NOMINEE_MOTHERS_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_MOTHERS_NAME"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ID_TYPE(rs.getString("TNP_CX_PROFILE_NOMINEE_ID_TYPE"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ID_NUMBER(rs.getString("TNP_CX_PROFILE_NOMINEE_ID_NUMBER"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_HOUSE_NO"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_CITY"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_STATE"));
                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_STEET(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_STEET"));
                	acc.setTNP_CX_PROFILE_NOMINEE_DISTRICT(rs.getString("TNP_CX_PROFILE_NOMINEE_DISTRICT"));
                	acc.setTNP_CX_PROFILE_NOMINEE_THANA(rs.getString("TNP_CX_PROFILE_NOMINEE_THANA"));
                	acc.setTNP_CX_PROFILE_NOMINEE_UNION(rs.getString("TNP_CX_PROFILE_NOMINEE_UNION"));
                	acc.setTNP_CX_PROFILE_NOMINEE_DIVISION(rs.getString("TNP_CX_PROFILE_NOMINEE_DIVISION"));
                	acc.setTNP_CX_PROFILE_NOMINEE_POSTCODE(rs.getString("TNP_CX_PROFILE_NOMINEE_POSTCODE"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_ID(rs.getString("TNP_CX_PROFILE_INTRODUCER_ID"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_NAME(rs.getString("TNP_CX_PROFILE_INTRODUCER_NAME"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_BRANCH_NAME(rs.getString("TNP_CX_PROFILE_INTRODUCER_BRANCH_NAME"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_MOBILE_NUM(rs.getString("TNP_CX_PROFILE_INTRODUCER_MOBILE_NUM"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_HOME_NO(rs.getString("TNP_CX_PROFILE_INTRODUCER_HOME_NO"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_CITY(rs.getString("TNP_CX_PROFILE_INTRODUCER_CITY"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_STATE(rs.getString("TNP_CX_PROFILE_INTRODUCER_STATE"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_STREET(rs.getString("TNP_CX_PROFILE_INTRODUCER_STREET"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_DISTRICT(rs.getString("TNP_CX_PROFILE_INTRODUCER_DISTRICT"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_THANA(rs.getString("TNP_CX_PROFILE_INTRODUCER_THANA"));
                	acc.setTNP_CX_PROFILE_INTRODUCER_UNION(rs.getString("TNP_CX_PROFILE_INTRODUCER_UNION"));
                	acc.setTNP_CX_PROFILE_VERIFIED_USER(rs.getString("TNP_CX_PROFILE_VERIFIED_USER"));
                	acc.setTNP_CX_PROFILE_APPROVAL_STATUS(rs.getString("TNP_CX_PROFILE_APPROVAL_STATUS"));
                	acc.setTNP_CX_PROFILE_APPROVAL_COMMENTS(rs.getString("TNP_CX_PROFILE_APPROVAL_COMMENTS"));
                	acc.setTNP_CX_PROFILE_REFERANCE_NO_OTHER(rs.getString("TNP_CX_PROFILE_REFERANCE_NO_OTHER"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_PHOTO(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_PHOTO"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_NIC(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_NIC"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_KYC_FORM(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_KYC_FORM"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_TIN_FORM(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_TIN_FORM"));
                	acc.setTNP_CX_PROFILE_VERIFIED_CITIZENSHIP_CERITIFICATE_FROM(rs.getString("TNP_CX_PROFILE_VERIFIED_CITIZENSHIP_CERITIFICATE_FROM"));
                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_OTHER(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_OTHER"));
                	customerReject.add(acc);
                	
                }
                }catch (Exception e) {
                	System.out.println("** getRejectlList **"+e.toString());
					e.printStackTrace();
                }
        finally{
        	if ( connection != null ){
				try{ 
					connection.close(); 
				}catch(Exception ce){
					ce.printStackTrace();
					}
			}
        }
		return customerReject;
	}
	
/*public List<Account> getRejectCustomerList(String SQL){
		
	  	List<Account> customerReject = new ArrayList<Account>();
        Connection connection = null;
        DatabaseController d = DatabaseController.getInstance();
        try {
			connection = (Connection) d.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
        Statement stmt = null;
        ResultSet rs=null;
        
        try {
        	System.out.println("getPendingCustomerList SQL : "+SQL);
            stmt = (Statement) connection.createStatement();
                rs = stmt.executeQuery(SQL);
                while (rs.next()){
                	//UrlTotal urlTot = new UrlTotal();
                	Account acc = new Account();
                	acc.setID(rs.getString("id"));
                	acc.setNAME(rs.getString("NAME"));
                	acc.setMOBILE_NUMBER(rs.getString("MOBILE_NUMBER"));
                	acc.setGENDER(rs.getString("GENDER"));
                	acc.setMOTHER_NAME(rs.getString("MOTHER_NAME"));
                	acc.setSTATUS(rs.getString("STATUS"));
                	customerReject.add(acc);
                	
                	
                	
                }
                }catch (Exception e) {
                	System.out.println("** getPendinglList **"+e.toString());
					e.printStackTrace();
                }
        finally{
        	if ( connection != null ){
				try{ 
					connection.close(); 
				}catch(Exception ce){
					ce.printStackTrace();
					}
			}
        }
		return customerReject;
	}*/
	
	
	
	 public List<Account> getAllCustomerList(String SQL) throws SQLException{
			
		  	List<Account> allCustomerList = new ArrayList<Account>();
	        Connection connection = null;
	        DatabaseController d = DatabaseController.getInstance();
	        connection = (Connection) d.getConnection();
			
	        Statement stmt = null;
	        ResultSet rs=null;
	        
	        try {
	        	System.out.println("** getAllCustomerList SQL ** : "+SQL);
	            stmt = (Statement) connection.createStatement();
	                rs = stmt.executeQuery(SQL);
	                while (rs.next()){
	                	
	                	Account acc = new Account();
	                	
	                	acc.setTNP_CX_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_UUID"));
	                	acc.setTNP_CX_PROFILE_KYC_FORM_NO(rs.getString("TNP_CX_PROFILE_KYC_FORM_NO"));
	                	acc.setTNP_CX_PROFILE_REF_NO(rs.getString("TNP_CX_PROFILE_REF_NO"));
	                	acc.setTNP_CX_PROFILE_TYPE(rs.getString("TNP_CX_PROFILE_TYPE"));
	                	acc.setTNP_CX_PROFILE_CREATED_BY(rs.getString("TNP_CX_PROFILE_CREATED_BY"));
	                	acc.setTNP_CX_PROFILE_CREATED_DATE(rs.getString("TNP_CX_PROFILE_CREATED_DATE"));
	                	acc.setTNP_CX_PROFILE_CREATED_BRANCH(rs.getString("TNP_CX_PROFILE_CREATED_BRANCH"));
	                	acc.setTNP_CX_PROFILE_MODIFIED_BY(rs.getString("TNP_CX_PROFILE_MODIFIED_BY"));
	                	acc.setTNP_CX_PROFILE_MODIFIED_DATE(rs.getString("TNP_CX_PROFILE_MODIFIED_DATE"));
	                	acc.setTNP_CX_PROFILE_MODIFIED_COMMENT(rs.getString("TNP_CX_PROFILE_MODIFIED_COMMENT"));
	                	acc.setTNP_CX_PROFILE_STATUS(rs.getString("TNP_CX_PROFILE_STATUS"));
	                	acc.setTNP_CX_PROFILE_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_MOBILE_NUMBER"));
	                	acc.setTNP_CX_PROFILE_NAME(rs.getString("TNP_CX_PROFILE_NAME"));
	                	acc.setTNP_CX_PROFILE_DATE_OF_BIRTH(rs.getString("TNP_CX_PROFILE_DATE_OF_BIRTH"));
	                	acc.setTNP_CX_PROFILE_GENDER(rs.getString("TNP_CX_PROFILE_GENDER"));
	                	acc.setTNP_CX_PROFILE_NATIONALITY(rs.getString("TNP_CX_PROFILE_NATIONALITY"));
	                	acc.setTNP_CX_PROFILE_ID_TYPE(rs.getString("TNP_CX_PROFILE_ID_TYPE"));
	                	acc.setTNP_CX_PROFILE_ID_NUMBER(rs.getString("TNP_CX_PROFILE_ID_NUMBER"));
	                	acc.setTNP_CX_PROFILE_TIN_NO(rs.getString("TNP_CX_PROFILE_TIN_NO"));
	                	acc.setTNP_CX_PROFILE_EMAIL_ID(rs.getString("TNP_CX_PROFILE_EMAIL_ID"));
	                	acc.setTNP_CX_PROFILE_OTHER_CONTACT_NO(rs.getString("TNP_CX_PROFILE_OTHER_CONTACT_NO"));
	                	acc.setTNP_CX_PROFILE_EMERGENCY_CONTACT_NO(rs.getString("TNP_CX_PROFILE_EMERGENCY_CONTACT_NO"));
	                	acc.setTNP_CX_PROFILE_PROFESSION(rs.getString("TNP_CX_PROFILE_PROFESSION"));
	                	acc.setTNP_CX_PROFILE_FATHER_NAME(rs.getString("TNP_CX_PROFILE_FATHER_NAME"));
	                	acc.setTNP_CX_PROFILE_MOTHER_NAME(rs.getString("TNP_CX_PROFILE_MOTHER_NAME"));
	                	acc.setTNP_CX_PROFILE_SPOUSE_NAME(rs.getString("TNP_CX_PROFILE_SPOUSE_NAME"));
	                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_HOUSE_NO"));
	                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_CITY"));
	                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_STREET(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_STREET"));
	                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_STATE"));
	                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_DISTRICT(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_DISTRICT"));
	                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_THANA(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_THANA"));
	                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_UNION(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_UNION"));
	                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_DIVISION(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_DIVISION"));
	                	acc.setTNP_CX_PROFILE_PERMANENT_ADDRESS_POSTCODE(rs.getString("TNP_CX_PROFILE_PERMANENT_ADDRESS_POSTCODE"));
	                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_HOUSE_NO"));
	                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_CITY"));
	                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_STREET(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_STREET"));
	                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_STATE"));
	                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_DISTRICT(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_DISTRICT"));
	                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_THANA(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_THANA"));
	                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_UNION(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_UNION"));
	                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_DIVISION(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_DIVISION"));
	                	acc.setTNP_CX_PROFILE_MAILING_ADDRESS_POSTCODE(rs.getString("TNP_CX_PROFILE_MAILING_ADDRESS_POSTCODE"));
	                	acc.setTNP_CX_PROFILE_PURPOSE_OF_TRANSACTIONS(rs.getString("TNP_CX_PROFILE_PURPOSE_OF_TRANSACTIONS"));
	                	acc.setTNP_CX_PROFILE_BANK_ACC_NAME(rs.getString("TNP_CX_PROFILE_BANK_ACC_NAME"));
	                	acc.setTNP_CX_PROFILE_BANK_ACC_NO(rs.getString("TNP_CX_PROFILE_BANK_ACC_NO"));
	                	acc.setTNP_CX_PROFILE_BANK_NAME(rs.getString("TNP_CX_PROFILE_BANK_NAME"));
	                	acc.setTNP_CX_PROFILE_BANK_BRANCH(rs.getString("TNP_CX_PROFILE_BANK_BRANCH"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_NAME"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_RELATION(rs.getString("TNP_CX_PROFILE_NOMINEE_RELATION"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_CONTACT_NO(rs.getString("TNP_CX_PROFILE_NOMINEE_CONTACT_NO"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_FATHERS_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_FATHERS_NAME"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_MOTHERS_NAME(rs.getString("TNP_CX_PROFILE_NOMINEE_MOTHERS_NAME"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_ID_TYPE(rs.getString("TNP_CX_PROFILE_NOMINEE_ID_TYPE"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_ID_NUMBER(rs.getString("TNP_CX_PROFILE_NOMINEE_ID_NUMBER"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_HOUSE_NO(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_HOUSE_NO"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_CITY(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_CITY"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_STATE(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_STATE"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_ADDRESS_STEET(rs.getString("TNP_CX_PROFILE_NOMINEE_ADDRESS_STEET"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_DISTRICT(rs.getString("TNP_CX_PROFILE_NOMINEE_DISTRICT"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_THANA(rs.getString("TNP_CX_PROFILE_NOMINEE_THANA"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_UNION(rs.getString("TNP_CX_PROFILE_NOMINEE_UNION"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_DIVISION(rs.getString("TNP_CX_PROFILE_NOMINEE_DIVISION"));
	                	acc.setTNP_CX_PROFILE_NOMINEE_POSTCODE(rs.getString("TNP_CX_PROFILE_NOMINEE_POSTCODE"));
	                	acc.setTNP_CX_PROFILE_INTRODUCER_ID(rs.getString("TNP_CX_PROFILE_INTRODUCER_ID"));
	                	acc.setTNP_CX_PROFILE_INTRODUCER_NAME(rs.getString("TNP_CX_PROFILE_INTRODUCER_NAME"));
	                	acc.setTNP_CX_PROFILE_INTRODUCER_BRANCH_NAME(rs.getString("TNP_CX_PROFILE_INTRODUCER_BRANCH_NAME"));
	                	acc.setTNP_CX_PROFILE_INTRODUCER_MOBILE_NUM(rs.getString("TNP_CX_PROFILE_INTRODUCER_MOBILE_NUM"));
	                	acc.setTNP_CX_PROFILE_INTRODUCER_HOME_NO(rs.getString("TNP_CX_PROFILE_INTRODUCER_HOME_NO"));
	                	acc.setTNP_CX_PROFILE_INTRODUCER_CITY(rs.getString("TNP_CX_PROFILE_INTRODUCER_CITY"));
	                	acc.setTNP_CX_PROFILE_INTRODUCER_STATE(rs.getString("TNP_CX_PROFILE_INTRODUCER_STATE"));
	                	acc.setTNP_CX_PROFILE_INTRODUCER_STREET(rs.getString("TNP_CX_PROFILE_INTRODUCER_STREET"));
	                	acc.setTNP_CX_PROFILE_INTRODUCER_DISTRICT(rs.getString("TNP_CX_PROFILE_INTRODUCER_DISTRICT"));
	                	acc.setTNP_CX_PROFILE_INTRODUCER_THANA(rs.getString("TNP_CX_PROFILE_INTRODUCER_THANA"));
	                	acc.setTNP_CX_PROFILE_INTRODUCER_UNION(rs.getString("TNP_CX_PROFILE_INTRODUCER_UNION"));
	                	acc.setTNP_CX_PROFILE_VERIFIED_USER(rs.getString("TNP_CX_PROFILE_VERIFIED_USER"));
	                	acc.setTNP_CX_PROFILE_APPROVAL_STATUS(rs.getString("TNP_CX_PROFILE_APPROVAL_STATUS"));
	                	acc.setTNP_CX_PROFILE_APPROVAL_COMMENTS(rs.getString("TNP_CX_PROFILE_APPROVAL_COMMENTS"));
	                	acc.setTNP_CX_PROFILE_REFERANCE_NO_OTHER(rs.getString("TNP_CX_PROFILE_REFERANCE_NO_OTHER"));
	                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_PHOTO(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_PHOTO"));
	                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_NIC(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_NIC"));
	                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_KYC_FORM(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_KYC_FORM"));
	                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_TIN_FORM(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_TIN_FORM"));
	                	acc.setTNP_CX_PROFILE_VERIFIED_CITIZENSHIP_CERITIFICATE_FROM(rs.getString("TNP_CX_PROFILE_VERIFIED_CITIZENSHIP_CERITIFICATE_FROM"));
	                	acc.setTNP_CX_PROFILE_VERIFIED_IMG_OTHER(rs.getString("TNP_CX_PROFILE_VERIFIED_IMG_OTHER"));
	                	
	                	allCustomerList.add(acc);
	                }
	                }catch (Exception e) {
	                	System.out.println("**getAllCustomerList**"+e.toString());
						e.printStackTrace();
	                }
	        finally{
	        	if ( connection != null ){
					try{ 
						connection.close(); 
					}catch(Exception ce){
						ce.printStackTrace();
						}
				}
	        }
			return allCustomerList;
	 }
	 
	 public List<Account> getPendingCustomerListByTapNPay() throws SQLException{
			String SQL="SELECT id,ACCOUNT_NAME,NAME,MOBILE_NUMBER,STATUS FROM account WHERE  STATUS='PENDING' AND BRANCH_MAKER_STATUS IS NULL AND BRANCH_CHECKER_STATUS IS NULL";
			List<Account> customerPending = new ArrayList<Account>();
			customerPending=getPendingCustomerList(SQL);
			return customerPending;
		}
	 
	 
	 public byte[] getImageData(String query){
		 
         byte[] imgData = null;
         Connection con = null;
         Statement stmt = null;
         ResultSet rs = null;
         Blob image = null;
         boolean q_update_status=false;

         try {

                DatabaseController d = DatabaseController.getInstance();      
                con=(Connection)d.getConnection(); 
                
                stmt = con.createStatement();

                rs = stmt.executeQuery(query);

                if (rs.next()) {
                
                      image = rs.getBlob(1);//blob
                      //System.out.println("!@########");
                      //inputStream=image.getBinaryStream();
                      if(image==null){
                             
                             System.out.println("111111111111111111111");
                             //
                      }else{
                             
                             imgData = image.getBytes(1, (int) image.length()); //array
                             System.out.println("22222222222222222222222222222222");
                      }
                }
         }catch( Exception e){
                e. printStackTrace();
         }finally {
                 try {
                      rs.close();
                      stmt.close();
                      con.close();
                } catch (SQLException e) {

                      e.printStackTrace();

                }
         }
         return imgData;
	 }
	 
	 
	 public List<String> getAllImageData(String query){
		 
        
         Connection con = null;
         Statement stmt = null;
         ResultSet rs = null;
         Blob image1 = null;
         Blob image2 = null;
         Blob image3 = null;
         Blob image4 = null;
         Blob image5 = null;
         Blob image6 = null;
         
         List<String> BooleanArrayList = new ArrayList<String>();

         try {

                DatabaseController d = DatabaseController.getInstance();      
                con=(Connection)d.getConnection(); 
                
                stmt = con.createStatement();

                rs = stmt.executeQuery(query);

                if (rs.next()) {
                	image1 = rs.getBlob(1);//blob
                    image2 = rs.getBlob(2);
                    image3 = rs.getBlob(3);
                    image4 = rs.getBlob(4);
                    image5 = rs.getBlob(5);
                    image6 = rs.getBlob(6);
                	
                	if(image1==null){
                		BooleanArrayList.add("false");
                	}else{
                		BooleanArrayList.add("true");
                	}
                	if(image2==null){
                		BooleanArrayList.add("false");
                	}else{
                		BooleanArrayList.add("true");
                	}
                	if(image3==null){
                		BooleanArrayList.add("false");
                	}else{
                		BooleanArrayList.add("true");
                	}
                	if(image4==null){
                		BooleanArrayList.add("false");
                	}else{
                		BooleanArrayList.add("true");
                	}
                	if(image5==null){
                		BooleanArrayList.add("false");
                	}else{
                		BooleanArrayList.add("true");
                	}
                	if(image6==null){
                		BooleanArrayList.add("false");
                	}else{
                		BooleanArrayList.add("true");
                	}
                
                     
                }
         }catch( Exception e){
                e. printStackTrace();
         }finally {
                 try {
                      rs.close();
                      stmt.close();
                      con.close();
                } catch (SQLException e) {

                      e.printStackTrace();

                }
         }
         return BooleanArrayList;
	 }


	 
	 public boolean checkboxUpdate(String sql) {
			
			Connection con=null;
			boolean b= false;
			
			try {
				DatabaseController dc = DatabaseController.getInstance();
				try {
					con = (Connection) dc.getConnection();
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				Statement stmt=con.createStatement();
				stmt.executeUpdate(sql);
				b=true;
			
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						System.out.println("error in connection close");
					}
					con = null;
				}
			}
			
			return b;
			
		}
	 
	 public boolean updatetLockStatus(String sql){
			boolean status=false;
			Connection con = null;
			try {
				DatabaseController d = DatabaseController.getInstance();	
				con=(Connection)d.getConnection();	
				Statement stmt = (Statement) con.createStatement();
			    stmt.execute(sql);
			    status=true;
			    System.out.println("updatetLockStatus SQL : "+sql);
			} catch (SQLException e) {
				System.out.println("Error On varification update Lock Status : "+e.toString());
			}
			finally{  
				if (con != null) { 
					try { 
						con.close(); 
					}catch (SQLException e) {
						
					}
					con = null;
				} 
			}
			System.out.println("status : "+status);
			return status;
		}
	 
	
	

}
