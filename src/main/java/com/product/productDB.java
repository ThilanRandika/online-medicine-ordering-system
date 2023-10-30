package com.product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class productDB {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static boolean isSuccess = false;
		
		public static boolean insertProduct(String productName, String productCategory, String productDescription, String productPrice, String productQuantity, String productImage) {
			
			
			try {
				
				con = DBconnect.getConnection();
				stmt = con.createStatement();
				String sql = "insert into product (Pname, Pcatogary, Pdiscription, Pprice, Pquantity, Pimage) values ('"+productName+"', '"+productCategory+"', '"+productDescription+"', '"+productPrice+"', '"+productQuantity+"', '"+productImage+"')";

				
				int rs = stmt.executeUpdate(sql);
				
				if(rs > 0) {
					isSuccess = true;
				}else {
					isSuccess = false;
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return isSuccess;            
		}
		
		
		
		public static List<Product> getFirstFourProducts() {
		    ArrayList<Product> product = new ArrayList<Product>();
		    
		    try {
		        con = DBconnect.getConnection();
		        stmt = con.createStatement();
		        String sql = "SELECT * FROM product ORDER BY productid LIMIT 4";
		        
		        rs = stmt.executeQuery(sql);
		        
		        while (rs.next()) {
		            Product p = new Product();
		            p.setProductId(rs.getInt(1));
		            p.setProductName(rs.getString(2));
		            p.setProduCategory(rs.getString(3));
		            p.setProductDescription(rs.getString(4));
		            p.setProductPrice(rs.getString(5));
		            p.setProductQuantity(rs.getString(6));
		            p.setProductImage(rs.getString(7));
		            
		            product.add(p);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    
		    return product;
		}
		
		
		
		public static List<Product> getProductDetails() {
			
			ArrayList<Product> product = new ArrayList<Product>();
			
			try {
				con = DBconnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from product";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
				Product p = new Product();
					
					
				 p.setProductId(rs.getInt(1));
				 p.setProductName(rs.getString(2));
				 p.setProduCategory(rs.getString(3));
				 p.setProductDescription(rs.getString(4));
				 p.setProductPrice(rs.getString(5));
				 p.setProductQuantity(rs.getString(6));
				 p.setProductImage(rs.getString(7));
				 
				 product.add(p);
				 
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return product;
			
		}
		
		public static Product getProductById(int productId) {
			
			Product p = new Product();
			
			try {
				
				con = DBconnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from product where productid= '"+productId+"'";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					 p.setProductId(rs.getInt(1));
					 p.setProductName(rs.getString(2));
					 p.setProduCategory(rs.getString(3));
					 p.setProductDescription(rs.getString(4));
					 p.setProductPrice(rs.getString(5));
					 p.setProductQuantity(rs.getString(6));
					 p.setProductImage(rs.getString(7));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return p;
		}
		
		public static boolean updateProduct(String productId,String productName, String productCategory, String productDescription, String productPrice, String productQuantity, String productImage) {
			
			try {
				
				con = DBconnect.getConnection();
				stmt = con.createStatement();
				String sql = "update product set Pname = '"+productName+"', Pcatogary = '"+productCategory+"', Pdiscription = '"+productDescription+"', Pprice = '"+productPrice+"', Pquantity = '"+productQuantity+"', Pimage = '"+productImage+"' where productid = '"+productId+"'";
				
				int rs = stmt.executeUpdate(sql);
				
				if(rs > 0) {
					isSuccess = true;
				}else {
					isSuccess = false;
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return isSuccess;
		}
		
		
		public static boolean deleteProduct(int id) {
			try {
				
				con = DBconnect.getConnection();
				stmt = con.createStatement();
				String sql = "delete from product where productid = '"+id+"'";
				
				int rs = stmt.executeUpdate(sql);
				
				if(rs > 0) {
					isSuccess = true;
				}else {
					isSuccess = false;
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return isSuccess;
		}
		
		public static Product getProductByName(String Pname) {
			
			Product p = new Product();
			
			try {
				
				con = DBconnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from product where Pname= '"+Pname+"'";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					 p.setProductId(rs.getInt(1));
					 p.setProductName(rs.getString(2));
					 p.setProduCategory(rs.getString(3));
					 p.setProductDescription(rs.getString(4));
					 p.setProductPrice(rs.getString(5));
					 p.setProductQuantity(rs.getString(6));
					 p.setProductImage(rs.getString(7));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return p;
		}
		
		

	}


