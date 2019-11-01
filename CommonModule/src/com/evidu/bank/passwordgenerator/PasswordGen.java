package com.evidu.bank.passwordgenerator;

import org.apache.commons.lang3.RandomStringUtils;

public class PasswordGen {

	public String getPassword(){
		
		//String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~`!@#$%^&*()-_=+[{]}\\|;:\'\",<.>/?";
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~`!@#$%^&*()-_=+ ";
		String pwd = RandomStringUtils.random( 6, characters );
		System.out.println( pwd );
		return pwd;
	}
	
}
