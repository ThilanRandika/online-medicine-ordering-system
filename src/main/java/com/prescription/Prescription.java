package com.prescription;

import java.sql.Date;
import java.util.List;

public class Prescription {
	private int id;
    private String substitutes;
    private String fulfillment;
    private String prescriptionText;
    private String patientAge;
    private String contactNumber;
    private String orderType;
    private String imageName;
    private Date date;
    private String status;
    private int cusID;
    private String patientName;
    private String email;


	
    
	
	public Prescription(int id, String substitutes, String fulfillment, String prescriptionText, String patientAge,
			String contactNumber, String orderType, String imageName, Date date, String status, int cusID,
			String patientName, String email) {
		this.id = id;
		this.substitutes = substitutes;
		this.fulfillment = fulfillment;
		this.prescriptionText = prescriptionText;
		this.patientAge = patientAge;
		this.contactNumber = contactNumber;
		this.orderType = orderType;
		this.imageName = imageName;
		this.date = date;
		this.status = status;
		this.cusID = cusID;
		this.patientName = patientName;
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public String getSubstitutes() {
		return substitutes;
	}

	

	public String getFulfillment() {
		return fulfillment;
	}



	public String getPrescriptionText() {
		return prescriptionText;
	}

	

	public String getPatientAge() {
		return patientAge;
	}

	

	public String getContactNumber() {
		return contactNumber;
	}


	public String getOrderType() {
		return orderType;
	}

	
	public String getImageName() {
		return imageName;
	}
	
	
	public Date getDate() {
		return date;
	}
	
	
	public String getStatus() {
		return status;
	}

	public int getCusID() {
		return cusID;
	}

	

	public String getPatientName() {
		return patientName;
	}

	

	public String getEmail() {
		return email;
	}

	


    
    
}
