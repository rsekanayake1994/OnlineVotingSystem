package com.evidu.bank.dao;

import com.evidu.bank.model.AgentImageVO;
import com.evidu.bank.model.CustomerImagesVO;

public class Test {

	public void test1(){
		
		CustomerImagesVO customerImagesVO= new CustomerImagesVO();
		CustomerImageDAO customerImageDAO= new CustomerImageDAO(); 
		
		CustomerImagesVO ciVO =customerImageDAO.getCustomerImagesVO("08bea7ce-c241-4d4d-a42d-ccc097e776d4");
		
		
		AgentImageDAO agentImageDAO = new AgentImageDAO();
		AgentImageVO agentImageVO= new AgentImageVO();
		
		AgentImageVO aIVO =agentImageDAO.getAgentImageVO("2f83a047-772d-4ebb-878a-f77e59d0c210");
		
	}
}
