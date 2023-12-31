package com.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteProduct
 */
@MultipartConfig
@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("").append(request.getContextPath());
		response.setContentType("text/html;charset=UFT-8");
		
		try(PrintWriter out = response.getWriter()){
			
			int id = Integer.parseInt(request.getParameter("Pid"));
			Product p = productDB.getProductById(id);
			
			if(p != null) {
			HttpSession session = request.getSession();
			session.setAttribute("deleteProduct", p);
			
			response.sendRedirect("DeleteProduct.jsp");
			}else {
				out.println("Product not fund");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("productId");
		int conInt = Integer.parseInt(id);
		
		
		boolean isTrue;
		
		isTrue = productDB.deleteProduct(conInt);
		
		if(isTrue == true) {
			RequestDispatcher  dis = request.getRequestDispatcher("AdminproductListPage.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("DeleteProduct.jsp");
			dis2.forward(request, response);
		}
	}

}
