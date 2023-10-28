package com.prescription;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class prescriptionDeleteUserServlet
 */
@WebServlet("/prescriptionDeleteUserServlet")
public class prescriptionDeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public prescriptionDeleteUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String presId = request.getParameter("presID");
	    String cusId = request.getParameter("cusId"); // Get cusId

	    // Ensure both presId and cusId are not null
	    if (presId != null && cusId != null) {
	        boolean success = PrescriptionDBUtil.rejectPrescription(presId);
	        if (success) {
	            // Redirect back to prescriptionStatus.jsp with cusId
	            response.sendRedirect("prescriptionStatus.jsp?id=" + cusId);
	        } else {
	            response.sendRedirect("unsuccess.jsp");
	        }
	    } else {
	        // Handle the case where presId or cusId is missing
	        response.sendRedirect("unsuccess.jsp");
	    }
	}

}
