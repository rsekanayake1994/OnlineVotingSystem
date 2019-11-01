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
import com.evidu.bank.entitiy.VoterInfo;

public class loginController {
	//Connection con = PreStmt.getCon();
	public UserInfo loginUser(String username, String password) {
		UserInfo userData = new UserInfo();
		PreparedStatement statement;
		Connection con = null;
		Statement st = null;

		String SQL = "SELECT * FROM `user` WHERE username=? AND password=?";
		try {
			
			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();
			statement = con.prepareStatement(SQL);
//			Secure sec = new Secure();
//			
//			String loginEncryPwd = sec.encrypt(password);
			
//			String loginDecryPwd = sec.decrypt(password);
//			System.out.println("hacked - "+loginDecryPwd);
			
			
			statement.setString(1, username);
			statement.setString(2, password);
			//statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			/*PreStmt.getPreparedStatement(SQL);
			((PreparedStatement) PreStmt.getPreparedStatement(SQL)).setString(1, username);
			((PreparedStatement) PreStmt.getPreparedStatement(SQL)).setString(2, password);
			ResultSet rs = ((PreparedStatement) PreStmt.getPreparedStatement(SQL)).executeQuery();*/

			while (rs.next()) {
				userData.setUser_auto_id(rs.getString("user_autoid"));
				userData.setUser_id(rs.getString("user_id"));
				userData.setUsername(rs.getString("username"));
				userData.setPassword(rs.getString("password"));
				userData.setName(rs.getString("name"));
				userData.setUsertype(rs.getString("usertype"));
				userData.setStatus(rs.getString("status"));
				userData.setLogin_attempts(rs.getString("login_attempts"));
				userData.setUser_level(rs.getString("user_level"));
				userData.setParent_level(rs.getString("parent_level"));
				userData.setCreatedate(rs.getString("createdate"));
				userData.setLast_login_date(rs.getString("last_login_date"));
				userData.setCompanyid(rs.getString("companyid"));
				userData.setOrganization(rs.getString("organization"));
				userData.setEmail(rs.getString("email"));
				userData.setMobile(rs.getString("mobile"));
				userData.setCreated_by(rs.getString("created_by"));
				userData.setParent_id(rs.getString("parent_id"));
				
			}

		} catch (Exception e) {
			System.out.println("Error On loginUser java : " + e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
				con = null;
			}
		}
		return userData;
	}

	public VoterInfo loginVoter(String username, String password) {
		VoterInfo voterData = new VoterInfo();
		PreparedStatement statement;
		Connection con = null;
		Statement st = null;

		String SQL = "SELECT * FROM `voter` WHERE username=? AND password=?";
		try {
			
			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();
			statement = con.prepareStatement(SQL);

			
			
			statement.setString(1, username);
			statement.setString(2, password);
			//statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			/*PreStmt.getPreparedStatement(SQL);
			((PreparedStatement) PreStmt.getPreparedStatement(SQL)).setString(1, username);
			((PreparedStatement) PreStmt.getPreparedStatement(SQL)).setString(2, password);
			ResultSet rs = ((PreparedStatement) PreStmt.getPreparedStatement(SQL)).executeQuery();*/

			while (rs.next()) {
				voterData.setVoter_id(rs.getString("voter_id"));
				voterData.setVoter_name(rs.getString("voter_name"));
				voterData.setUsername(rs.getString("username"));
				voterData.setPassword(rs.getString("password"));
				voterData.setMobile(rs.getString("mobile"));
				voterData.setDepartment(rs.getString("department"));
				voterData.setEmail(rs.getString("email"));
				voterData.setStatus(rs.getString("status"));
				voterData.setUsertype(rs.getString("usertype"));
				voterData.setElection_id(rs.getString("election_id"));
				voterData.setLogin_attempts(rs.getInt("login_attempts"));
				
			}

		} catch (Exception e) {
			System.out.println("Error On loginUser java : " + e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
				con = null;
			}
		}
		return voterData;
	}
	
	
	
	
	
	
	
	
	public UserPages getFirstpage(String userRoles, int id) {
		UserPages userPG = new UserPages();
		Connection con = null;
		PreparedStatement statement = null;
		String SQL = "SELECT * FROM `user_pages` WHERE page_usertype=? AND page_pageid=?";
		try {
			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();
			statement = con.prepareStatement(SQL);
			statement.setString(1, userRoles);
			statement.setInt(2, id);
			ResultSet rs = statement.executeQuery();
			/*PreStmt.getPreparedStatement(SQL);
			((PreparedStatement) PreStmt.getPreparedStatement(SQL)).setString(1, userRoles);
			((PreparedStatement) PreStmt.getPreparedStatement(SQL)).setInt(2, id);
			ResultSet rs = ((PreparedStatement) PreStmt.getPreparedStatement(SQL)).executeQuery();*/
			while (rs.next()) {
				userPG.setPageId(rs.getString("page_pageid"));
				userPG.setPageName(rs.getString("page_pagename"));
				userPG.setUserRole(rs.getString("page_usertype"));
				userPG.setAutoId(rs.getString("page_autoid"));
			}
		} catch (Exception e) {
			System.out.println("Error On get Single page java : " + e.toString());
		} finally {
			if (con != null) {
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

		List<UserPages> pageList = new ArrayList<UserPages>();
		String SQL = "SELECT * FROM `user_pages` WHERE page_usertype='" + userRoles[0] + "' ";
		if (userRoles.length > 1) {
			for (int i = 1; i < userRoles.length; i++) {
				SQL += " OR page_usertype='" + userRoles[i] + "' ";
			}
		}
		SQL += " ORDER BY page_autoid ";
		System.out.println("Get pagelist  ------ SQL" + SQL);
		Connection con = null;
		Statement st = null;
		try {
			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery(SQL);
			while (rs.next()) {
				UserPages userPG = new UserPages();
				userPG.setPageId(rs.getString("page_pageid"));
				userPG.setPageName(rs.getString("page_pagename"));
				userPG.setUserRole(rs.getString("page_usertype"));
				userPG.setAutoId(rs.getString("page_autoid"));
				userPG.setSpanTitle(rs.getString("page_spantitle"));
				userPG.setIclass(rs.getString("page_iclass"));
				pageList.add(userPG);
			}

		} catch (Exception e) {
			System.out.println("Error On get PagesList page java : " + e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
				con = null;
			}
		}
		return pageList;
	}
	
	public String lastloggedin(String date, String ID) {
		
		UserInfo userData = new UserInfo();
		PreparedStatement statement;
		PreparedStatement statement1;
		Connection con = null;
		Statement st = null;
		Statement st1 = null;

		try {
			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();
			
			String SQL1 = "UPDATE `user` SET last_login_date = ? WHERE user_id=?";
			
			statement1 = con.prepareStatement(SQL1);
			statement1.setString(1, date);
			statement1.setString(2, ID);
			int row = statement1.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("Error On Create Logging date java : " + e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
				con = null;
			}
		}
		
		try {
			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();
			
			String SQL = "SELECT * FROM `user` WHERE last_login_date = ? AND user_id=?";
			statement = con.prepareStatement(SQL);

			statement.setString(1, date);
			statement.setString(2, ID);

			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				
				userData.setLast_login_date(rs.getString("last_login_date"));
			
			}

		} catch (Exception e) {
			System.out.println("Error On loginUser java : " + e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
				con = null;
			}
		}
		
		return null;
	}

}
