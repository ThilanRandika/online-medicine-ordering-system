package com.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class addToCart
 */
@WebServlet("/addToCart")
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cusID = "";
		String productId = request.getParameter("PId");
		String quantity = request.getParameter("quantity");
		int Quantity = 0;
		int pid = 0;
		boolean IsTure = false;
		
		try {
			pid = Integer.parseInt(productId);
			Quantity = Integer.parseInt(quantity);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		IsTure = cartDB.addToCart(cusID, pid, Quantity);
		
		if (IsTure == true) {
            // Item added to cart successfully
			RequestDispatcher  dis = request.getRequestDispatcher("UserProductView2.jsp");
			dis.forward(request, response);

            //response.sendRedirect("ShoppingCart.jsp"); // Redirect to a cart page
            
            
        } else {
            // Handle the error case
        	RequestDispatcher dis2 = request.getRequestDispatcher("ShoppingCart.jsp");
			dis2.forward(request, response);
            //response.sendRedirect("error.jsp");
        }
	}

}
