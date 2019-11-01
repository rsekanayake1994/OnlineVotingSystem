package com.evidu.bank.sva;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DatabaseController {
	
	public static final  DatabaseController instancD = new DatabaseController();
	
	public static DatabaseController getInstance() {
		return instancD;
	}
	
	public static Connection getConnection() throws SQLException {
		Connection con = null;
	
		String dbUrl = "jdbc:mysql://localhost:3306/commonadminmodule";
		String dbUser= "root";
		String dbPass= "root";
		
		 		
		try{
			Class.forName ("com.mysql.jdbc.Driver").newInstance ();
			//System.out.println("successfully connected to the database");
			return DriverManager.getConnection(dbUrl, dbUser, dbPass);
		}catch(Exception e){
			
			//System.out.println("error : "+e.toString());
		}
		System.out.println("*** CONNECTION ADMIN MODULE ****"+con);
		return con;
	}
	
	
	
	public  Connection getSQLConnection() throws SQLException {
	      Connection con = null;
	      try{
		       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
		      // con = DriverManager.getConnection("jdbc:sqlserver://192.168.1.23:1362;username=sa@moneprod;password=m1-password;databaseName=mCard");//UAT
		      // con = DriverManager.getConnection("jdbc:sqlserver://192.168.1.21:1362;username=sa@moneprod;password=m!-P@55W0RD;databaseName=mCard");//production
		       
		       return con;
	      }
	      catch (Exception e) {
	    	  System.out.println("db error : " + e.toString());
	      }
	      return con;
	    }
	}
