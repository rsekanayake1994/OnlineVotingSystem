package com.evidu.bank.dao;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;

import com.evidu.bank.entitiy.OrgInfo;
import com.evidu.bank.entitiy.UserInfo;
import com.evidu.bank.model.CampaignsVO;
import com.evidu.bank.model.OrganizationVO;
import com.evidu.bank.model.UserVO;
import com.evidu.bank.sva.DatabaseController;
import com.evidu.bank.sva.MainController;
public class Campaigns {
	CampaignsVO campaign =new CampaignsVO();
	Connection connection;
	private PreparedStatement preparedStatement;
	private PreparedStatement preparedStatement1;
	private PreparedStatement preparedStatement2;
	Statement stmt;
	
	public boolean createCampaign(CampaignsVO campaign){
		boolean status = false;
		
		
		String query = "INSERT INTO commonadminmodule.campaign(campname,userid,organization,createddate,csvname)"
				+ "VALUES (?,?,?,?,?)";
		
		
		
		try {
			// Get a connection:
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();

			
			MainController mc = new MainController();
			


			preparedStatement = connection.prepareStatement(query);
			
			
			preparedStatement.setString(1, campaign.getCampname());
			preparedStatement.setLong(2, campaign.getUserid());
			preparedStatement.setString(3, campaign.getOrganization());
			preparedStatement.setString(4, campaign.getCreateddate());
			preparedStatement.setString(5, campaign.getCsvname());
		

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
	
}
