package com.evidu.bank.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.evidu.bank.model.UserRolesVO;
import com.evidu.bank.sva.DatabaseController;

public class UserRolesDAO {

	Connection connection;
	
	public ArrayList<UserRolesVO> getUserRoles() {
		Statement statement = null;
		UserRolesVO userRolesVO = null;
		ArrayList<UserRolesVO> arrList= new ArrayList<UserRolesVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			String query = "SELECT * FROM user_roles WHERE USER_ROLE_ID!='Voter'";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL for user roles" + query);
			while (rs.next()) {
				userRolesVO = new UserRolesVO();
				
				userRolesVO.setUSER_ROLE_ID(rs.getString("USER_ROLE_ID"));
				userRolesVO.setUSER_ROLE_NAME(rs.getString("USER_ROLE_NAME"));
				userRolesVO.setUSER_PARENT_USER_TYPE(rs.getString("USER_PARENT_USER_TYPE"));
								
				arrList.add(userRolesVO);
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
