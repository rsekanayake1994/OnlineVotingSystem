package com.evidu.bank.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.evidu.bank.model.ElectionTypeVO;
import com.evidu.bank.model.UserRolesVO;
import com.evidu.bank.sva.DatabaseController;

public class ElectionTypesDAO {

	Connection connection;
	public ArrayList<ElectionTypeVO> getElectionTypes() {
		Statement statement = null;
		ElectionTypeVO electionTypeVO = null;
		ArrayList<ElectionTypeVO> arrList= new ArrayList<ElectionTypeVO>();
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			String query = "SELECT * FROM election_types";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL for election types" + query);
			while (rs.next()) {
				electionTypeVO = new ElectionTypeVO();
				
				electionTypeVO.setElection_type_name(rs.getString("election_type_name"));
				
								
				arrList.add(electionTypeVO);
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
