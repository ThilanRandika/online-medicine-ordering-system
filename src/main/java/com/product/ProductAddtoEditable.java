package com.product;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProductAddtoEditable
 */
@WebServlet("/ProductAddtoEditable")
public class ProductAddtoEditable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAddtoEditable() {
        super();
        // TODO Auto-generated constructor stub
    }

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
			session.setAttribute("editProduct", p);
			
			response.sendRedirect("productDetailPage.jsp");
			}else {
				out.println("Product not fund");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
