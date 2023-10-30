package com.order;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.product.DBconnect;

import com.order.CartItem;

public class cartDB {

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static boolean isSuccess = false;
	
	public static boolean addToCart(String cusID, int Pid, int quantity) {
		
		int PID=0;
		
		try {
            con = DBconnect.getConnection();
            stmt = con.createStatement();

            // Check if the item is already in the cart
            
                // Insert a new item if it's not in the cart
            String checkCartSql = "SELECT * FROM shopping_cart WHERE customer_id='" + cusID + "' AND product_id='" +Pid+"'";
            rs = stmt.executeQuery(checkCartSql);

            if (rs.next()) {
                // Update quantity if the item is in the cart
                int currentQuantity = rs.getInt("quantity");
                int newQuantity = currentQuantity + quantity;

                String updateCartSql = "UPDATE shopping_cart SET quantity='" + newQuantity + "' WHERE customer_id='" + cusID + "' AND product_id='" +Pid+"'";
                int updated = stmt.executeUpdate(updateCartSql);
                
                String sql = "select Pprice from product where productid = '"+Pid+"' ";
                ResultSet q = stmt.executeQuery(sql);
                ;
                
                if(q.next()) {
                	PID = q.getInt("Pprice");
                }

                if (updated > 0) {
                    isSuccess = true;
                }
            } else {// insert to the cart
                String insertCartSql = "INSERT INTO shopping_cart (customer_id, product_id, quantity, pPrice) VALUES ('" + cusID + "','" +Pid+ "','" + quantity + "')";
                int inserted = stmt.executeUpdate(insertCartSql);

                if (inserted > 0) {
                    isSuccess = true;
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
        
	}
	
	
	public static List<CartItem> RetrieveCartDetails(String Id) {
    	
    	String convertedID = Id;
    	
    	ArrayList<CartItem> cus = new ArrayList<>();
    	
    	try {
    		
    		con = DBconnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "select * from shopping_cart where customer_id='"+convertedID+"'";
    		rs = stmt.executeQuery(sql);
    		
    		while(rs.next()) {
    		
    			String ID = rs.getString(1);
    			String Name = rs.getString(2);
    			double price=rs.getDouble(3);
    			int quantity = rs.getInt(4);
    			
    			
    			CartItem c = new CartItem(ID,Name,price,quantity);
    			cus.add(c);
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}	
    	return cus;	
    }
}
