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
import com.evidu.bank.model.ElectionsVO;
import com.evidu.bank.model.OrgVO;
import com.evidu.bank.model.OrganizationVO;
import com.evidu.bank.model.UserVO;
import com.evidu.bank.sva.DatabaseController;


public class ElectionDAO {
	
	Connection connection;
	private PreparedStatement preparedStatement;
	Statement stmt;

	@SuppressWarnings("null")
	public ArrayList<ElectionsVO> getElectionInfo(String userid) {
		Statement statement = null;
		ElectionsVO electionVO = null;
	
		
		
		ArrayList<ElectionsVO> arrList01 = new ArrayList<ElectionsVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
			String query = "SELECT * FROM commonadminmodule.election WHERE userid='"+userid+"'";
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
	
	public ArrayList<ElectionsVO> getElectionInfo1(String voter_id) {
		Statement statement = null;
		ElectionsVO electionVO = null;
	
		
		
		ArrayList<ElectionsVO> arrList01 = new ArrayList<ElectionsVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
			String query = "SELECT * FROM election,voter WHERE election.election_id=voter.election_id AND voter_id='"+voter_id+"'";
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
	
	public ArrayList<ElectionsVO> getElectionInfo2(int election_id,String voter_id) {
		Statement statement = null;
		ElectionsVO electionVO = null;
	
		
		
		ArrayList<ElectionsVO> arrList01 = new ArrayList<ElectionsVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
						
			//String query = "SELECT * FROM tnp_dataentry_users Where TNP_DATAENTRY_USER_CREATED_BY=108";
			String query = "SELECT * FROM election WHERE election.election_id=voter.election_id AND voter_id='"+voter_id+"'AND election_id='"+election_id+"'";
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
	
	String etype = "";

	public String getElectionType(int election_id) throws SQLException {
		
		System.out.println("Voter Count");
		
		DatabaseController dbController = DatabaseController.getInstance();
		Connection con = null;
		con = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "SELECT election_type FROM commonadminmodule.election where election_id='"+election_id+"'";


		try {
			statement = con.prepareStatement(query);
			//statement.setInt(1, election_id);
			rs = statement.executeQuery();

			while(rs.next()) {
					
				
				etype=rs.getString(1);
				
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

		return etype;

	}
	
	String startdate = "";
	String enddate="";
	String dates="";

	public String getElectionDates(String election_id) throws SQLException {
		
		//System.out.println("Election Dates");
		
		DatabaseController dbController = DatabaseController.getInstance();
		Connection con = null;
		con = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "SELECT startdate,enddate FROM commonadminmodule.election where election_id='"+election_id+"'";


		try {
			statement = con.prepareStatement(query);
			//statement.setInt(1, election_id);
			rs = statement.executeQuery();

			while(rs.next()) {
					
				
				startdate=rs.getString(1);
				enddate=rs.getString(2);
				dates=startdate+","+enddate;
				
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

		return dates;

	}
	
}
