package com.evidu.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import com.evidu.bank.model.VoterVO;
import com.evidu.bank.sva.DatabaseController;

public class VoterDAO {
	Connection connection;
	private PreparedStatement preparedStatement;
	Statement stmt;

	public ArrayList<VoterVO> getVoterInfo(String userid,String electionId) {
		Statement statement = null;
		
		VoterVO voterVO= new VoterVO();
		
		//System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeee - "+userID);
		ArrayList<VoterVO> arrList1 = new ArrayList<VoterVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			String query = "SELECT * FROM voter where userid='"+userid+"' AND election_id='"+electionId+"'";
	
			
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				
//System.out.println("voterid=: "+rs.getString("voter_id"));
voterVO= new VoterVO();
				voterVO.setVoter_id(rs.getString("voter_id"));
				voterVO.setVoter_name(rs.getString("voter_name"));
				voterVO.setUsername(rs.getString("username"));
				
				voterVO.setPassword(rs.getString("password"));
				voterVO.setMobile(rs.getString("mobile"));
				voterVO.setDepartment(rs.getString("department"));
				voterVO.setEmail(rs.getString("email"));
				
				voterVO.setStatus(rs.getString("status"));
				voterVO.setUsertype(rs.getString("usertype"));
				voterVO.setElection_id(rs.getString("election_id"));
				voterVO.setLogin_status(rs.getString("login_status"));
				voterVO.setLogin_attempts(rs.getInt("login_attempts"));
				voterVO.setUserid(rs.getInt("userid"));
				
				arrList1.add(voterVO);
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
	
	
	public ArrayList<VoterVO> getVoterInfo1(String voter_id) {
		Statement statement = null;
		
		VoterVO voterVO= new VoterVO();
		
		//System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeee - "+userID);
		ArrayList<VoterVO> arrList1 = new ArrayList<VoterVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			String query = "SELECT * FROM voter where voter_id='"+voter_id+"'";
	
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				
//System.out.println("voterid=: "+rs.getString("voter_id"));
voterVO= new VoterVO();
				voterVO.setVoter_id(rs.getString("voter_id"));
				voterVO.setVoter_name(rs.getString("voter_name"));
				voterVO.setUsername(rs.getString("username"));
				
				voterVO.setPassword(rs.getString("password"));
				voterVO.setMobile(rs.getString("mobile"));
				voterVO.setDepartment(rs.getString("department"));
				voterVO.setEmail(rs.getString("email"));
				
				voterVO.setStatus(rs.getString("status"));
				voterVO.setUsertype(rs.getString("usertype"));
				voterVO.setElection_id(rs.getString("election_id"));
				voterVO.setLogin_status(rs.getString("login_status"));
				voterVO.setLogin_attempts(rs.getInt("login_attempts"));
				
				arrList1.add(voterVO);
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
	/*public ArrayList<VoterVO> getVoterInfo5(int election_id) {
		Statement statement = null;
		VoterVO voterVO = null;
	
	
		
		ArrayList<VoterVO> arrList01 = new ArrayList<VoterVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			String query = "SELECT COUNT(voter_id)FROM commonadminmodule.voter where election_id='"+election_id+"'";
			
			
			
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				voterVO = new VoterVO();

				
				voterVO.setCount(rs.getString("voter_id"));
				
				
				
				
				arrList01.add(voterVO);
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
	}*/
	
	int count = 0;

	public int getVoterInfo6(int election_id) throws SQLException {
		
		System.out.println("Voter Count");
		
		DatabaseController dbController = DatabaseController.getInstance();
		Connection con = null;
		con = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "SELECT COUNT(voter_id)FROM commonadminmodule.voter where election_id='"+election_id+"'";


		try {
			statement = con.prepareStatement(query);
			//statement.setInt(1, election_id);
			rs = statement.executeQuery();

			while(rs.next()) {
					
				
				count=rs.getInt(1);
				
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

		return count;

	}
	
	
	
	
	
	
}
