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
import com.evidu.bank.entitiy.OrgInfo;
import com.evidu.bank.entitiy.UserInfo;
import com.evidu.bank.model.OrgVO;
import com.evidu.bank.model.OrganizationVO;
import com.evidu.bank.model.UserVO;
import com.evidu.bank.sva.DatabaseController;


public class OrgDAO {
	Connection connection;
	private PreparedStatement preparedStatement;
	Statement stmt;

	public ArrayList<OrganizationVO> getOrgInfo() {
		Statement statement = null;
		OrganizationVO orgVO = null;
	OrgInfo orgInfo = new OrgInfo();
		
		//System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeee - "+userID);
		ArrayList<OrganizationVO> arrList = new ArrayList<OrganizationVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
			String query = "SELECT * FROM organizations";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				orgVO = new OrganizationVO();

				orgVO.setORGANIZATION_ID(rs.getInt("ORGANIZATION_ID"));
				orgVO.setORGANIZATION_NAME(rs.getString("ORGANIZATION_NAME"));
				orgVO.setORGANIZATION_CPERSON(rs
						.getString("ORGANIZATION_CPERSON"));
				// userVO.setOrganization("root");
				orgVO.setORGANIZATION_ADDRESS(rs.getString("ORGANIZATION_ADDRESS"));
				orgVO.setORGANIZATION_EMAIL(rs.getString("ORGANIZATION_EMAIL"));
				orgVO.setORGANIZATION_DATEJOINED(rs.getString("ORGANIZATION_DATEJOINED"));
				orgVO.setORGANIZATION_LOGO(rs
						.getString("ORGANIZATION_LOGO"));
				
				arrList.add(orgVO);
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
	
	
	
	public ArrayList<OrgVO> getLogo() {
		Statement statement = null;
		OrgVO orgVO = null;
		OrgInfo orgInfo = new OrgInfo();
		
		
		ArrayList<OrgVO> arrList2 = new ArrayList<OrgVO>();
			
			
			try{
				
				DatabaseController d = DatabaseController.getInstance();
				connection = (Connection) d.getConnection();
				
				String query1 = "SELECT commonadminmodule.organizations.ORGANIZATION_LOGO, commonadminmodule.user.organization, commonadminmodule.organizations.ORGANIZATION_NAME FROM commonadminmodule.organizations INNER JOIN commonadminmodule.user where commonadminmodule.user.organization=commonadminmodule.organizations.ORGANIZATION_NAME GROUP BY ORGANIZATION_NAME";
				//System.out.println("..Query 1.. "+query1);
				ResultSet rs = null;
				statement = (Statement) connection.createStatement();
				rs = statement.executeQuery(query1);
				System.out.println("SQL " + query1);
				
				while (rs.next()) {
					orgVO = new OrgVO();

					orgVO .setORGANIZATION_LOGO(rs.getString("ORGANIZATION_LOGO"));
					orgVO.setORGANIZATION_NAME(rs.getString("ORGANIZATION_NAME"));
					arrList2.add(orgVO);
				}
				
				
			}
			
			catch(SQLException e){
				e.printStackTrace();
			}
			finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		
		
		
		
		
	return arrList2;


	
}

}
