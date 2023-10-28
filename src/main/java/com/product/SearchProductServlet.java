package com.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchProductServlet
 */
@WebServlet("/SearchProductServlet")
public class SearchProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProductServlet() {
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
		String searchTerm = request.getParameter("searchTerm");
		
		
		try(PrintWriter out = response.getWriter()) {
			
			Product p = productDB.getProductByName(searchTerm);
			if(p != null) {
				request.setAttribute("product", p);
				request.getRequestDispatcher("UserProductView2.jsp").forward(request, response);
			}else {
				out.println("Product notr founf");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
