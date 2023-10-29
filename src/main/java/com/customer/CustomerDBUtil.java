package com.customer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static boolean isSucess;
	
	//user name password validation
	
	public static boolean validate(String userName, String password){
		try {
			con = DBConnect.getConnection();	
			stmt = con.createStatement();
			String sql = "select * from customer where username='"+userName+"' and password='"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				isSucess = true;
			}
			else {
				isSucess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSucess;
	}
	
	
	
	
	public static List<Customer> getCustomer (String username){
		
		ArrayList<Customer> customer = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from customer where username='"+username+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String userName = rs.getString(5);
				String password = rs.getString(6);
				String address = rs.getString(7);
				
				Customer cus = new Customer(id, name, email, phone, userName, password, address);
				customer.add(cus);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return customer;
	}
	
	
	
	public static boolean insertcustomer(String name, String email, String phone, String username, String password, String address) {
	    	
	    	boolean isSuccess = false;
	    	
	    	try {
	    		con = DBConnect.getConnection();
	    		stmt = con.createStatement();
	    	    String sql = "insert into customer values (0,'"+name+"','"+email+"','"+phone+"','"+username+"','"+password+"', '"+address+"')";
	    		int rs = stmt.executeUpdate(sql);
	    		
	    		if(rs > 0) {
	    			isSuccess = true;
	    		} else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	 	
	    	return isSuccess;
	    }
	
	
	
	public static List<Customer> getCustomerDetails(int ID) {
		
		ArrayList<Customer> cus = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from customer where id '" + ID + "' ";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String userName = rs.getString(5);
				String password = rs.getString(6);
				String address = rs.getString(7);
				
				Customer c = new Customer(id, name, email, phone, userName, password, address);
				cus.add(c);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return cus; 
	}
	
	
	
public static boolean updatecustomer(int id, String name, String email, String phone, String username, String password, String address) {
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "update customer set  name='"+name+"',email='"+email+"',phone='"+phone+"',username='"+username+"',password='"+password+"', address='"+address+"' where id='"+id+"'";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSucess = true;
    		}
    		else {
    			isSucess = false;
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSucess;
    }
	


public static boolean deleteCustomer(String id) {
	
	int convId = Integer.parseInt(id);
	
	try {
		
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "delete from customer where id='"+convId+"'";
		int r = stmt.executeUpdate(sql);
		
		if (r > 0) {
			isSucess = true;
		}
		else {
			isSucess = false;
		}
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	return isSucess;
}

}
