
package com.evidu.bank.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.evidu.bank.entitiy.UserInfo;
import com.evidu.bank.model.UserVO;
import com.evidu.bank.sva.DatabaseController;
import com.evidu.bank.sva.MainController;
import com.evidu.secure.Secure;

public class UserDAO {
	Connection connection;
	private PreparedStatement preparedStatement;
	Statement stmt;

	public ArrayList<UserVO> getUserInfo(String userID) {
		Statement statement = null;
		UserVO userVO = null;
		UserInfo userInfo = new UserInfo();
		
		//System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeee - "+userID);
		ArrayList<UserVO> arrList = new ArrayList<UserVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			String query = "SELECT * FROM user Where status!='TERMINATED' AND parent_id='"+userID+"'";
			//String query = "SELECT * FROM (SELECT * FROM tnp_dataentry_users ORDER BY TNP_DATAENTRY_USER_CREATED_BY,TNP_DATAENTRY_USER_AUTOID) tnp_dataentry_users_sorted,(SELECT @pv := '"+userID+"') initialisation WHERE find_in_set(TNP_DATAENTRY_USER_CREATED_BY,@pv) and length(@pv := concat(@pv, ',',TNP_DATAENTRY_USER_AUTOID))";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				userVO = new UserVO();

				userVO.setId(rs.getInt("user_autoid"));
				userVO.setUsername(rs.getString("username"));
				userVO.setOrganization(rs
						.getString("organization"));
				// userVO.setOrganization("root");
				userVO.setPassword(rs.getString("password"));
				userVO.setRealName(rs.getString("name"));
				userVO.setUserRoles(rs.getString("usertype"));
				userVO.setLastLoggedIn(rs
						.getString("last_login_date"));
				//userVO.setComment(rs.getString("TNP_DATAENTRY_USER_COMMENTS"));
				userVO.setMobileNo(rs.getString("mobile"));
				userVO.setEmail(rs.getString("email"));
				userVO.setStatus(rs.getString("status"));
				userVO.setCreatedBy(rs
						.getString("created_by"));
				userVO.setUserId(rs.getString("user_id"));
				arrList.add(userVO);
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
		return arrList;
	}
	
	public ArrayList<UserVO> getUserInfo1(String userID) {
		Statement statement = null;
		UserVO userVO = null;
		UserInfo userInfo = new UserInfo();
		
		System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeee - "+userID);
		ArrayList<UserVO> arrList1 = new ArrayList<UserVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_PARENT_ID='"+userID+"'";
			String query = "SELECT * FROM (SELECT * FROM user Where status!='TERMINATED' ORDER BY created_by,user_autoid) user_sorted,(SELECT @pv := '"+userID+"') initialisation WHERE find_in_set(parent_id,@pv) and length(@pv := concat(@pv, ',',user_autoid))";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				userVO = new UserVO();

				userVO.setId(rs.getInt("user_autoid"));
				userVO.setUsername(rs.getString("username"));
				userVO.setOrganization(rs
						.getString("organization"));
				// userVO.setOrganization("root");
				userVO.setPassword(rs.getString("password"));
				userVO.setRealName(rs.getString("name"));
				userVO.setUserRoles(rs.getString("usertype"));
				userVO.setLastLoggedIn(rs
						.getString("last_login_date"));
				//userVO.setComment(rs.getString("TNP_DATAENTRY_USER_COMMENTS"));
				userVO.setMobileNo(rs.getString("mobile"));
				userVO.setEmail(rs.getString("email"));
				userVO.setStatus(rs.getString("status"));
				userVO.setCreatedBy(rs
						.getString("created_by"));
				userVO.setUserId(rs.getString("user_id"));
				arrList1.add(userVO);
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
		return arrList1;
	}
	

