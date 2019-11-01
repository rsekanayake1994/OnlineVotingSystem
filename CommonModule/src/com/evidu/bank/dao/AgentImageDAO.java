package com.evidu.bank.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.evidu.bank.model.AgentImageVO;
import com.evidu.bank.sva.DatabaseController;

public class AgentImageDAO {

	public AgentImageVO getAgentImageVO(String uuid) {
		Connection connection = null;
		Statement statement = null;
		AgentImageVO agentImageVO = null;
		try {
			DatabaseController d = DatabaseController.getInstance();
			connection = (Connection) d.getConnection();
			String query = "SELECT * FROM tnp_ag_profile_images WHERE TNP_AG_PROFILE_IMAGES_PROFILE_UUID='"+ uuid + "'";
			ResultSet rs = null;
			statement = (Statement) connection.createStatement();
			rs = statement.executeQuery(query);
			System.out.println("SQL " + query);
			while (rs.next()) {
				agentImageVO = new AgentImageVO();
				agentImageVO.setTNP_AG_PROFILE_IMAGES_AUTOID(rs.getInt("TNP_AG_PROFILE_IMAGES_AUTOID"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_CITIZEN_CERTIFICATE(rs.getBytes("TNP_AG_PROFILE_IMAGES_CITIZEN_CERTIFICATE"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_KYC_FORM(rs.getBytes("TNP_AG_PROFILE_IMAGES_KYC_FORM"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_KYC_NO(rs.getString("TNP_AG_PROFILE_IMAGES_KYC_NO"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_MRA_CERTIFICATE(rs.getBytes("TNP_AG_PROFILE_IMAGES_MRA_CERTIFICATE"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_NFO1(rs.getString("TNP_AG_PROFILE_IMAGES_NFO1"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_NFO2(rs.getString("TNP_AG_PROFILE_IMAGES_NFO2"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_NFO3(rs.getString("TNP_AG_PROFILE_IMAGES_NFO3"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_NFO4(rs.getString("TNP_AG_PROFILE_IMAGES_NFO4"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_NFO5(rs.getString("TNP_AG_PROFILE_IMAGES_NFO5"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_NGO_CERTIFICATE(rs.getBytes("TNP_AG_PROFILE_IMAGES_NGO_CERTIFICATE"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_NID(rs.getBytes("TNP_AG_PROFILE_IMAGES_NID"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_NOMINEE_NID(rs.getBytes("TNP_AG_PROFILE_IMAGES_NOMINEE_NID"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_NOMINEE_PHOTO(rs.getBytes("TNP_AG_PROFILE_IMAGES_NOMINEE_PHOTO"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_OTHER(rs.getBytes("TNP_AG_PROFILE_IMAGES_OTHER"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_OWNERSHIP_FORM(rs.getBytes("TNP_AG_PROFILE_IMAGES_OWNERSHIP_FORM"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_PARENT_KYC_ID(rs.getString("TNP_AG_PROFILE_IMAGES_OWNERSHIP_FORM"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_PHOTO(rs.getBytes("TNP_AG_PROFILE_IMAGES_PHOTO"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_PROFILE_UUID(rs.getString("TNP_AG_PROFILE_IMAGES_PROFILE_UUID"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_RESOLUTION(rs.getBytes("TNP_AG_PROFILE_IMAGES_RESOLUTION"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_TIN(rs.getBytes("TNP_AG_PROFILE_IMAGES_TIN"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_TRADE_LICENSE(rs.getBytes("TNP_AG_PROFILE_IMAGES_TRADE_LICENSE"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_USER_TYPE(rs.getString("TNP_AG_PROFILE_IMAGES_USER_TYPE"));
				agentImageVO.setTNP_AG_PROFILE_IMAGES_VAT(rs.getBytes("TNP_AG_PROFILE_IMAGES_VAT"));
				
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
		return agentImageVO;
	}
}
