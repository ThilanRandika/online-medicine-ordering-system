package com.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String cusid = request.getParameter("cusid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String username = request.getParameter("uname");
		String password = request.getParameter("pass");
		String address = request.getParameter("address");
		
		
		int id = Integer.parseInt(cusid);
		
		boolean isTrue;
		
		isTrue = CustomerDBUtil.updatecustomer(id, name, email, phone, username, password,address);
		
		if(isTrue == true) {
			
			List<Customer> customerData = CustomerDBUtil.getCustomerDetails(id);
			request.setAttribute("customerData", customerData);
			
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		}
		else {
			List<Customer> customerData = CustomerDBUtil.getCustomerDetails(id);
			request.setAttribute("customerData", customerData);
			
			RequestDispatcher dis = request.getRequestDispatcher("CustomerAcc.jsp");
			dis.forward(request, response);
		}
	}

}