	public boolean updateUser(UserVO user, String oldUserName) {
		boolean status = false;
		
		Secure sec = null;
		try {
			sec = new Secure();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

        
        String encryptedPwd=sec.encrypt(user.getPassword());
		if (!user.getUserRoles().equals("")) {
			String query = "UPDATE user set password=?,name=?,mobile=?,email=?,usertype=? WHERE username = ?";
			try {
				// Get a connection:
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

				PreparedStatement preparedStmt = connection
						.prepareStatement(query);
				// preparedStmt.setString(1, user.getUsername());
				preparedStmt.setString(1, user.getPassword());
				preparedStmt.setString(2, user.getRealName());
				preparedStmt.setString(3, user.getMobileNo());
				preparedStmt.setString(4, user.getEmail());
				preparedStmt.setString(5, user.getUserRoles());
				preparedStmt.setString(6, oldUserName);
				// execute the java prepared statement
				preparedStmt.executeUpdate();
				status = true;

			} catch (Exception exp) {
				exp.printStackTrace();
			} finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		} else {
			String query = "UPDATE user set password=?,name=?,mobile=?,email=? WHERE username = ?";
			try {
				// Get a connection:
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

				PreparedStatement preparedStmt = connection
						.prepareStatement(query);
				// preparedStmt.setString(1, user.getUsername());
				preparedStmt.setString(1, user.getPassword());
				preparedStmt.setString(2, user.getRealName());
				preparedStmt.setString(3, user.getMobileNo());
				preparedStmt.setString(4, user.getEmail());
				preparedStmt.setString(5, oldUserName);
				// execute the java prepared statement
				preparedStmt.executeUpdate();
				status = true;

			} catch (Exception exp) {
				exp.printStackTrace();
			} finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return status;
	}
	
	public boolean replaceUser(UserVO user, String victimID) {
		boolean status = false;
		//System.out.println("@@@@@@victimID@@@@@@ " + victimID);
		Statement statement = null;
		
		String userIdnew = "";
		
		try
		{
			MainController mc = new MainController();
			String userIDQuery = "SELECT user_id AS USER_PARENT_USER_TYPE FROM user ORDER BY CAST(user_id AS UNSIGNED) DESC LIMIT 1";

			String returnUserID = mc.getParentuserType(userIDQuery);
			//returnUserID = returnUserID.substring(3);
			//System.out.println("@@@@@@##########$$$$$$$$$$   "+returnUserID );
			int newuserID = Integer.parseInt(returnUserID);
			newuserID = newuserID + 1;
			userIdnew = userIdnew + newuserID;
			//System.out.println("@@@@@@##########$$$$$$$$$$   "+userIdnew );
			
			String username = "";
			String organization = "";
			String password = "";
			String realname = "";
			String userroles = "";
			String lastloggedin = "";
			String comment = "";
			String mobileno = "";
			String email = "";
			
			String userID = "";
			String createdby = "";
			String parentID = "";
		
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			
			String query = "SELECT * FROM user Where user_autoid='"+victimID+"'";
			
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
							
				username = (rs.getString("username"));
				organization = (rs.getString("organization"));
				
				password = (rs.getString("password"));
				realname = (rs.getString("name"));
				userroles = (rs.getString("usertype"));
				lastloggedin = (rs.getString("last_login_date"));
				
				mobileno = (rs.getString("mobile"));
				email = (rs.getString("email"));
				createdby = (rs.getString("created_by"));
				parentID = (rs.getString("parent_id"));
				userID = (rs.getString("user_id"));
							
			}
			
			String query1 = "INSERT INTO user(username,organization,password,name,usertype,last_login_date,mobile,email,created_by,user_id,status,parent_id)"
					+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
			
			preparedStatement = connection.prepareStatement(query1);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, organization);
			//preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(3, password);
			preparedStatement.setString(4, realname);
			preparedStatement.setString(5, userroles);
			preparedStatement.setString(6, lastloggedin);
			
			preparedStatement.setString(7, mobileno);
			preparedStatement.setString(8, email);
			preparedStatement.setString(9, createdby);
			preparedStatement.setString(10, userID);
			preparedStatement.setString(11, "TERMINATED");
			preparedStatement.setString(12, parentID);

			preparedStatement.executeUpdate();
			
			String conagquery="INSERT INTO `obdv5`.`assign_dial_no_campaign` (`user_id`, `dialing_no`, `status`, `campaign_type`)"+ "VALUES(?,?,?,?)";
			String conagquery1="INSERT INTO `obdv5`.`assign_dial_no_campaign` (`user_id`, `dialing_no`, `status`, `campaign_type`)"+ "VALUES (?,?,?,?)";
			preparedStatement = connection.prepareStatement(conagquery);
			preparedStatement.setString(1, userIdnew);
			preparedStatement.setString(2, "0115148234");
			preparedStatement.setString(3, "ACTIVE");
			preparedStatement.setString(4, "INB");
			preparedStatement.executeUpdate();
			
			
			preparedStatement = connection.prepareStatement(conagquery1);
			preparedStatement.setString(1, userIdnew);
			preparedStatement.setString(2, "0115148237");
			preparedStatement.setString(3, "ACTIVE");
			preparedStatement.setString(4, "OBD");
			preparedStatement.executeUpdate();
			
			//stmt = connection.createStatement();
			//stmt.executeQuery(conagquery);
			//stmt.executeQuery(conagquery1);
			//System.out.println("ekath hari2");
			
		}
		catch(Exception exp)
		{
			exp.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		Secure sec = null;
		try {
			sec = new Secure();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

        
        //String encryptedPwd=sec.encrypt(user.getPassword());
		
		
		if (!user.getUserRoles().equals("")) {
			String query = "UPDATE user set username=?,password=?,name=?,mobile=?,email=?,usertype=?,user_id=?,status=? WHERE user_autoid = ?";
			try {
				// Get a connection:
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

				PreparedStatement preparedStmt = connection
						.prepareStatement(query);
				preparedStmt.setString(1, user.getUsername());
				preparedStmt.setString(2, user.getPassword());
				preparedStmt.setString(3, user.getRealName());
				preparedStmt.setString(4, user.getMobileNo());
				preparedStmt.setString(5, user.getEmail());
				preparedStmt.setString(6, user.getUserRoles());
				preparedStmt.setString(7, userIdnew);
				preparedStmt.setString(8, "SYSTEM_GENERATED");
				preparedStmt.setString(9, victimID);
				// execute the java prepared statement
				preparedStmt.executeUpdate();
				status = true;

			} catch (Exception exp) {
				exp.printStackTrace();
			} finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		} 
			else {
			String query = "UPDATE user set username=?,password=?,name=?,mobile=?,email=?,user_id=?,status=? WHERE user_autoid = ?";
			try {
				// Get a connection:
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

				PreparedStatement preparedStmt = connection
						.prepareStatement(query);
				preparedStmt.setString(1, user.getUsername());
				preparedStmt.setString(2, user.getPassword());
				preparedStmt.setString(3, user.getRealName());
				preparedStmt.setString(4, user.getMobileNo());
				preparedStmt.setString(5, user.getEmail());
				preparedStmt.setString(6, userIdnew);
				preparedStmt.setString(7, "SYSTEM_GENERATED");
				preparedStmt.setString(8, victimID);
				// execute the java prepared statement
				preparedStmt.executeUpdate();
				status = true;

			} catch (Exception exp) {
				exp.printStackTrace();
			} finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return status;
	}

	
	
	
	

	public boolean addUser(UserVO user) {
		
		Statement statement = null;
       String planePwd =  user.getPassword();
       String userlevel = "1";
       String orgID = "";
		Secure sec = null;
		try {
			sec = new Secure();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

        //String target="imparator";
//        String encryptedPwd=sec.encrypt(planePwd);
		
		boolean status = false;
		/*
		 * String query =
		 * "INSERT INTO tnp_dataentry_users(username,organization,password,real_name,user_roles,last_logged_in,comment,mobile_no,email,created_by)"
		 * + "VALUES (?,?,?,?,?,?,?,?,?,?)";
		 * 
		 */
		try {
		String query2 = "SELECT ORGANIZATION_ID FROM organizations WHERE ORGANIZATION_NAME = '"+user.getOrganization()+"'";
		
		DatabaseController d1 = DatabaseController.getInstance();
		connection = (Connection) d1.getConnection();
		
		ResultSet rs = null;
		statement = (Statement) connection.createStatement();
		rs = statement.executeQuery(query2);
		
		while (rs.next()) {
						
			orgID = (rs.getString("ORGANIZATION_ID"));
			
						
		}
		
		} catch (Exception e) {
			e.printStackTrace();
			// LogClass.log.error(e);
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		String query = "INSERT INTO user(username,organization,password,name,usertype,last_login_date,mobile,email,created_by,user_id,status,user_level,parent_id,companyid)"
				+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			// Get a connection:
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();

			String userId = "";
			MainController mc = new MainController();
			String userIDQuery = "SELECT user_id AS USER_PARENT_USER_TYPE FROM user ORDER BY CAST(user_id AS UNSIGNED) DESC LIMIT 1";

			String returnUserID = mc.getParentuserType(userIDQuery);
			//returnUserID = returnUserID.substring(3);
			//System.out.println("@@@@@@##########$$$$$$$$$$   "+returnUserID );
			int newuserID = Integer.parseInt(returnUserID);
			newuserID = newuserID + 1;
			userId = userId + newuserID;
			//System.out.println("@@@@@@##########$$$$$$$$$$   "+newuserID );

			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getOrganization());
			//preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(3, planePwd);
			preparedStatement.setString(4, user.getRealName());
			preparedStatement.setString(5, user.getUserRoles());
			preparedStatement.setString(6, user.getLastLoggedIn());
		
			preparedStatement.setString(7, user.getMobileNo());
			preparedStatement.setString(8, user.getEmail());
			preparedStatement.setString(9, user.getCreatedBy());
			preparedStatement.setString(10, userId);
			preparedStatement.setString(11, "SYSTEM_GENERATED");
			preparedStatement.setString(12, userlevel);
			preparedStatement.setString(13, user.getParent());
			preparedStatement.setString(14, orgID);

			preparedStatement.executeUpdate();
			
			
			
			//stmt = connection.createStatement();
			//stmt.executeQuery(conagquery);
			//stmt.executeQuery(conagquery1);
			//System.out.println("ekath hari2")
			
			status = true;

		} catch (Exception e) {
			e.printStackTrace();
			// LogClass.log.error(e);
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return status;

	}

	public boolean deleteUser(String username) {
		boolean isSuccess = false;

		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			String query = "Delete FROM user WHERE username='"
					+ username + "'";
			stmt = connection.createStatement();
			stmt.executeUpdate(query);
			isSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return isSuccess;

	}
	
	public boolean deleteVoter(String username) {
		boolean isSuccess = false;

		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			String param="TERMINATED";
			String query = "Update voter set login_status='"+param+"' WHERE username='"
					+ username + "'";
			stmt = connection.createStatement();
			stmt.executeUpdate(query);
			System.out.println("update voter status: "+query);
			isSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return isSuccess;

	}
	
	
	
	
	public boolean unlockUser(String userId){
		
		boolean isSuccess = false;

		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			String query = "UPDATE user set status='ACTIVE',login_attempts=0 WHERE user_id='"
					+ userId + "'";
			System.out.println("^^^^^^^^^^^^***666666666**************^^^^^^^^^^^^^^"+query);
			stmt = connection.createStatement();
			stmt.executeUpdate(query);
			isSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return isSuccess;
	}
	
public boolean unlockVoter(String userId){
		
		boolean isSuccess = false;

		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			String query = "UPDATE voter set login_status='ACTIVE',login_attempts=0 WHERE voter_id='"
					+ userId + "'";
			System.out.println("^^^^^^^^^^^^***Unlovk Voter**************^^^^^^^^^^^^^^"+query);
			stmt = connection.createStatement();
			stmt.executeUpdate(query);
			isSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return isSuccess;
	}
	
	
	
	
	
	public String createdUser(String UID){
		Statement statement = null;
		String Uname = null;
		
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			
			String query = "SELECT username FROM user Where user_autoid='"+UID+"'";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			//System.out.println("SQL " + query);
			while (rs.next()) {
				Uname = rs.getString("username");
			}
			//System.out.println("^^^^^^^^^^^^Uname^^^^^^^^^^^^^^"+Uname);
			return Uname;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return null;
	}
	
	public ArrayList<UserVO> getUserInfo2(String userID) {
		Statement statement = null;
		UserVO userVO = null;
		UserInfo userInfo = new UserInfo();
		
		//System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeee - "+userID);
		ArrayList<UserVO> arrList4 = new ArrayList<UserVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			String query = "SELECT * FROM user ";
			//String query = "SELECT * FROM (SELECT * FROM tnp_dataentry_users ORDER BY TNP_DATAENTRY_USER_CREATED_BY,TNP_DATAENTRY_USER_AUTOID) tnp_dataentry_users_sorted,(SELECT @pv := '"+userID+"') initialisation WHERE find_in_set(TNP_DATAENTRY_USER_CREATED_BY,@pv) and length(@pv := concat(@pv, ',',TNP_DATAENTRY_USER_AUTOID))";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				userVO = new UserVO();

				
				userVO.setUsername(rs.getString("username"));
				
				
				
				arrList4.add(userVO);
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
		return arrList4;
	}
	
	public ArrayList<UserVO> getNavigationList(String userID,String masterID) {
		Statement statement = null;
		UserVO userVO = null;
		UserInfo userInfo = new UserInfo();
		String parentID = userID;
		
		ArrayList<UserVO> arrList = new ArrayList<UserVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			
			while(!(parentID.equals(masterID)))
			{
				String query = "SELECT * FROM user Where status!='TERMINATED' AND user_autoid='"+parentID+"'";
				ResultSet rs = null;
				statement = (Statement) connection.createStatement();
				rs = statement.executeQuery(query);
				
				while (rs.next()) {
					userVO = new UserVO();
					userVO.setId(rs.getInt("user_autoid"));
					userVO.setUsername(rs.getString("username"));
					userVO.setOrganization(rs.getString("organization"));
					parentID = rs.getString("parent_id");
					arrList.add(userVO);
				}
				
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
		
		return arrList;
	}
	
	
	
	
	
	
}
