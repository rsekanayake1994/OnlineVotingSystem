package com.evidu.bank.sva;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.evidu.bank.entitiy.UserInfo;
import com.evidu.bank.entitiy.UserPages;


public class loginController_erandi {
	
	public UserInfo loginUser(String username, String password)  {	
		UserInfo userData =new UserInfo();
		PreparedStatement statement;
		Connection con = null;  
		Statement st = null;
		
		String SQL = "SELECT * FROM `tnp_dataentry_users` WHERE TNP_DATAENTRY_USER_NAME=? AND TNP_DATAENTRY_USER_PASSWORD=?";
		try {
			DatabaseController d = DatabaseController.getInstance();
			con=d.getConnection();
			statement = con.prepareStatement(SQL);
			 statement.setString(1, username);
			 statement.setString(2, password);
			 ResultSet rs = statement.executeQuery();
			while( rs.next() ){
//				userData.setTNP_DATAENTRY_USER_ID(rs.getString("TNP_DATAENTRY_USER_ID"));
//				userData.setTNP_DATAENTRY_USER_NAME(rs.getString("TNP_DATAENTRY_USER_NAME"));
//				userData.setTNP_DATAENTRY_USER_PASSWORD(rs.getString("TNP_DATAENTRY_USER_PASSWORD"));
//				userData.setTNP_DATAENTRY_USER_PARENT_ID(rs.getString("TNP_DATAENTRY_USER_PARENT_ID"));
//				userData.setTNP_DATAENTRY_USER_OWNER_ID(rs.getString("TNP_DATAENTRY_USER_OWNER_ID"));
//				userData.setTNP_DATAENTRY_USER_ROLE(rs.getString("TNP_DATAENTRY_USER_ROLE"));
//				userData.setTNP_DATAENTRY_USER_FULLNAME(rs.getString("TNP_DATAENTRY_USER_FULLNAME"));
//				userData.setTNP_DATAENTRY_USER_PHONE(rs.getString("TNP_DATAENTRY_USER_PHONE"));
//				userData.setTNP_DATAENTRY_USER_EMAIL(rs.getString("TNP_DATAENTRY_USER_EMAIL"));
//				userData.setTNP_DATAENTRY_USER_ADDRESS_HOUSE_NO(rs.getString("TNP_DATAENTRY_USER_ADDRESS_HOUSE_NO"));
//				userData.setTNP_DATAENTRY_USER_ADDRESS_CITY(rs.getString("TNP_DATAENTRY_USER_ADDRESS_CITY"));
//				userData.setTNP_DATAENTRY_USER_ADDRESS_STATE(rs.getString("TNP_DATAENTRY_USER_ADDRESS_STATE"));
//				userData.setTNP_DATAENTRY_USER_ADDRESS_STREET(rs.getString("TNP_DATAENTRY_USER_ADDRESS_STREET"));
//				userData.setTNP_DATAENTRY_USER_ADDRESS_DISTRICT(rs.getString("TNP_DATAENTRY_USER_ADDRESS_DISTRICT"));
//				userData.setTNP_DATAENTRY_USER_ADDRESS_THANA(rs.getString("TNP_DATAENTRY_USER_ADDRESS_THANA"));
//				userData.setTNP_DATAENTRY_USER_ADDRESS_UNION(rs.getString("TNP_DATAENTRY_USER_ADDRESS_UNION"));
//				userData.setTNP_DATAENTRY_USER_ADDRESS_DIVISION(rs.getString("TNP_DATAENTRY_USER_ADDRESS_DIVISION"));
//				userData.setTNP_DATAENTRY_USER_ADDRESS_POSTCODE(rs.getString("TNP_DATAENTRY_USER_ADDRESS_POSTCODE"));
//				userData.setTNP_DATAENTRY_USER_CREATED_BY(rs.getString("TNP_DATAENTRY_USER_CREATED_BY"));
//				userData.setTNP_DATAENTRY_USER_CREATED_DATE(rs.getString("TNP_DATAENTRY_USER_CREATED_DATE"));
//				userData.setTNP_DATAENTRY_USER_CREATED_BRANCH(rs.getString("TNP_DATAENTRY_USER_CREATED_BRANCH"));
//				userData.setTNP_DATAENTRY_USER_LAST_LOGIN_DATE(rs.getString("TNP_DATAENTRY_USER_LAST_LOGIN_DATE"));
//				userData.setTNP_DATAENTRY_STATUS(rs.getString("TNP_DATAENTRY_STATUS"));
			} 
			
		} catch (Exception e) {
			System.out.println("Error On loginUser java : "+e.toString());
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
		return userData;
	}
	
	public UserPages getFirstpage(String userRoles,int id) {
		  
		  UserPages userPG= new UserPages();
		  Connection con = null;  
		  PreparedStatement statement = null;
		  String SQL="SELECT * FROM `tnp_user_pages` WHERE TNP_USER_PAGES_USER_TYPE=? AND TNP_USER_PAGES_PAGE_ID=?";
		  try {
			  DatabaseController d = DatabaseController.getInstance();
				con=d.getConnection();
				statement = con.prepareStatement(SQL);
				 statement.setString(1, userRoles);
				 statement.setInt(2, id);
				 ResultSet rs = statement.executeQuery();
		   while( rs.next() ){
		    userPG.setPageId(rs.getString("TNP_USER_PAGES_PAGE_ID"));
		    userPG.setPageName(rs.getString("TNP_USER_PAGES_PAGENAME"));
		    userPG.setUserRole(rs.getString("TNP_USER_PAGES_USER_TYPE"));
		    userPG.setAutoId(rs.getString("TNP_USER_PAGES_AUTOID"));
		   } 
		  } catch (Exception e) {
		   System.out.println("Error On get Single page java : "+e.toString());
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
		  return userPG;
		 }
		 
		public List<UserPages> getPagesList(String[] userRoles) {
		  
		 List<UserPages> pageList= new ArrayList<UserPages>();
		 String SQL="SELECT * FROM `tnp_user_pages` WHERE TNP_USER_PAGES_USER_TYPE='"+userRoles[0]+"' ";
		 if(userRoles.length>1){
		  for(int i=1;i<userRoles.length;i++){
		   SQL+=" OR TNP_USER_PAGES_USER_TYPE='"+userRoles[i]+"' ";
		  }
		 }
		 SQL+=" ORDER BY TNP_USER_PAGES_AUTOID ";
		 System.out.println("******************SQL"+SQL);
		  Connection con = null;  
		  Statement st = null;
		  try {
		   DatabaseController d = DatabaseController.getInstance();
		   con=d.getConnection();
		   ResultSet rs = null;
		   st = (Statement)con.createStatement();   
		   rs = st.executeQuery(SQL);
		   while( rs.next() ){
		    UserPages userPG= new UserPages();
		    userPG.setPageId(rs.getString("TNP_USER_PAGES_PAGE_ID"));
		    userPG.setPageName(rs.getString("TNP_USER_PAGES_PAGENAME"));
		    userPG.setUserRole(rs.getString("TNP_USER_PAGES_USER_TYPE"));
		    userPG.setAutoId(rs.getString("TNP_USER_PAGES_AUTOID"));
		    userPG.setSpanTitle(rs.getString("TNP_USER_PAGES_SPAN_TITLE"));
		    userPG.setIclass(rs.getString("TNP_USER_PAGES_I_CLASS"));
		    pageList.add(userPG);
		   } 
		   
		  } catch (Exception e) {
		   System.out.println("Error On get PagesList page java : "+e.toString());
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
		  return pageList;
		 }

}
