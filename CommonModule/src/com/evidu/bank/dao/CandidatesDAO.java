package com.evidu.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.evidu.bank.model.CandidatesVO;

import com.evidu.bank.sva.DatabaseController;

public class CandidatesDAO {
	Connection connection;
	private PreparedStatement preparedStatement;
	Statement stmt;

	@SuppressWarnings("null")
	public ArrayList<CandidatesVO> getCandidatesInfo(int election_id) {
		
		Statement statement = null;
		CandidatesVO candidatesVO = null;
	
		
		
		ArrayList<CandidatesVO> arrList02 = new ArrayList<CandidatesVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
			int param=election_id;
			String query = "SELECT * FROM commonadminmodule.candidate where election_id='"+param+"'";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				candidatesVO = new CandidatesVO();

				
				candidatesVO.setCandidate_id(rs.getInt("candidate_id"));
				candidatesVO.setCandidate_name(rs.getString("candidate_name"));
				
				candidatesVO.setCandidate_image(rs.getString("candidate_image"));
				candidatesVO.setCandidate_position(rs.getString("candidate_position"));
				candidatesVO.setElection_id(rs.getInt("election_id"));
				candidatesVO.setCandidate_telephone(rs.getString("candidate_telephone"));
				candidatesVO.setCandidate_email(rs.getString("candidate_email"));
				candidatesVO.setCandidate_department(rs.getString("candidate_department"));
				
				
				
				
				arrList02.add(candidatesVO);
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
		return arrList02;
		
}
	
	
	
	
public ArrayList<CandidatesVO> getCandidatesInfo1(String position ,int election_id) {
		
		Statement statement = null;
		CandidatesVO candidatesVO = null;
	
		
		
		ArrayList<CandidatesVO> arrList03 = new ArrayList<CandidatesVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
			int param1=election_id;
			String param2=position;
			
			String query = "SELECT * FROM commonadminmodule.candidate where election_id='"+param1+"' And candidate_position='"+param2+"'";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				candidatesVO = new CandidatesVO();

				
				candidatesVO.setCandidate_id(rs.getInt("candidate_id"));
				candidatesVO.setCandidate_name(rs.getString("candidate_name"));
				
				candidatesVO.setCandidate_image(rs.getString("candidate_image"));
				candidatesVO.setCandidate_position(rs.getString("candidate_position"));
				candidatesVO.setElection_id(rs.getInt("election_id"));
				candidatesVO.setCandidate_telephone(rs.getString("candidate_telephone"));
				candidatesVO.setCandidate_email(rs.getString("candidate_email"));
				candidatesVO.setCandidate_department(rs.getString("candidate_department"));
				
				
				
				
				arrList03.add(candidatesVO);
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
		return arrList03;
		
}
public ArrayList<CandidatesVO> getCandidatesInfo2(String userId,String electionId) {
	
	Statement statement = null;
	CandidatesVO candidatesVO = null;

	
	
	ArrayList<CandidatesVO> arrList03 = new ArrayList<CandidatesVO>();
	try {
		DatabaseController d = DatabaseController.getInstance();
		connection = (Connection) d.getConnection();
					
		//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
		
		String query = "SELECT * FROM commonadminmodule.candidate where userid='"+userId+"' AND election_id='"+electionId+"'";
		ResultSet rs = null;
		statement = (Statement) connection.createStatement();
		rs = statement.executeQuery(query);
		System.out.println("SQL " + query);
		while (rs.next()) {
			candidatesVO = new CandidatesVO();

			
			candidatesVO.setCandidate_id(rs.getInt("candidate_id"));
			candidatesVO.setCandidate_name(rs.getString("candidate_name"));
			
			candidatesVO.setCandidate_image(rs.getString("candidate_image"));
			candidatesVO.setCandidate_position(rs.getString("candidate_position"));
			candidatesVO.setElection_id(rs.getInt("election_id"));
			candidatesVO.setCandidate_telephone(rs.getString("candidate_telephone"));
			candidatesVO.setCandidate_email(rs.getString("candidate_email"));
			candidatesVO.setCandidate_department(rs.getString("candidate_department"));
			
			
			
			
			arrList03.add(candidatesVO);
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
	return arrList03;
	
}
int count0;
public int getCandidatesInfo4(int election_id) throws SQLException {
	
	System.out.println("Candidates Count");
	
	DatabaseController dbController = DatabaseController.getInstance();
	Connection con = null;
	con = DatabaseController.getConnection();
	ResultSet rs = null;
	PreparedStatement statement = null;
	String query = "SELECT COUNT(candidate_id)FROM commonadminmodule.candidate where election_id='"+election_id+"'";


	try {
		statement = con.prepareStatement(query);
		//statement.setInt(1, election_id);
		rs = statement.executeQuery();

		while(rs.next()) {
				
			
			count0=rs.getInt(1);
			
		}

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	return count0;

}
	
public boolean deleteCandidate(String candidate_id) {
	boolean isSuccess = false;

	try {
		DatabaseController d = DatabaseController.getInstance();
		connection = (Connection) d.getConnection();
		String query = "Delete FROM candidate WHERE candidate_id='"
				+ candidate_id + "'";
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

	
	
}
