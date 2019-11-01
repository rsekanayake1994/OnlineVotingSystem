package com.evidu.bank.dao;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

import com.evidu.bank.model.ElectionsVO;
import com.evidu.bank.sva.DatabaseController;
import com.evidu.bank.sva.MainController;


public class Election {
	Connection connection;
	private PreparedStatement preparedStatement;
	
	Statement stmt;
	
	public boolean createNewElection(ElectionsVO election){
		boolean status = false;
		
		
		String query = "INSERT INTO commonadminmodule.election(election_name,status,startdate,enddate,userid)"
				+ "VALUES (?,?,?,?,?)";
		
		
		
		try {
			// Get a connection:
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();

			
			MainController mc = new MainController();
			


			preparedStatement = connection.prepareStatement(query);
			
			
			preparedStatement.setString(1, election.getElection_name());
			preparedStatement.setString(2, election.getStatus());
			preparedStatement.setString(1, election.getStartdate());
			preparedStatement.setString(1, election.getEnddate());
			preparedStatement.setString(1, election.getUserid());
			

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

	public boolean addElection(ElectionsVO election) {
		
		
		// TODO Auto-generated method stub
		Statement statement = null;
		boolean status = false;
		
		String query = "INSERT INTO commonadminmodule.election(election_name,status,startdate,enddate,userid,faculty,election_type,voters,candidates)"
				+ "VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			// Get a connection:
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();

			
			MainController mc = new MainController();
			


			preparedStatement = connection.prepareStatement(query);
			
			
			preparedStatement.setString(1, election.getElection_name());
			preparedStatement.setString(2, "INACTIVE");
			preparedStatement.setString(3, election.getStartdate());
			preparedStatement.setString(4, election.getEnddate());
			preparedStatement.setString(5, election.getUserid());
			preparedStatement.setString(6, election.getFaculty());
			preparedStatement.setString(7, election.getElection_type());
			preparedStatement.setString(8, "No");
			preparedStatement.setString(9, "No");

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



