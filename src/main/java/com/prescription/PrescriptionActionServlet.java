package com.prescription;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PrescriptionActionServlet
 */
@WebServlet("/PrescriptionActionServlet")
public class PrescriptionActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrescriptionActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String presId = request.getParameter("presID");
        String action = request.getParameter("action");
        
        
        if ("Approve".equals(action)) {
            // Call a method to update the status to "approved" in the database
            boolean success = PrescriptionDBUtil.approvePrescription(presId);
            if (success) {
                // Redirect to a success page or display a success message
                response.sendRedirect("PrescriptionRequests.jsp");
            } else {
                // Handle the case where the update fails
                response.sendRedirect("PrescriptionRequests.jsp");
            }
        } else if ("Reject".equals(action)) {
            // Call a method to delete the prescription from the database
            boolean success = PrescriptionDBUtil.rejectPrescription(presId);
            if (success) {
                // Redirect to a success page or display a success message
                response.sendRedirect("PrescriptionRequests.jsp");
            } else {
                // Handle the case where the deletion fails
                response.sendRedirect("PrescriptionRequests.jsp");
            }
        }
        
        
	}

}
