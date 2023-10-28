package com.prescription;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class PrescriptionServlet
 */
@MultipartConfig
@WebServlet("/PrescriptionServlet")
public class PrescriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrescriptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String substitutes = request.getParameter("substitutes");
	     String fulfillment = request.getParameter("fulfillment");
	     String prescriptionText = request.getParameter("prescriptionText");
	     String patientAge = request.getParameter("patientAge");
	     String contactNumber = request.getParameter("contactNumber");
	     String orderType = request.getParameter("orderType");
	     String cusId = request.getParameter("cusID");
	     String patientName = request.getParameter("patientAge");
	     String email = request.getParameter("email");
	     
	     
	     Part file1 = request.getPart("file1");
	     String file1Name = file1.getSubmittedFileName();
	     String uploadPathF1 = "D:" + File.separator + "java" + File.separator + "finaBest" + File.separator + "online-medicine-ordering-system" + File.separator + "src" + File.separator + "main" + File.separator +  "webapp" + File.separator + "images" + File.separator + file1Name;

	     
	     //file handling
	     try {
	    	 FileOutputStream fos = new FileOutputStream(uploadPathF1);
		     InputStream is = file1.getInputStream();
		     byte[] data = new byte[is.available()];
		     is.read(data);
		     fos.write(data);
		     fos.close();
		     
		} catch (Exception e) {
			e.printStackTrace();
		}
	     
	     boolean isTrue = PrescriptionDBUtil.uploadPrescription(substitutes, fulfillment, prescriptionText, patientAge, contactNumber, orderType, file1Name, cusId, patientName, email);
	     
	     
	     if(isTrue == true) {
				RequestDispatcher dis = request.getRequestDispatcher("prescriptionStatus.jsp?id=" + cusId);
				dis.forward(request, response);
			} else {
				RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
				dis2.forward(request, response);
			}
	}

}
