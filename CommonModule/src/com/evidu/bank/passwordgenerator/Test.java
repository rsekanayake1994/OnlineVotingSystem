package com.evidu.bank.passwordgenerator;

import org.apache.commons.lang3.RandomStringUtils;

public class Test {

public static void main(String args[]){
	//String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~`!@#$%^&*()-_=+[{]}\\|;:\'\",<.>/?";
	String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~`!@#$%^&*";
	String pwd = RandomStringUtils.random( 6, characters );
	System.out.println( pwd );
	
}
}
