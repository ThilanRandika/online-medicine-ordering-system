package com.prescription;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PrescriptionDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean uploadPrescription(String substitutes, String fulfillment, String prescriptionText, String patientAge, String contactNumber, String orderType, String imageName, String cusId, String patientName, String email) {
		boolean isSuccess = false;
		//connection
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT INTO prescription(id, substitutes, fulfillment, prescriptionText, patientAge, contactNumber, orderType, imageName, date, status, cusID, patientName, email)  VALUES (0, '"+substitutes+"', '"+fulfillment+"', '"+prescriptionText+"', '"+patientAge+"', '"+contactNumber+"', '"+orderType+"', '"+imageName+"', NOW(), 'pending', '"+cusId+"', '"+patientName+"', '"+email+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	
	//get prescription details by prescription id
	public static List<Prescription> getPrescription (String ID){
			int convertedId = Integer.parseInt(ID);
			ArrayList<Prescription> prescription = new ArrayList<>();
			
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from prescription where id='"+convertedId+"'";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt(1);
					String substitutes = rs.getString(2);
					String fulfillment = rs.getString(3);
					String prescriptionText = rs.getString(4);
					String patientAge = rs.getString(5);
					String contactNumber = rs.getString(6);
					String orderType = rs.getString(7);
					String imageName = rs.getString(8);
					Date date = rs.getDate(9);
					String status = rs.getString(10);
					int cusID = rs.getInt(11);
					String patientName = rs.getString(12);
					String email = rs.getString(13);
					
					Prescription pres = new Prescription(id, substitutes, fulfillment, prescriptionText, patientAge, contactNumber, orderType, imageName, date, status, cusID, patientName, email);
					prescription.add(pres);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return prescription;
	}
	
	
	//get all pending prescription details
	public static List<Prescription> getPrescriptionRequests() {
        List<Prescription> requests = new ArrayList<>();
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM prescription WHERE status = 'pending'";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
            	int id = rs.getInt(1);
				String substitutes = rs.getString(2);
				String fulfillment = rs.getString(3);
				String prescriptionText = rs.getString(4);
				String patientAge = rs.getString(5);
				String contactNumber = rs.getString(6);
				String orderType = rs.getString(7);
				String imageName = rs.getString(8);
				Date date = rs.getDate(9);
				String status = rs.getString(10);
				int cusID = rs.getInt(11);
				String patientName = rs.getString(12);
				String email = rs.getString(13);

                Prescription pres = new Prescription(id, substitutes, fulfillment, prescriptionText, patientAge, contactNumber, orderType, imageName, date, status, cusID, patientName, email);
                requests.add(pres);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return requests;
    }
	
	
	
	//get prescription details that belongs to a specific customer
	public static List<Prescription> getCustmerPrescriptions(String cusId) {
		int convertedCusID = Integer.parseInt(cusId);
        List<Prescription> requests = new ArrayList<>();
        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM prescription WHERE cusID = " + convertedCusID;
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
            	int id = rs.getInt(1);
				String substitutes = rs.getString(2);
				String fulfillment = rs.getString(3);
				String prescriptionText = rs.getString(4);
				String patientAge = rs.getString(5);
				String contactNumber = rs.getString(6);
				String orderType = rs.getString(7);
				String imageName = rs.getString(8);
				Date date = rs.getDate(9);
				String status = rs.getString(10);
				int cusID = rs.getInt(11);
				String patientName = rs.getString(12);
				String email = rs.getString(13);

                Prescription pres = new Prescription(id, substitutes, fulfillment, prescriptionText, patientAge, contactNumber, orderType, imageName, date, status, cusID, patientName, email);
                requests.add(pres);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return requests;
    }
	
	
	//approvePrescriptions
	public static boolean approvePrescription(String presID) {
		boolean isSuccess = false;
		int convertedID = Integer.parseInt(presID);
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "UPDATE prescription SET status = 'approved' WHERE id = " + convertedID;
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	
	//delete ror
	public static boolean rejectPrescription(String presID) {
		boolean isSuccess = false;
		int convertedID = Integer.parseInt(presID);
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "DELETE from prescription WHERE id = " + convertedID;
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	
}
