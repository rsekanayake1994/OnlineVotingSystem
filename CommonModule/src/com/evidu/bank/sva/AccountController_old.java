package com.evidu.bank.sva;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.evidu.bank.entitiy.Dealer;
import com.evidu.bank.entitiy.TemporyAccount;
import com.evidu.bank.entitiy.UserInfo;
import com.evidu.bank.entitiy.Account;
import com.evidu.bank.entitiy.AccountImg;
import com.evidu.bank.entitiy.AgentImg;

public class AccountController_old {
	
	public boolean InsertNewData(String sql){
		boolean status=false;
		Connection con = null;
		try {
			DatabaseController d = DatabaseController.getInstance();	
			con=(Connection)d.getConnection();	
			Statement stmt = (Statement) con.createStatement();
		    stmt.execute(sql);
		    status=true;
		    System.out.println("Insert new Data SQL"+sql);
		} catch (SQLException e) {
			System.out.println("Error On insert new Account Data : "+e.toString());
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
	
public boolean updateImageDB(String sql,InputStream nid,InputStream photo,InputStream kyc,InputStream tin,InputStream citizen,InputStream other){
		
		Connection con = null;
		boolean st=false;
		PreparedStatement statement;
		int i = 0;
		try{
			DatabaseController d = DatabaseController.getInstance();	
			con=(Connection)d.getConnection();	
			statement = con.prepareStatement(sql);
			if (nid != null) {
				i++;
				statement.setBlob(i, nid);
			}if (photo != null) {
				i++;
				statement.setBlob(i, photo);
			}if (kyc != null) {
				i++;
				statement.setBlob(i, kyc);
			}if (tin != null) {
				i++;
				statement.setBlob(i, tin);
			}if (citizen != null) {
				i++;
				statement.setBlob(i, citizen);
			}if (other != null) {
				i++;
				statement.setBlob(i, other);
			}
			
			    int row = statement.executeUpdate();
			    st=true;
		} catch (SQLException e) {
			System.out.println("Error On new Images update : "+e.toString());
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
		System.out.println("status : "+st);
		return st;
	}
public boolean updateImageDBPath(String sql,String nid,String photo,String kyc,String tin,String citizen,String other){
	
	Connection con = null;
	boolean st=false;
	PreparedStatement statement;
	int i = 0;
	try{
		DatabaseController d = DatabaseController.getInstance();	
		con=(Connection)d.getConnection();	
		statement = con.prepareStatement(sql);
		if (!nid.equals("")) {
			i++;
			//statement.setBlob(i, nid);
			statement.setString(i, nid);
		}if (!photo.equals("")) {
			i++;
			//statement.setBlob(i, photo);
			statement.setString(i, photo);
		}if (!kyc.equals("")) {
			i++;
			//statement.setBlob(i, kyc);
			statement.setString(i, kyc);
		}if (!tin.equals("")) {
			i++;
//			statement.setBlob(i, tin);
			statement.setString(i, tin);
		}if (!citizen.equals("")) {
			i++;
			//statement.setBlob(i, citizen);
			statement.setString(i, citizen);
		}if (!other.equals("")) {
			i++;
			//statement.setBlob(i, other);
			statement.setString(i, other);
		}
		
		    int row = statement.executeUpdate();
		    st=true;
	} catch (SQLException e) {
		System.out.println("Error On new Images update : "+e.toString());
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
	System.out.println("status : "+st);
	return st;
}

public boolean updateImageCxImg(String sql,String tin,String citizen,String other){
	
	Connection con = null;
	boolean st=false;
	PreparedStatement statement;
	int i = 0;
	try{
		DatabaseController d = DatabaseController.getInstance();	
		con=(Connection)d.getConnection();	
		statement = con.prepareStatement(sql);
		
		System.out.println("sql : "+sql);
		if (tin != null) {
			i++;
			//statement.setBlob(i, tin);
			statement.setString(i, tin);
		}if (citizen != null) {
			i++;
			//statement.setBlob(i, citizen);
			statement.setString(i, citizen);
		}if (other != null) {
			i++;
			//statement.setBlob(i, other);
			statement.setString(i, other);
		}
		
		    int row = statement.executeUpdate();
		    st=true;
	} catch (SQLException e) {
		
		System.out.println("Error On bank Rejected new Images update : "+e.toString());
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
	System.out.println("status : "+st);
	return st;
}
	
	public boolean updateCustomerProfile(String sql){
		
		boolean status=false;
		Connection con = null;
		try {
			DatabaseController d = DatabaseController.getInstance();	
			con=(Connection)d.getConnection();	
			Statement stmt = (Statement) con.createStatement();
		    stmt.execute(sql);
		    status=true;
		    System.out.println("updateCustomerProfile SQL"+sql);
		} catch (SQLException e) {
			System.out.println("Error On update Custome rProfile : "+e.toString());
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
	
	public boolean updatetOldImage(String sql){
		boolean status=false;
		Connection con = null;
		try {
			DatabaseController d = DatabaseController.getInstance();	
			con=(Connection)d.getConnection();	
			Statement stmt = (Statement) con.createStatement();
		    stmt.execute(sql);
		    status=true;
		    System.out.println("InsertOldImage SQL : "+sql);
		} catch (SQLException e) {
			System.out.println("Error On insert Old Images : "+e.toString());
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
		System.out.println("status *** : "+status);
		return status;
	}
	
	public boolean updateCxImages(String sql){
		boolean status=false;
		Connection con = null;
		try {
			DatabaseController d = DatabaseController.getInstance();	
			con=(Connection)d.getConnection();	
			Statement stmt = (Statement) con.createStatement();
		    stmt.execute(sql);
		    status=true;
		    System.out.println("updateCxImages SQL : "+sql);
		} catch (SQLException e) {
			System.out.println("Error On update Cx Images : "+e.toString());
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
	
	public boolean updateCxData(String sql){
		boolean status=false;
		Connection con = null;
		try {
			DatabaseController d = DatabaseController.getInstance();	
			con=(Connection)d.getConnection();	
			Statement stmt = (Statement) con.createStatement();
		    stmt.execute(sql);
		    status=true;
		    System.out.println("updateCxData SQL : "+sql);
		} catch (SQLException e) {
			System.out.println("Error On update update Cx Data : "+e.toString());
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
	
	public boolean updatetTemporyImage(String sql,InputStream nid,InputStream photo,InputStream kyc ){
		
		Connection con = null;
		boolean st=false;
		PreparedStatement statement;
		int i = 0;
		try{
			DatabaseController d = DatabaseController.getInstance();	
			con= (Connection) d.getConnection();	
			statement = con.prepareStatement(sql);
			if (nid != null) {
				i++;
				statement.setBlob(i, nid);
			}if (photo != null) {
				//i++;
				statement.setBlob(i, photo);
			}if (kyc != null) {
				//i++;
				statement.setBlob(i, kyc);
			}
			    int row = statement.executeUpdate();
			    st=true;
		} catch (SQLException e) {
			System.out.println("Error On new tempory Images : "+e.toString());
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
		System.out.println("status : "+st);
		return st;
	}

	public boolean updateTmpImgPath(String sql, String nidPath, String photoPath, String kycPath ){
		
		Connection con = null;
		boolean st = false;
		PreparedStatement statement;
		int i = 0;
		try{
			DatabaseController d = DatabaseController.getInstance();	
			con=(Connection)d.getConnection();	
			statement = con.prepareStatement(sql);
			if (!nidPath.equals("")) { // nidPath != null
				i++;
				statement.setString(i, nidPath);
			}
			if (!photoPath.equals("")) {
				i++;
				statement.setString(i, photoPath);
			}
			if (!kycPath.equals("")) {
				i++;
				statement.setString(i, kycPath);
			}
			    int row = statement.executeUpdate();
			    st=true;
		} catch (SQLException e) {
			System.out.println("Error On new tempory Images : "+ e.toString());
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
		System.out.println("status : "+ st);
		return st;
	}
	
	public boolean insertPosTempDeatails(String sql){
		boolean status=false;
		Connection con = null;
		try {
			DatabaseController d = DatabaseController.getInstance();	
			con=(Connection)d.getConnection();	
			Statement stmt = (Statement) con.createStatement();
		    stmt.execute(sql);
		    status=true;
		    System.out.println("insertPosTempDeatails SQL : "+sql);
		} catch (SQLException e) {
			System.out.println("Error On insert PosTempDeatails : "+e.toString());
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
	
	
	
	public boolean insertImage(String SQL,InputStream inputStream,InputStream inputStream2,String accNo,String user,String mobileNo){
		Connection con = null;
		PreparedStatement statement;
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat();
		format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String DateToStr = format.format(date);
		
		System.out.println(DateToStr);
		boolean st=false;
		try {
			DatabaseController d = DatabaseController.getInstance();	
			con=(Connection)d.getConnection();	
			statement = con.prepareStatement(SQL);
			 statement.setString(1, accNo);
			    statement.setString(2, mobileNo);
			   
			   
			     
			   // if (inputStream != null) {
			        // fetches input stream of the upload file for the blob column
			        statement.setBlob(3, inputStream);
			        statement.setBlob(4, inputStream2);
			    //}
			    statement.setString(5,DateToStr );
			    statement.setString(6, user);
			    // sends the statement to the database server
			    int row = statement.executeUpdate();
			    st=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	   
		return st;
	}
	
	public boolean insertImage1(String SQL,InputStream inputStream,InputStream inputStream2,InputStream inputStream3,InputStream inputStream4,InputStream inputStream5,InputStream inputStream6,String user,String mobileNo,String uuid,String KycNo){
		
		Connection con = null;
		PreparedStatement statement;
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat();
		format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String DateToStr = format.format(date);
		
		System.out.println(DateToStr);
		boolean st=false;
		try {
			DatabaseController d = DatabaseController.getInstance();	
			con=(Connection)d.getConnection();	
			statement = con.prepareStatement(SQL);
			 statement.setString(1, uuid);
			 statement.setString(2, mobileNo);
			   // if (inputStream != null) {
			        // fetches input stream of the upload file for the blob column
			        statement.setBlob(3, inputStream);
			        statement.setBlob(4, inputStream2);
			        statement.setBlob(5, inputStream3);
			        statement.setBlob(6, inputStream4);
			        statement.setBlob(7, inputStream5);
			        statement.setBlob(8, inputStream6);
			        
			    //}
			    statement.setString(9,DateToStr );
			    statement.setString(10, user);
			    statement.setString(11, KycNo);
			    // sends the statement to the database server
			    int row = statement.executeUpdate();
			    st=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	   
		return st;
	}
	
//disabled	
public boolean insertCustomerImg(String SQL,InputStream inputStream,InputStream inputStream2,InputStream inputStream3,InputStream inputStream4,InputStream inputStream5,InputStream inputStream6,String user,String mobileNo,String uuid,String refNo){
		
		Connection con = null;
		PreparedStatement statement;
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat();
		format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String DateToStr = format.format(date);
		
		System.out.println(DateToStr);
		boolean st=false;
		try {
			DatabaseController d = DatabaseController.getInstance();	
			con=(Connection)d.getConnection();	
			statement = con.prepareStatement(SQL);
			 statement.setString(1, uuid);
			 statement.setString(2, mobileNo);
			 statement.setString(3, refNo);
			   // if (inputStream != null) {
			        // fetches input stream of the upload file for the blob column
				 	statement.setBlob(4, inputStream4);
			        statement.setBlob(5, inputStream5);
			        statement.setBlob(6, inputStream6);
			        statement.setBlob(7, inputStream);
			        statement.setBlob(8, inputStream2);
			        statement.setBlob(9, inputStream3);
			       
			        
			    //}
			    statement.setString(10,DateToStr );
			    statement.setString(11, user);
			    // sends the statement to the database server
			    int row = statement.executeUpdate();
			    st=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	   
		return st;
	}

public boolean insertNewImage(String SQL,InputStream tin,InputStream citizen,InputStream other,String createUser,String mobileNo,String uuid,String refNo,String KYCNo){
	
	Connection con = null;
	PreparedStatement statement;
	int i = 0;
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat();
	format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String DateToStr = format.format(date);
	
	System.out.println(DateToStr);
	boolean st=false;
	try{
		DatabaseController d = DatabaseController.getInstance();	
		con=(Connection)d.getConnection();	
		statement = con.prepareStatement(SQL);
		 statement.setString(1, uuid);
		 statement.setString(2, mobileNo);
		 statement.setString(3, refNo);
		 
		 statement.setBlob(4, tin);
		 statement.setBlob(5, citizen);
		 statement.setBlob(6, other);
		   // if (inputStream != null) {
		        // fetches input stream of the upload file for the blob column
		 
		 	/*if (tin != null) {
				//i++;
				statement.setBlob(4, tin);
			}if (citizen != null) {
				//i++;
				statement.setBlob(5, citizen);
			}if (other != null) {
				//i++;
				statement.setBlob(6, other);
			}*/
		        
		    //}
		    statement.setString(7,DateToStr );
		    statement.setString(8, createUser);
		    statement.setString(9, KYCNo);
		    // sends the statement to the database server
		    int row = statement.executeUpdate();
		    st=true;
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
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
	return st;
}
public boolean insertNewImgPaths(String SQL,String tin,String citizen,String other,String createUser,String mobileNo,String uuid,String refNo,String KYCNo){
	
	Connection con = null;
	PreparedStatement statement;
	int i = 0;
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat();
	format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String DateToStr = format.format(date);
	
	System.out.println(DateToStr);
	boolean st=false;
	try{
		DatabaseController d = DatabaseController.getInstance();	
		con=(Connection)d.getConnection();	
		statement = con.prepareStatement(SQL);
		 statement.setString(1, uuid);
		 statement.setString(2, mobileNo);
		 statement.setString(3, refNo);
		 
		 /*statement.setBlob(4, tin);
		 statement.setBlob(5, citizen);
		 statement.setBlob(6, other);*/
		 
		 statement.setString(4, tin);
		 statement.setString(5, citizen);
		 statement.setString(6, other);
		 
		 
		   // if (inputStream != null) {
		        // fetches input stream of the upload file for the blob column
		 
		 	/*if (tin != null) {
				//i++;
				statement.setBlob(4, tin);
			}if (citizen != null) {
				//i++;
				statement.setBlob(5, citizen);
			}if (other != null) {
				//i++;
				statement.setBlob(6, other);
			}*/
		        
		    //}
		    statement.setString(7,DateToStr );
		    statement.setString(8, createUser);
		    statement.setString(9, KYCNo);
		    // sends the statement to the database server
		    int row = statement.executeUpdate();
		    st=true;
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
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
	return st;
}


public boolean updateCustomerImg(String SQL,InputStream inputStream,InputStream inputStream2,InputStream inputStream3,InputStream inputStream4,InputStream inputStream5,InputStream inputStream6,String user,String mobileNo,String uuid,String refNo){
	
	Connection con = null;
	PreparedStatement statement;
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat();
	format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String DateToStr = format.format(date);
	
	System.out.println(DateToStr);
	boolean st=false;
	try {
		DatabaseController d = DatabaseController.getInstance();	
		con=(Connection)d.getConnection();	
		statement = con.prepareStatement(SQL);
		 statement.setString(1, uuid);
		 statement.setString(2, mobileNo);
		 statement.setString(3, refNo);
		   // if (inputStream != null) {
		        // fetches input stream of the upload file for the blob column
			 	statement.setBlob(4, inputStream4);
		        statement.setBlob(5, inputStream5);
		        statement.setBlob(6, inputStream6);
		        statement.setBlob(7, inputStream);
		        statement.setBlob(8, inputStream2);
		        statement.setBlob(9, inputStream3);
		       
		        
		    //}
		    statement.setString(10,DateToStr );
		    statement.setString(11, user);
		    // sends the statement to the database server
		    int row = statement.executeUpdate();
		    st=true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
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
   
	return st;
}

	public TemporyAccount getTemporyAccDetails(String SQL)  {	
		TemporyAccount temporyAcc = new TemporyAccount();
		Connection con = null;  
		Statement st = null;
		Blob image_nid = null;
		Blob image_photo = null;
		Blob image_kyc = null;
		
		String image_nid_path = "";
		String image_photo_path = "";
		String image_kyc_path = "";
		
		try {
			DatabaseController d = DatabaseController.getInstance();
			con=d.getConnection();
			ResultSet rs = null;
			st = (Statement)con.createStatement();			
			rs = st.executeQuery(SQL);
			
			System.out.println(" getTemporyAccDetails SQL "+SQL);
			while( rs.next() ){
				
				temporyAcc.setMSISDN(""+rs.getString("MSISDN"));
				temporyAcc.setNIC(""+rs.getString("NIC"));
				temporyAcc.setCREATED_DATE(""+rs.getString("CREATED_DATE"));
				temporyAcc.setSTATUS(""+rs.getString("STATUS"));
				temporyAcc.setMOTHERS_NAME(""+rs.getString("MOTHERS_NAME"));
				temporyAcc.setADDRESS_HOUSE_NO(""+rs.getString("ADDRESS_HOUSE_NO"));
				temporyAcc.setADDRESS_CITY(""+rs.getString("ADDRESS_CITY"));
				temporyAcc.setADDRESS_STATE(""+rs.getString("ADDRESS_STATE"));
				temporyAcc.setADDRESS_STREET(""+rs.getString("ADDRESS_STREET"));
				temporyAcc.setCUSTOMER_NAME(""+rs.getString("CUSTOMER_NAME"));
				temporyAcc.setREF_NO(rs.getString("REF_NO"));
				temporyAcc.setKYC_NO(""+rs.getString("KYC_NO"));
				temporyAcc.setLockStatus(""+rs.getString("LOCK_STATUS"));
				temporyAcc.setLockBy(""+rs.getString("LOCK_BY"));
				temporyAcc.setLockTime(""+rs.getString("LOCK_TIME"));
				temporyAcc.setBANK_IMG_REJECT_REASON(rs.getString("BANK_IMG_REJECT_REASON"));
				
				/*	image_nid = rs.getBlob("NID_IMAGE");
				image_photo = rs.getBlob("USER_IMAGE");
				image_kyc = rs.getBlob("KYC_IMAGE");
				*/
				image_nid_path = rs.getString("NID_IMAGE_PATH");
				image_photo_path =  rs.getString("USER_IMAGE_PATH");
				image_kyc_path = rs.getString("KYC_IMAGE_PATH");
				
				if(image_nid_path!=null && image_nid_path.length()>0){
					temporyAcc.setUSER_NID_PATH("true");
					
				}else{
					temporyAcc.setUSER_NID_PATH("false");
				}
				if(image_photo_path!=null && image_photo_path.length()>0){
					temporyAcc.setUSER_IMAGR_PATH("true");
					
				}else{
					temporyAcc.setImage_photo("false");
				}
				if(image_kyc_path!=null && image_kyc_path.length()>0){
					temporyAcc.setKYC_PATH("true");
					
				}else{
					temporyAcc.setKYC_PATH("false");
				}
				
				System.out.println("Error image_kyc: "+image_kyc.length());
			} 
		} catch (Exception e) {
			System.out.println("Error On tempory account details : "+e.toString());
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
		return temporyAcc;
	}
	
	  public List<TemporyAccount> getTempdurationResult(String SQL) throws SQLException{
			 
		 	List<TemporyAccount> tempList = new ArrayList<TemporyAccount>();
	        Connection connection = null;
	        DatabaseController d = DatabaseController.getInstance();
	        connection = (Connection) d.getConnection();
			
	        Statement stmt = null;
	        ResultSet rs=null;
	        
	        try {
		        	System.out.println("Temp SQL : "+SQL);
		            stmt = (Statement) connection.createStatement();
		                rs = stmt.executeQuery(SQL);
		                while (rs.next()){
		                	//UrlTotal urlTot = new UrlTotal();
		                	TemporyAccount tempAcc = new TemporyAccount();
		                	tempAcc.setMSISDN(rs.getString("MSISDN"));
		                	tempAcc.setKYC_NO(rs.getString("KYC_NO"));
		                	tempAcc.setCUSTOMER_NAME(rs.getString("CUSTOMER_NAME"));
		                	tempAcc.setNIC(rs.getString("NIC"));
		                	tempList.add(tempAcc);
		                }
	                }catch (Exception e) {
	                	System.out.println("** getTempAccreport **"+e.toString());
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
		 
		 return tempList;
	 }
	
 public  AccountImg getAccountImgDetail(String SQL)  {	
		
	 	AccountImg AccImg = new AccountImg();
		Connection con = null;  
		Statement st = null;
		
		Blob blobTinImg = null;
		Blob blobcitizenImg = null;
		Blob blobotherImg = null;
		
		try {
			DatabaseController d = DatabaseController.getInstance();
			con=d.getConnection();
			ResultSet rs = null;
			st = (Statement)con.createStatement();			
			rs = st.executeQuery(SQL);
			System.out.println("getAccountImgDetail SQL "+SQL);
			while( rs.next() ){
				
				AccImg.setTNP_CX_PROFILE_IMAGES_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_IMAGES_PROFILE_UUID"));
				AccImg.setTNP_CX_PROFILE_IMAGES_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_IMAGES_MOBILE_NUMBER"));
				AccImg.setTNP_CX_PROFILE_IMAGES_REF_NO(rs.getString("TNP_CX_PROFILE_IMAGES_REF_NO"));
				AccImg.setTNP_CX_PROFILE_IMAGES_KYC_NO(rs.getString("TNP_CX_PROFILE_IMAGES_KYC_NO"));
				
				blobTinImg = rs.getBlob("TNP_CX_PROFILE_IMAGES_TIN_FORM");
				blobcitizenImg = rs.getBlob("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM");
				blobotherImg = rs.getBlob("TNP_CX_PROFILE_IMAGES_OTHER");
				
				if(blobTinImg != null){
					AccImg.setTNP_CX_PROFILE_IMAGES_TIN("true");
				}
				if(blobcitizenImg != null){
					AccImg.setTNP_CX_PROFILE_IMAGES_CITIZEN("true");
				}
				if(blobotherImg != null){
					AccImg.setTNP_CX_PROFILE_IMAGES_OTHER("true");
				}
				//AccImg.setTNP_CX_PROFILE_IMAGES_TIN((String) rs.getBlob("TNP_CX_PROFILE_IMAGES_TIN_FORM"));
				
			} 
		} catch (Exception e) {
			System.out.println("Error On getAccountImgDetail details : "+e.toString());
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
		return AccImg;
	}
 public  AccountImg getAccountImgPathDetail(String SQL)  {	
		
	 	AccountImg AccImg = new AccountImg();
		Connection con = null;  
		Statement st = null;
		
		/*Blob blobTinImg = null;
		Blob blobcitizenImg = null;
		Blob blobotherImg = null;*/
		
		String TinImgPath = null;
		String citizenImgPath = null;
		String otherImgPath = null;
		
		try {
			DatabaseController d = DatabaseController.getInstance();
			con=d.getConnection();
			ResultSet rs = null;
			st = (Statement)con.createStatement();			
			rs = st.executeQuery(SQL);
			System.out.println("getAccountImgDetail SQL "+SQL);
			while( rs.next() ){
				
				AccImg.setTNP_CX_PROFILE_IMAGES_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_IMAGES_PROFILE_UUID"));
				AccImg.setTNP_CX_PROFILE_IMAGES_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_IMAGES_MOBILE_NUMBER"));
				AccImg.setTNP_CX_PROFILE_IMAGES_REF_NO(rs.getString("TNP_CX_PROFILE_IMAGES_REF_NO"));
				AccImg.setTNP_CX_PROFILE_IMAGES_KYC_NO(rs.getString("TNP_CX_PROFILE_IMAGES_KYC_NO"));
				
			/*	blobTinImg = rs.getBlob("TNP_CX_PROFILE_IMAGES_TIN_FORM");
				blobcitizenImg = rs.getBlob("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM");
				blobotherImg = rs.getBlob("TNP_CX_PROFILE_IMAGES_OTHER");*/
				
				TinImgPath= rs.getString("TNP_CX_PROFILE_IMAGES_TIN_FORM_PATH");
				citizenImgPath = rs.getString("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM_PATH");
				otherImgPath = rs.getString("TNP_CX_PROFILE_IMAGES_OTHER_PATH");
				
				
				if(TinImgPath!=null){ //blobTinImg != null
					AccImg.setTNP_CX_PROFILE_IMAGES_TIN("true");
				}
				if(citizenImgPath!=null){
					AccImg.setTNP_CX_PROFILE_IMAGES_CITIZEN("true");
				}
				if(otherImgPath!=null){
					AccImg.setTNP_CX_PROFILE_IMAGES_OTHER("true");
				}
				//AccImg.setTNP_CX_PROFILE_IMAGES_TIN((String) rs.getBlob("TNP_CX_PROFILE_IMAGES_TIN_FORM"));
				
			} 
		} catch (Exception e) {
			System.out.println("Error On getAccountImgDetail details : "+e.toString());
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
		return AccImg;
	}
 
 public TemporyAccount getTemporyAccountDetail(String SQL)  {	
		
	 	TemporyAccount temAcc= new TemporyAccount();
		Connection con = null;  
		Statement st = null;
		
		try {
			DatabaseController d = DatabaseController.getInstance();
			con=d.getConnection();
			ResultSet rs = null;
			st = (Statement)con.createStatement();			
			rs = st.executeQuery(SQL);
			System.out.println("SQL "+SQL);
			while( rs.next() ){
				
				temAcc.setREF_NO(rs.getString("REF_NO"));
				temAcc.setMSISDN(rs.getString("MSISDN"));
				
			} 
		} catch (Exception e) {
			System.out.println("Error On getTemporyAccountDetail : "+e.toString());
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
		return temAcc;
	}

	
	public Account getAccountDetail(String SQL)  {	
		
		Account acc = new Account();
		Connection con = null;  
		Statement st = null;
		
		try {
			DatabaseController d = DatabaseController.getInstance();
			con=d.getConnection();
			ResultSet rs = null;
			st = (Statement)con.createStatement();			
			rs = st.executeQuery(SQL);
			System.out.println("SQL "+SQL);
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
            	acc.setTNP_CX_PROFILE_INFO1(rs.getString("TNP_CX_PROFILE_INFO1"));
            	acc.setLockStatus(rs.getString("TNP_CX_PROFILE_LOCK_STATUS"));
            	acc.setLockBy(rs.getString("TNP_CX_PROFILE_LOCK_BY"));
            	acc.setLockTime(rs.getString("TNP_CX_PROFILE_LOCK_TIME"));
            	
				
			} 
		} catch (Exception e) {
			System.out.println("Error On getAccountDetail : "+e.toString());
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
public AccountImg getCXImageDeatailsPath(String SQL){
		
			AccountImg cxImg = new AccountImg();
			Connection con = null;  
			Statement st = null;
			
			/*Blob image_nid = null;
			Blob image_photo = null;
			Blob image_kyc = null;
			Blob image_tin = null;
			Blob image_citizen = null;
			Blob image_other = null;*/
			
			String image_nid_path = "";
			String image_photo_path = "";
			String image_kyc_path = "";
			String image_tin_path = "";
			String image_citizen_path = "";
			String image_other_path = "";
			
			try {
				DatabaseController d = DatabaseController.getInstance();
				con=d.getConnection();
				ResultSet rs = null;
				st = (Statement)con.createStatement();			
				rs = st.executeQuery(SQL);
				//System.out.println("SQL "+SQL);
				while( rs.next() ){
					
					cxImg.setTNP_CX_PROFILE_IMAGES_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_IMAGES_PROFILE_UUID"));
					cxImg.setTNP_CX_PROFILE_IMAGES_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_IMAGES_MOBILE_NUMBER"));
					cxImg.setTNP_CX_PROFILE_IMAGES_KYC_NO(rs.getString("TNP_CX_PROFILE_IMAGES_KYC_NO"));
					cxImg.setTNP_CX_PROFILE_IMAGES_REF_NO(rs.getString("TNP_CX_PROFILE_IMAGES_REF_NO"));
					cxImg.setLock_status(rs.getString("TNP_CX_PROFILE_IMAGES_LOCK_STATUS"));
					cxImg.setLock_by(rs.getString("TNP_CX_PROFILE_IMAGES_LOCK_BY"));
					cxImg.setLock_time(rs.getString("TNP_CX_PROFILE_IMAGES_LOCK_TIME"));
					cxImg.setTNP_CX_PROFILE_IMAGES_NFO1(rs.getString("TNP_CX_PROFILE_IMAGES_NFO1"));
					
					/*image_nid = rs.getBlob("TNP_CX_PROFILE_IMAGES_NID");
					image_photo = rs.getBlob("TNP_CX_PROFILE_IMAGES_PHOTO");
					image_kyc = rs.getBlob("TNP_CX_PROFILE_IMAGES_KYC_FORM");
					image_tin = rs.getBlob("TNP_CX_PROFILE_IMAGES_TIN_FORM");
					image_citizen = rs.getBlob("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM");
					image_other = rs.getBlob("TNP_CX_PROFILE_IMAGES_OTHER");*/
					
					image_nid_path = rs.getString("TNP_CX_PROFILE_IMAGES_NID_PATH");
					image_photo_path = rs.getString("TNP_CX_PROFILE_IMAGES_PHOTO_PATH");
					image_kyc_path = rs.getString("TNP_CX_PROFILE_IMAGES_KYC_FORM_PATH");
					image_tin_path = rs.getString("TNP_CX_PROFILE_IMAGES_TIN_FORM_PATH");
					image_citizen_path = rs.getString("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM_PATH");
					image_other_path = rs.getString("TNP_CX_PROFILE_IMAGES_OTHER_PATH");	
					
					cxImg.setImage_nid_path(rs.getString("TNP_CX_PROFILE_IMAGES_NID_PATH"));
					cxImg.setImage_photo_path(rs.getString("TNP_CX_PROFILE_IMAGES_PHOTO_PATH"));
					cxImg.setImage_kyc_path(rs.getString("TNP_CX_PROFILE_IMAGES_KYC_FORM_PATH"));
					cxImg.setImage_tin_path(rs.getString("TNP_CX_PROFILE_IMAGES_TIN_FORM_PATH"));
					cxImg.setImage_citizen_path(rs.getString("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM_PATH"));
					cxImg.setImage_other_path(rs.getString("TNP_CX_PROFILE_IMAGES_OTHER_PATH"));
						
						if(image_nid_path!=null && image_nid_path.length()>0 ){
							cxImg.setImage_nid("true");
							cxImg.setImage_nid_path("true");
							
						}else{
							cxImg.setImage_nid("false");
							cxImg.setImage_nid_path("false");
						}
						if(image_photo_path!=null && image_photo_path.length()>0){
							cxImg.setImage_photo("true");
							cxImg.setImage_photo_path("true");
							
						}else{
							cxImg.setImage_photo("false");
							cxImg.setImage_photo_path("false");
						}
						if(image_kyc_path!=null && image_kyc_path.length()>0){
							cxImg.setImage_kyc("true");
							cxImg.setImage_kyc_path("true");
							
						}else{
							cxImg.setImage_kyc("false");
							cxImg.setImage_kyc_path("false");
						}
						if(image_tin_path!=null && image_tin_path.length()>0){
							cxImg.setImage_tin("true");
							cxImg.setImage_tin_path("true");
							
						}else{
							cxImg.setImage_tin("false");
							cxImg.setImage_tin_path("false");
						}
						
						if(image_citizen_path!=null && image_citizen_path.length()>0){
							cxImg.setImage_citizen("true");
							cxImg.setImage_citizen_path("true");
							
						}else{
							cxImg.setImage_citizen("false");
							cxImg.setImage_citizen_path("false");
						}
						
						if(image_other_path!=null && image_other_path.length()>0){
							cxImg.setImage_other("true");
							cxImg.setImage_other_path("true");
							
						}else{
							cxImg.setImage_other("false");
							cxImg.setImage_other_path("false");
						}
				} 
			} catch (Exception e) {
				System.out.println("Error On get CX Img details : "+e.toString());
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
			
			return cxImg;
		}	
public AccountImg getCXImageDeatails (String SQL){
		
	AccountImg cxImg = new AccountImg();
		Connection con = null;  
		Statement st = null;
		
		String image_nid_path = "";
		String image_photo_path = "";
		String image_kyc_path = "";
		String image_tin_path = "";
		String image_citizen_path = "";
		String image_other_path = "";
		
		try {
			DatabaseController d = DatabaseController.getInstance();
			con=d.getConnection();
			ResultSet rs = null;
			st = (Statement)con.createStatement();			
			rs = st.executeQuery(SQL);
			//System.out.println("SQL "+SQL);
			while( rs.next() ){
				
				cxImg.setTNP_CX_PROFILE_IMAGES_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_IMAGES_PROFILE_UUID"));
				cxImg.setTNP_CX_PROFILE_IMAGES_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_IMAGES_MOBILE_NUMBER"));
				cxImg.setTNP_CX_PROFILE_IMAGES_KYC_NO(rs.getString("TNP_CX_PROFILE_IMAGES_KYC_NO"));
				cxImg.setTNP_CX_PROFILE_IMAGES_REF_NO(rs.getString("TNP_CX_PROFILE_IMAGES_REF_NO"));
				cxImg.setLock_status(rs.getString("TNP_CX_PROFILE_IMAGES_LOCK_STATUS"));
				cxImg.setLock_by(rs.getString("TNP_CX_PROFILE_IMAGES_LOCK_BY"));
				cxImg.setLock_time(rs.getString("TNP_CX_PROFILE_IMAGES_LOCK_TIME"));
				cxImg.setTNP_CX_PROFILE_IMAGES_NFO1(rs.getString("TNP_CX_PROFILE_IMAGES_NFO1"));
				
				image_nid_path = rs.getString("TNP_CX_PROFILE_IMAGES_NID_PATH");
				image_photo_path = rs.getString("TNP_CX_PROFILE_IMAGES_PHOTO_PATH");
				image_kyc_path = rs.getString("TNP_CX_PROFILE_IMAGES_KYC_FORM_PATH");
				image_tin_path = rs.getString("TNP_CX_PROFILE_IMAGES_TIN_FORM_PATH");
				image_citizen_path = rs.getString("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM_PATH");
				image_other_path = rs.getString("TNP_CX_PROFILE_IMAGES_OTHER_PATH");
				
				cxImg.setImage_nid_path(rs.getString("TNP_CX_PROFILE_IMAGES_NID_PATH"));
				cxImg.setImage_photo_path(rs.getString("TNP_CX_PROFILE_IMAGES_PHOTO_PATH"));
				cxImg.setImage_kyc_path(rs.getString("TNP_CX_PROFILE_IMAGES_KYC_FORM_PATH"));
				cxImg.setImage_tin_path(rs.getString("TNP_CX_PROFILE_IMAGES_TIN_FORM_PATH"));
				cxImg.setImage_citizen_path(rs.getString("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM_PATH"));
				cxImg.setImage_other_path(rs.getString("TNP_CX_PROFILE_IMAGES_OTHER_PATH"));
				
				/*image_nid = rs.getBlob("TNP_CX_PROFILE_IMAGES_NID");
				image_photo = rs.getBlob("TNP_CX_PROFILE_IMAGES_PHOTO");
				image_kyc = rs.getBlob("TNP_CX_PROFILE_IMAGES_KYC_FORM");
				image_tin = rs.getBlob("TNP_CX_PROFILE_IMAGES_TIN_FORM");
				image_citizen = rs.getBlob("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM");
				image_other = rs.getBlob("TNP_CX_PROFILE_IMAGES_OTHER");*/
					
					
					if(image_nid_path!=null && image_nid_path.length()>0 ){
						//cxImg.setImage_nid("true");
						cxImg.setImage_nid_path("true");
						
					}else{
						//cxImg.setImage_nid("false");
						cxImg.setImage_nid_path("false");
					}
					if(image_photo_path!=null && image_photo_path.length()>0){
						//cxImg.setImage_photo("true");
						cxImg.setImage_photo_path("true");
						
					}else{
						//cxImg.setImage_photo("false");
						cxImg.setImage_photo_path("false");
					}
					if(image_kyc_path!=null && image_kyc_path.length()>0){
						//cxImg.setImage_kyc("true");
						cxImg.setImage_kyc_path("true");
						
					}else{
						cxImg.setImage_kyc_path("false");
					}
					if(image_tin_path!=null && image_tin_path.length()>0){
						//cxImg.setImage_tin("true");
						cxImg.setImage_tin_path("true");
						
					}else{
						//cxImg.setImage_tin("false");
						cxImg.setImage_tin_path("false");
					}
					
					if(image_citizen_path!=null && image_citizen_path.length()>0){
						//cxImg.setImage_citizen("true");
						cxImg.setImage_citizen_path("true");
						
					}else{
						//cxImg.setImage_citizen("false");
						cxImg.setImage_citizen_path("false");
					}
					
					if(image_other_path!=null && image_other_path.length()>0){
						//cxImg.setImage_other("true");
						cxImg.setImage_other_path("true");
						
					}else{
						cxImg.setImage_other_path("false");
					}
			} 
		} catch (Exception e) {
			System.out.println("Error On get CX Img details : "+e.toString());
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
		
		return cxImg;
	}

public List<AccountImg> getAccountImgList(String SQL) throws SQLException{
	
  	List<AccountImg> accImg = new ArrayList<AccountImg>();
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
            	
            	AccountImg cxImg = new AccountImg();
            	//cxImg.setTNP_CX_PROFILE_IMAGES_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_IMAGES_PROFILE_UUID"));
				cxImg.setTNP_CX_PROFILE_IMAGES_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_IMAGES_MOBILE_NUMBER"));
				cxImg.setTNP_CX_PROFILE_IMAGES_KYC_NO(rs.getString("TNP_CX_PROFILE_IMAGES_KYC_NO"));
				cxImg.setTNP_CX_PROFILE_IMAGES_REF_NO(rs.getString("TNP_CX_PROFILE_IMAGES_REF_NO"));
				cxImg.setCreateDate(rs.getString("TNP_CX_PROFILE_IMAGES_CREATE_DATE"));
				//cxImg.setBankDate(rs.getString("TNP_CX_PROFILE_IMAGES_BANK_STATUS_DATE"));
            	accImg.add(cxImg);
            	
            }
            }catch (Exception e) {
            	System.out.println("** getAccountImgList **"+e.toString());
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
	return accImg;
}

public List<AccountImg> getAccountImgListBIA(String SQL) throws SQLException{
	
  	List<AccountImg> accImg = new ArrayList<AccountImg>();
    Connection connection = null;
    DatabaseController d = DatabaseController.getInstance();
    connection = (Connection) d.getConnection();
	
    Statement stmt = null;
    ResultSet rs=null;
    
    try {
    	System.out.println("getPendingCustomerList SQL : "+SQL);
        stmt = (Statement) connection.createStatement();
            rs = stmt.executeQuery(SQL);
            System.out.println("SQL DDDDDEEEEO : "+SQL);
            while (rs.next()){
            	
            	AccountImg cxImg = new AccountImg();
            	//cxImg.setTNP_CX_PROFILE_IMAGES_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_IMAGES_PROFILE_UUID"));
				cxImg.setTNP_CX_PROFILE_IMAGES_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_IMAGES_MOBILE_NUMBER"));
				cxImg.setTNP_CX_PROFILE_IMAGES_KYC_NO(rs.getString("TNP_CX_PROFILE_IMAGES_KYC_NO"));
				cxImg.setTNP_CX_PROFILE_IMAGES_REF_NO(rs.getString("TNP_CX_PROFILE_IMAGES_REF_NO"));
				//cxImg.setCreateDate(rs.getString("TNP_CX_PROFILE_IMAGES_CREATE_DATE"));
				cxImg.setBankDate(rs.getString("TNP_CX_PROFILE_IMAGES_BANK_STATUS_DATE"));
            	accImg.add(cxImg);
            	
            }
            }catch (Exception e) {
            	System.out.println("** getAccountImgList BIA **"+e.toString());
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
	return accImg;
}

public List<Account> getAccountDataList(String SQL) throws SQLException{
	
	List<Account> acc = new ArrayList<Account>();
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
            	Account cxAcc = new Account();
				cxAcc.setTNP_CX_PROFILE_MOBILE_NUMBER(rs.getString("TNP_CX_PROFILE_MOBILE_NUMBER"));
				cxAcc.setTNP_CX_PROFILE_KYC_FORM_NO(rs.getString("TNP_CX_PROFILE_KYC_FORM_NO"));
				cxAcc.setTNP_CX_PROFILE_NAME(rs.getString("TNP_CX_PROFILE_MOTHER_NAME"));
				cxAcc.setTNP_CX_PROFILE_GENDER(rs.getString("TNP_CX_PROFILE_GENDER"));
				cxAcc.setTNP_CX_PROFILE_MOTHER_NAME(rs.getString("TNP_CX_PROFILE_MOTHER_NAME"));
				cxAcc.setTNP_CX_PROFILE_STATUS(rs.getString("TNP_CX_PROFILE_STATUS"));
				cxAcc.setTNP_CX_PROFILE_MODIFIED_DATE(rs.getString("TNP_CX_PROFILE_MODIFIED_DATE"));
				cxAcc.setTNP_CX_PROFILE_UUID(rs.getString("TNP_CX_PROFILE_UUID"));
            	acc.add(cxAcc);
            }
            }catch (Exception e) {
            	System.out.println("** getAccountImgList **"+e.toString());
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
	return acc;
}
	
	public UserInfo getdealerInfo(String SQL)  {	
			
		    UserInfo ui = new UserInfo();
			Connection con = null;  
			Statement st = null;
			
			try {
				DatabaseController d = DatabaseController.getInstance();
				con=d.getConnection();
				ResultSet rs = null;
				st = (Statement)con.createStatement();			
				rs = st.executeQuery(SQL);
				System.out.println("SQL "+SQL);
				while( rs.next() ){
//					
//					ui.setTNP_DATAENTRY_USER_FULLNAME(rs.getString("TNP_DATAENTRY_USER_FULLNAME"));
//					ui.setTNP_DATAENTRY_USER_PHONE(rs.getString("TNP_DATAENTRY_USER_PHONE"));
//					ui.setTNP_DATAENTRY_USER_ADDRESS_HOUSE_NO(rs.getString("TNP_DATAENTRY_USER_ADDRESS_HOUSE_NO"));
//					ui.setTNP_DATAENTRY_USER_ADDRESS_CITY(rs.getString("TNP_DATAENTRY_USER_ADDRESS_CITY"));
//					ui.setTNP_DATAENTRY_USER_ADDRESS_STATE(rs.getString("TNP_DATAENTRY_USER_ADDRESS_STATE"));
//					ui.setTNP_DATAENTRY_USER_ADDRESS_STREET(rs.getString("TNP_DATAENTRY_USER_ADDRESS_STREET"));
//					ui.setTNP_DATAENTRY_USER_ADDRESS_DISTRICT(rs.getString("TNP_DATAENTRY_USER_ADDRESS_DISTRICT"));
//					ui.setTNP_DATAENTRY_USER_ADDRESS_THANA(rs.getString("TNP_DATAENTRY_USER_ADDRESS_THANA"));
//					ui.setTNP_DATAENTRY_USER_ADDRESS_UNION(rs.getString("TNP_DATAENTRY_USER_ADDRESS_UNION"));
					
				} 
			} catch (Exception e) {
				System.out.println("Error On account details : "+e.toString());
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
			return ui;
		}
	
	 public List<TemporyAccount> getRefNo(String SQL) throws SQLException{
			
		  	List<TemporyAccount> temp = new ArrayList<TemporyAccount>();
	        Connection connection = null;
	        DatabaseController d = DatabaseController.getInstance();
	        connection = (Connection) d.getConnection();
			
	        Statement stmt = null;
	        ResultSet rs=null;
	        
	        try {
	            stmt = (Statement) connection.createStatement();
	                rs = stmt.executeQuery(SQL);
	                while (rs.next()){
	                	
	                	TemporyAccount temp1 = new TemporyAccount();
	                	
	                	temp1.setREF_NO(rs.getString("REF_NO"));
	                	
	                	temp.add(temp1);
	                	
	                }
	                }catch (Exception e) {
	                	System.out.println("** getApporvalList/// **"+e.toString());
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
			return temp;
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
				System.out.println("Error On update Lock Status : "+e.toString());
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
	 
	 public boolean updatetStatus(String sql){
			boolean status=false;
			Connection con = null;
			try {
				DatabaseController d = DatabaseController.getInstance();	
				con=(Connection)d.getConnection();	
				Statement stmt = (Statement) con.createStatement();
			    stmt.execute(sql);
			    status=true;
			    System.out.println("updatet Reject Status SQL : "+sql);
			} catch (SQLException e) {
				System.out.println("Error On updatet Reject Status : "+e.toString());
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
	 
	 public TemporyAccount getMobileTempotyAccDeta(String SQL)  {	
			
		 	TemporyAccount tempData = new TemporyAccount();
			Connection con = null;  
			Statement st = null;
			
			//Blob blobTinImg = null;
			//Blob blobcitizenImg = null;
			//Blob blobotherImg = null;
			
			try {
				DatabaseController d = DatabaseController.getInstance();
				con=d.getConnection();
				ResultSet rs = null;
				st = (Statement)con.createStatement();			
				rs = st.executeQuery(SQL);
				System.out.println("getMobileTempotyAccDeta SQL "+SQL);
				while( rs.next() ){
					
					tempData.setMSISDN(rs.getString("MSISDN"));
					tempData.setNIC(rs.getString("NIC"));
					tempData.setREF_NO(rs.getString("REF_NO"));
					tempData.setSTATUS(rs.getString("STATUS"));
					tempData.setCUSTOMER_NAME(rs.getString("CUSTOMER_NAME"));
					tempData.setCARD_PAN(rs.getString("CARD_PAN"));
					tempData.setKYC_NO(rs.getString("KYC_NO"));
					
					//blobTinImg = rs.getBlob("TNP_CX_PROFILE_IMAGES_TIN_FORM");
					//blobcitizenImg = rs.getBlob("TNP_CX_PROFILE_IMAGES_CITIZEN_CERTIFICATE_FORM");
					//blobotherImg = rs.getBlob("TNP_CX_PROFILE_IMAGES_OTHER");
					/*
					if(blobTinImg != null){
						AccImg.setTNP_CX_PROFILE_IMAGES_TIN("true");
					}
					if(blobcitizenImg != null){
						AccImg.setTNP_CX_PROFILE_IMAGES_CITIZEN("true");
					}
					if(blobotherImg != null){
						AccImg.setTNP_CX_PROFILE_IMAGES_OTHER("true");
					}*/
					
					
				} 
			} catch (Exception e) {
				System.out.println("Error On getMobileTempotyAccDeta : "+e.toString());
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
			return tempData;
		}
	 
	 public TemporyAccount getMobilesearchDeta(String SQL)  {	
			
		 	TemporyAccount tempData = new TemporyAccount();
			Connection con = null;  
			Statement st = null;
			
			String image_nid_path = "";
			String image_photo_path = "";
			String image_kyc_path = "";
			
			try {
				DatabaseController d = DatabaseController.getInstance();
				con=d.getConnection();
				ResultSet rs = null;
				st = (Statement)con.createStatement();			
				rs = st.executeQuery(SQL);
				System.out.println("getMobilesearchDeta SQL "+SQL);
				while( rs.next() ){
					
					tempData.setMSISDN(rs.getString("MSISDN"));
					tempData.setNIC(rs.getString("NIC"));
					tempData.setREF_NO(rs.getString("REF_NO"));
					tempData.setSTATUS(rs.getString("STATUS"));
					tempData.setCUSTOMER_NAME(rs.getString("CUSTOMER_NAME"));
					tempData.setCARD_PAN(rs.getString("CARD_PAN"));
					tempData.setKYC_NO(rs.getString("KYC_NO"));
					tempData.setLockStatus(rs.getString("LOCK_STATUS"));
					
					image_nid_path = rs.getString("NID_IMAGE_PATH");
					image_photo_path = rs.getString("USER_IMAGE_PATH");
					image_kyc_path = rs.getString("KYC_IMAGE_PATH");
					
					tempData.setUSER_NID_PATH(rs.getString("NID_IMAGE_PATH"));
					tempData.setUSER_IMAGR_PATH(rs.getString("USER_IMAGE_PATH"));
					tempData.setKYC_PATH(rs.getString("KYC_IMAGE_PATH"));
					
					System.out.println("image_nid_path  "+image_nid_path);
						if(image_nid_path!=null && image_nid_path.length()>0 ){
							//cxImg.setImage_nid("true");
							System.out.println("nid true");
							tempData.setUSER_NID_PATH("true");
						}else{
							//cxImg.setImage_nid("false");
							System.out.println("nid false");
							tempData.setUSER_NID_PATH("false");
						}
						if(image_photo_path!=null && image_photo_path.length()>0){
							//cxImg.setImage_photo("true");
							System.out.println("photo true");
							tempData.setUSER_IMAGR_PATH("true");
						}else{
							//cxImg.setImage_photo("false");
							System.out.println("photo false");
							tempData.setUSER_IMAGR_PATH("false");
						}
						if(image_kyc_path!=null && image_kyc_path.length()>0){
							//cxImg.setImage_kyc("true");
							System.out.println("kyc true");
							tempData.setKYC_PATH("true");
						}else{
							System.out.println("kyc false");
							tempData.setKYC_PATH("false");
						}
				} 
			} catch (Exception e) {
				System.out.println("Error On getMobilesearchDeta : "+e.toString());
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
			return tempData;
		}
	 
	 public boolean updatetLockStatusCustomer(String sql){
			boolean status=false;
			Connection con = null;
			try {
				DatabaseController d = DatabaseController.getInstance();	
				con=(Connection)d.getConnection();	
				Statement stmt = (Statement) con.createStatement();
			    stmt.execute(sql);
			    status=true;
			    System.out.println("updatetLockStatusCustomer SQL : "+sql);
			} catch (SQLException e) {
				System.out.println("Error On updatetLockStatusCustomer : "+e.toString());
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
	 
	 public boolean updateTtempStatusCustomer(String sql){
			boolean status=false;
			Connection con = null;
			try {
				DatabaseController d = DatabaseController.getInstance();	
				con=(Connection)d.getConnection();	
				Statement stmt = (Statement) con.createStatement();
			    stmt.execute(sql);
			    status=true;
			    System.out.println("updatetTempStatusCustomer SQL : "+sql);
			} catch (SQLException e) {
				System.out.println("Error On updatetTempStatusCustomer : "+e.toString());
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
	 
	 public List<TemporyAccount> getTempList(String SQL) throws SQLException{
			
		  	List<TemporyAccount> accImg = new ArrayList<TemporyAccount>();
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
		            	
		            	TemporyAccount cxImg = new TemporyAccount();
		            	
						cxImg.setMSISDN(rs.getString("MSISDN"));
						cxImg.setCARD_PAN(rs.getString("CARD_PAN"));
						cxImg.setCUSTOMER_NAME(rs.getString("CUSTOMER_NAME"));
						cxImg.setKYC_NO(rs.getString("KYC_NO"));
						cxImg.setNIC(rs.getString("NIC"));
		            }
		            }catch (Exception e) {
		            	System.out.println("** getAccountImgList **"+e.toString());
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
			return accImg;
		}
	 
	 public boolean updatetCustomerEditData(String sql,String nid,String photo,String kyc){
			
			Connection con = null;
			boolean st=false;
			PreparedStatement statement;
			int i = 0;
			try{
				DatabaseController d = DatabaseController.getInstance();	
				con=(Connection)d.getConnection();	
				statement = con.prepareStatement(sql);
				if (!nid.equals("")) {
					i++;
					statement.setString(i, nid);
				}if (!photo.equals("")) {
					i++;
					statement.setString(i, photo);
				}if (!kyc.equals("")) {
					i++;
					statement.setString(i, kyc);
				}
				
				    int row = statement.executeUpdate();
				    st=true;
			} catch (SQLException e) {
				System.out.println("Error On updatet Customer Edit Data : "+e.toString());
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
			System.out.println("status : "+st);
			return st;
		}

}

