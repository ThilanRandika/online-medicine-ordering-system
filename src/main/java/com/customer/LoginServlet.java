package com.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    PrintWriter out = response.getWriter();
	    response.setContentType("text/html");

	    String userName = request.getParameter("username");
	    String password = request.getParameter("password");

	    // Check if it's a valid customer
	    boolean isCustomerValid = CustomerDBUtil.validate(userName, password);

	    if (isCustomerValid) {
	        // Customer is valid, navigate to Home_registeredCus.jsp
	        List<Customer> customerData = CustomerDBUtil.getCustomer(userName);
	        request.setAttribute("customerData", customerData);
	        RequestDispatcher dis = request.getRequestDispatcher("Home_registeredCus.jsp");
	        dis.forward(request, response);
	    } else {
	        // Check if it's a valid staff
	        boolean isStaffValid = CustomerDBUtil.validateStaff(userName, password);

	        if (isStaffValid) {
	            // Staff is valid, navigate to HOME_staff.jsp
	            RequestDispatcher dis = request.getRequestDispatcher("HOME_staff.jsp");
	            dis.forward(request, response);
	        } else {
	            // Check if it's a valid admin
	            boolean isAdminValid = CustomerDBUtil.validateAdmin(userName, password);

	            if (isAdminValid) {
	                // Admin is valid, navigate to newDasgBoard.jsp
	                RequestDispatcher dis = request.getRequestDispatcher("newDasgBoard.jsp");
	                dis.forward(request, response);
	            } else {
	                out.println("<script type='text/javascript'>");
	                out.println("alert('User name or password incorrect');");
	                out.println("location = 'login.jsp'");
	                out.println("</script>");
	            }
	        }
	    }
	}


}
