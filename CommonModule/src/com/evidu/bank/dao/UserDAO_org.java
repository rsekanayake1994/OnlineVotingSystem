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

import com.evidu.bank.model.UserVO;
import com.evidu.bank.sva.DatabaseController;
import com.evidu.bank.sva.MainController;

public class UserDAO_org {
	Connection connection;
	private PreparedStatement preparedStatement;
	Statement stmt;

	public ArrayList<UserVO> getUserInfo() {
		Statement statement = null;
		UserVO userVO = null;
		ArrayList<UserVO> arrList = new ArrayList<UserVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			String query = "SELECT * FROM tnp_dataentry_users";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				userVO = new UserVO();

				userVO.setId(rs.getInt("TNP_DATAENTRY_USER_AUTOID"));
				userVO.setUsername(rs.getString("TNP_DATAENTRY_USER_NAME"));
				userVO.setOrganization(rs
						.getString("TNP_DATAENTRY_ORGANIZATION"));
				// userVO.setOrganization("root");
				userVO.setPassword(rs.getString("TNP_DATAENTRY_USER_PASSWORD"));
				userVO.setRealName(rs.getString("TNP_DATAENTRY_USER_FULLNAME"));
				userVO.setUserRoles(rs.getString("TNP_DATAENTRY_USER_ROLE"));
				userVO.setLastLoggedIn(rs
						.getString("TNP_DATAENTRY_USER_LAST_LOGIN_DATE"));
				userVO.setComment(rs.getString("TNP_DATAENTRY_USER_COMMENTS"));
				userVO.setMobileNo(rs.getString("TNP_DATAENTRY_USER_PHONE"));
				userVO.setEmail(rs.getString("TNP_DATAENTRY_USER_EMAIL"));
				userVO.setCreatedBy(rs
						.getString("TNP_DATAENTRY_USER_CREATED_BY"));
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

	public boolean updateUser(UserVO user, String oldUserName) {
		boolean status = false;
		if (!user.getUserRoles().equals("")) {
			String query = "UPDATE tnp_dataentry_users set TNP_DATAENTRY_USER_PASSWORD=?,TNP_DATAENTRY_USER_FULLNAME=?,TNP_DATAENTRY_USER_PHONE=?,TNP_DATAENTRY_USER_EMAIL=?,TNP_DATAENTRY_USER_ROLE=? WHERE TNP_DATAENTRY_USER_NAME = ?";
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
			String query = "UPDATE tnp_dataentry_users set TNP_DATAENTRY_USER_PASSWORD=?,TNP_DATAENTRY_USER_FULLNAME=?,TNP_DATAENTRY_USER_PHONE=?,TNP_DATAENTRY_USER_EMAIL=? WHERE TNP_DATAENTRY_USER_NAME = ?";
			try {
				// Get a connection:
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();

				PreparedStatement preparedStmt = connection.prepareStatement(query);
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

	public boolean addUser(UserVO user) {
		boolean status = false;
		/*
		 * String query =
		 * "INSERT INTO tnp_dataentry_users(username,organization,password,real_name,user_roles,last_logged_in,comment,mobile_no,email,created_by)"
		 * + "VALUES (?,?,?,?,?,?,?,?,?,?)";
		 */
		String query = "INSERT INTO tnp_dataentry_users(TNP_DATAENTRY_USER_NAME,TNP_DATAENTRY_ORGANIZATION,TNP_DATAENTRY_USER_PASSWORD,TNP_DATAENTRY_USER_FULLNAME,TNP_DATAENTRY_USER_ROLE,TNP_DATAENTRY_USER_LAST_LOGIN_DATE,TNP_DATAENTRY_USER_COMMENTS,TNP_DATAENTRY_USER_PHONE,TNP_DATAENTRY_USER_EMAIL,TNP_DATAENTRY_USER_CREATED_BY,TNP_DATAENTRY_USER_ID,TNP_DATAENTRY_STATUS)"
				+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			// Get a connection:
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();

			String userId = "DEO";
			MainController mc = new MainController();
			String userIDQuery = "SELECT TNP_DATAENTRY_USER_ID AS TNP_DATAENTRY_USER_PARENT_USER_TYPE FROM `tnp_dataentry_users` ORDER BY TNP_DATAENTRY_USER_ID DESC LIMIT 1";

			String returnUserID = mc.getParentuserType(userIDQuery);
			returnUserID = returnUserID.substring(3);
			int newuserID = Integer.parseInt(returnUserID);
			newuserID = newuserID + 1;
			userId = userId + newuserID;

			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getOrganization());
			preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(4, user.getRealName());
			preparedStatement.setString(5, user.getUserRoles());
			preparedStatement.setString(6, user.getLastLoggedIn());
			preparedStatement.setString(7, user.getComment());
			preparedStatement.setString(8, user.getMobileNo());
			preparedStatement.setString(9, user.getEmail());
			preparedStatement.setString(10, user.getCreatedBy());
			preparedStatement.setString(11, userId);
			preparedStatement.setString(12, "SYSTEM_GENERATED");

			preparedStatement.executeUpdate();
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
		String UAutoID = "";
		int count = 0;
		

		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			//get user auto ID form database using user name
			String query1 = "SELECT * FROM `user` WHERE username = ?";
			PreparedStatement preparedStmt1 = connection.prepareStatement(query1);
			preparedStmt1.setString(1, username);
			
			ResultSet rs = preparedStmt1.executeQuery();
			
			while (rs.next()) {
				
				UAutoID = rs.getString("user_autoid");
			
			}
			//update parent as removed. simple query
			String query2 = "UPDATE user set status=? WHERE username = ?";
			PreparedStatement preparedStmt = connection.prepareStatement(query2);
			
			preparedStmt.setString(1, "TERMINATED");
			preparedStmt.setString(2, username);
			preparedStmt.executeUpdate();
			//select count of childs of parent. this query is run because we want to define array leangth related to child number
			String query3 = "SELECT COUNT(*) FROM (SELECT * FROM user ORDER BY created_by,user_autoid) users_sorted,(SELECT @pv := '"+UAutoID+"') initialisation WHERE find_in_set(parent_id,@pv) and length(@pv := concat(@pv, ',',user_autoid))";
			
			PreparedStatement preparedStmt3 = connection.prepareStatement(query3);
			
			ResultSet rs3 = preparedStmt3.executeQuery();
			
			while (rs3.next()) {						
				count = rs3.getInt("count(*)");
			}
			//System.out.println("<<<<<<<<<<<count>>>>>>>>>>"+count);
			//define array leangth as count of childs
			String [] Array1 = new String[count];
			//get child auto ids
			String query4 = "SELECT user_autoid FROM (SELECT * FROM user ORDER BY created_by,user_autoid) users_sorted,(SELECT @pv := '"+UAutoID+"') initialisation WHERE find_in_set(parent_id,@pv) and length(@pv := concat(@pv, ',',user_autoid))";
			PreparedStatement preparedStmt4 = connection.prepareStatement(query4);
			
			ResultSet rs4 = preparedStmt4.executeQuery();
				
			int k = 0;
			
			while (rs4.next())
			{
				//save auto ids to array
				Array1[k] = rs4.getString("user_autoid");
				k++;
			}
			
			PreparedStatement preparedStmt5;
			String query5 = "";
			for(int j=0;j<count;j++) {
				//update child as deleted using child's auto ids
				query5 = "UPDATE user set status=? WHERE user_autoid =?";
				System.out.println("<<<<<<<<<<<query5>>>>>>>>>>"+query5);
				preparedStmt5 = connection.prepareStatement(query5);
				
				preparedStmt5.setString(1, "TERMINATED");
				preparedStmt5.setString(2, Array1[j]);
				
				preparedStmt5.executeUpdate();
			}
			
			
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
}
