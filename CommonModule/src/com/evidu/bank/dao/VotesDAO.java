package com.evidu.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.evidu.bank.sva.DatabaseController;

public class VotesDAO {

	int count = 0;

	public int getVotesInfo(int election_id) throws SQLException {
		
		System.out.println("Voter Count");
		
		DatabaseController dbController = DatabaseController.getInstance();
		Connection con = null;
		con = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "SELECT count(distinct voter_id) FROM commonadminmodule.votes where election_id='"+election_id+"'";


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
	
	
	
	
	
	int count1 = 0;

	public int getVotesInfo1(int candidate_id,int election_id) throws SQLException {
		
		System.out.println("Vote Count");
		System.out.println("candidate_id "+candidate_id);
		
		DatabaseController dbController = DatabaseController.getInstance();
		Connection con = null;
		con = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "SELECT COUNT(candidate_id) FROM commonadminmodule.votes where election_id='"+election_id+"'AND candidate_id='"+candidate_id+"'";
		System.out.println("query "+query);

		try {
			statement = con.prepareStatement(query);
			//statement.setInt(1, election_id);
			rs = statement.executeQuery();

			while(rs.next()) {
					
				
				count1=rs.getInt(1);
				
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

		return count1;

	}
	
	
	
	
}
