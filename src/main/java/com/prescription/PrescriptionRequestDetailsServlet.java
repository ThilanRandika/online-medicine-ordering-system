package com.prescription;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PrescriptionRequestDetailsServlet
 */
@WebServlet("/PrescriptionRequestDetailsServlet")
public class PrescriptionRequestDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrescriptionRequestDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String presId = request.getParameter("presID");
		List<Prescription> presriptionDetails = PrescriptionDBUtil.getPrescription(presId);
		request.setAttribute("presriptionDetails", presriptionDetails);
		RequestDispatcher dis = request.getRequestDispatcher("PrescriptionRequestDetails.jsp");
		dis.forward(request, response);
	}

}
