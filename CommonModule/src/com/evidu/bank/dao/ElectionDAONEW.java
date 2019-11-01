package com.evidu.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.evidu.bank.model.ElectionsVO;
import com.evidu.bank.model.VoterVO;
import com.evidu.bank.sva.DatabaseController;

public class ElectionDAONEW {
	Connection connection;
	private PreparedStatement preparedStatement;
	Statement stmt;

	@SuppressWarnings("null")
	public ArrayList<ElectionsVO> getElectionInfo() {
		Statement statement = null;
		ElectionsVO electionVO = null;
	
		
		
		ArrayList<ElectionsVO> arrList01 = new ArrayList<ElectionsVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
			String param="No";
			String query = "SELECT * FROM commonadminmodule.election where voters LIKE'"+param+"'";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				electionVO = new ElectionsVO();

				
				electionVO.setElection_id(rs.getInt("election_id"));
				electionVO.setElection_name(rs.getString("election_name"));
				
				electionVO.setStatus(rs.getString("status"));
				electionVO.setStartdate(rs.getString("startdate"));
				electionVO.setEnddate(rs.getString("enddate"));
				electionVO.setUserid(rs.getString("userid"));
				electionVO.setFaculty(rs.getString("faculty"));
				electionVO.setElection_type(rs.getString("election_type"));
				
				
				
				arrList01.add(electionVO);
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
		return arrList01;
	}
	
	public ArrayList<ElectionsVO> getElectionInfo2() {
		Statement statement = null;
		ElectionsVO electionVO = null;
	
		
		
		ArrayList<ElectionsVO> arrList01 = new ArrayList<ElectionsVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
			String param="No";
			String query = "SELECT * FROM commonadminmodule.election where candidates LIKE'"+param+"'";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				electionVO = new ElectionsVO();

				
				electionVO.setElection_id(rs.getInt("election_id"));
				electionVO.setElection_name(rs.getString("election_name"));
				
				electionVO.setStatus(rs.getString("status"));
				electionVO.setStartdate(rs.getString("startdate"));
				electionVO.setEnddate(rs.getString("enddate"));
				electionVO.setUserid(rs.getString("userid"));
				electionVO.setFaculty(rs.getString("faculty"));
				electionVO.setElection_type(rs.getString("election_type"));
				
				
				
				arrList01.add(electionVO);
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
		return arrList01;
	}
	
	
	public ArrayList<ElectionsVO> getElectionInfo3(String voter_id) {
		Statement statement = null;
		ElectionsVO electionVO = null;
	
	
		
		ArrayList<ElectionsVO> arrList01 = new ArrayList<ElectionsVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
			String param="ACTIVE";
			String query = "SELECT * FROM election,voter where voter.election_id=election.election_id AND voter.status='NO' AND voter.voter_id='"+voter_id+"' AND  election.status LIKE'"+param+"' ";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				electionVO = new ElectionsVO();

				
				electionVO.setElection_id(rs.getInt("election_id"));
				electionVO.setElection_name(rs.getString("election_name"));
				
				electionVO.setStatus(rs.getString("status"));
				electionVO.setStartdate(rs.getString("startdate"));
				electionVO.setEnddate(rs.getString("enddate"));
				electionVO.setUserid(rs.getString("userid"));
				electionVO.setFaculty(rs.getString("faculty"));
				electionVO.setElection_type(rs.getString("election_type"));
				
				
				
				arrList01.add(electionVO);
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
		return arrList01;
	}
	
	
	public ArrayList<ElectionsVO> getElectionInfo5(String voter_id) {
		Statement statement = null;
		ElectionsVO electionVO = null;
	
	
		
		ArrayList<ElectionsVO> arrList01 = new ArrayList<ElectionsVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
			String param="INACTIVE";
			String query = "SELECT * FROM election,voter where voter.election_id=election.election_id AND voter.status='YES' AND voter.voter_id='"+voter_id+"' AND  election.status LIKE'"+param+"' ";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				electionVO = new ElectionsVO();

				
				electionVO.setElection_id(rs.getInt("election_id"));
				electionVO.setElection_name(rs.getString("election_name"));
				
				electionVO.setStatus(rs.getString("status"));
				electionVO.setStartdate(rs.getString("startdate"));
				electionVO.setEnddate(rs.getString("enddate"));
				electionVO.setUserid(rs.getString("userid"));
				electionVO.setFaculty(rs.getString("faculty"));
				electionVO.setElection_type(rs.getString("election_type"));
				
				
				
				arrList01.add(electionVO);
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
		return arrList01;
	}
	
	
	
	
	
	public ArrayList<ElectionsVO> getElectionInfo4(String voter_id) {
		Statement statement = null;
		ElectionsVO electionVO = null;
	
	
		
		ArrayList<ElectionsVO> arrList01 = new ArrayList<ElectionsVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
			String param="INACTIVE";
			//String query = "SELECT * FROM election,voter where voter.election_id=election.election_id AND voter.status='YES' AND voter.voter_id='"+voter_id+"' AND  election.status LIKE'"+param+"' ";
			String query1="SELECT * FROM election,voter where voter.election_id=election.election_id AND voter.voter_id='"+voter_id+"' AND  election.enddate <NOW()"; 
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query1);
			System.out.println("SQL " + query1);
			while (rs.next()) {
				electionVO = new ElectionsVO();

				
				electionVO.setElection_id(rs.getInt("election_id"));
				electionVO.setElection_name(rs.getString("election_name"));
				
				electionVO.setStatus(rs.getString("status"));
				electionVO.setStartdate(rs.getString("startdate"));
				electionVO.setEnddate(rs.getString("enddate"));
				electionVO.setUserid(rs.getString("userid"));
				electionVO.setFaculty(rs.getString("faculty"));
				electionVO.setElection_type(rs.getString("election_type"));
				
				
				
				arrList01.add(electionVO);
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
		return arrList01;
	}
	
	
	
	
	
	
	
}
