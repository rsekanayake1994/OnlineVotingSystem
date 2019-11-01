package com.evidu.bank.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;

import com.evidu.bank.entitiy.OrgInfo;
import com.evidu.bank.entitiy.UserInfo;
import com.evidu.bank.model.OrganizationVO;
import com.evidu.bank.model.UserVO;
import com.evidu.bank.sva.DatabaseController;
import com.evidu.bank.sva.MainController;

public class Organization {
	

	
	
	Connection connection;
	private PreparedStatement preparedStatement;
	private PreparedStatement preparedStatement1;
	private PreparedStatement preparedStatement2;
	Statement stmt;
	private String organizationedit;
	public boolean addNewOrganization(OrganizationVO organization){
		boolean status = false;
		
		
		String query = "INSERT INTO obdv5.organizations(ORGANIZATION_NAME,ORGANIZATION_CPERSON,ORGANIZATION_ADDRESS,ORGANIZATION_EMAIL,ORGANIZATION_DATEJOINED,ORGANIZATION_LOGO,ORGANIZATION_CONTACTNO)"
				+ "VALUES (?,?,?,?,?,?,?)";
		
		
		
		try {
			// Get a connection:
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();

			
			MainController mc = new MainController();
			


			preparedStatement = connection.prepareStatement(query);
			
			
			preparedStatement.setString(1, organization.getORGANIZATION_NAME());
			preparedStatement.setString(2, organization.getORGANIZATION_CPERSON());
			preparedStatement.setString(3, organization.getORGANIZATION_ADDRESS());
			preparedStatement.setString(4, organization.getORGANIZATION_EMAIL());
			preparedStatement.setString(5, organization.getORGANIZATION_DATEJOINED());
			preparedStatement.setString(6, organization.getORGANIZATION_LOGO());
			preparedStatement.setString(7, organization.getORGANIZATION_CONTACTNO());

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
	
	
	
	
		


	public boolean editOrganization(OrganizationVO editorganization, String organizationedit) {
		
		
         this.organizationedit=organizationedit;
         
         System.out.println("organization edit is: "+organizationedit);
		boolean status = false;
		
		String query1 = "UPDATE obdv5.organizations SET ORGANIZATION_NAME=?,ORGANIZATION_CPERSON=?,ORGANIZATION_ADDRESS=?,ORGANIZATION_EMAIL=?,ORGANIZATION_LOGO=?,ORGANIZATION_CONTACTNO=? WHERE ORGANIZATION_NAME='"+organizationedit+"'";
		String query2= "UPDATE obdv5.user SET organization=? WHERE organization='"+organizationedit+"'";
		
		
		
		try {
			// Get a connection:
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();

			
			MainController mc = new MainController();
			


			preparedStatement1 = connection.prepareStatement(query1);
			preparedStatement2=connection.prepareStatement(query2);
			
			preparedStatement1.setString(1, editorganization.getORGANIZATION_NAME());
			preparedStatement1.setString(2, editorganization.getORGANIZATION_CPERSON());
			preparedStatement1.setString(3, editorganization.getORGANIZATION_ADDRESS());
			preparedStatement1.setString(4, editorganization.getORGANIZATION_EMAIL());
		
			preparedStatement1.setString(5, editorganization.getORGANIZATION_LOGO());
			preparedStatement1.setString(6, editorganization.getORGANIZATION_CONTACTNO());
			preparedStatement2.setString(1,editorganization.getORGANIZATION_NAME() );
			preparedStatement1.executeUpdate();
			preparedStatement2.executeUpdate();
			status = true;
System.out.println("maleesha="+query1);
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
