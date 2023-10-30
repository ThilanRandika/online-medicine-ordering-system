package com.product;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	
	
	//connection
	private static String url = "jdbc:mysql://localhost:3306/rusiru_testing";
	private static String username = "root";
	private static String password = "MySQL123";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, username, password);
			
		}catch(Exception e) {
			System.out.println("Database connectuon is not success");
		}
		return con;
		
	}
	
}
