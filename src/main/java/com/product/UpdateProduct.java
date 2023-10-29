package com.product;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UpdateProduct
 */
@MultipartConfig
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String PId = request.getParameter("productId");
		String pName = request.getParameter("productName");
		String pCategory = request.getParameter("productCategory");
		String pDescription = request.getParameter("productDescription");
		String pPrice = request.getParameter("productPrice");
		String pQuantity = request.getParameter("productQuantity");
		
		Part productImage = request.getPart("image");
		
		String imageName;
		
		if (productImage != null && productImage.getSize() > 0) {
		
				imageName = productImage.getName(); 
				String imagePath = "C:/Users/sande/eclipse-workspace/projectTest1/src/main/webapp/image/" + imageName ;
				
				try {
					
					FileOutputStream fos = new FileOutputStream(imagePath);
					InputStream Is = productImage.getInputStream();
					
					byte[] data = new byte[Is.available()];
					int read;
				    while ((read = Is.read(data)) != -1) {
				        fos.write(data, 0, read);
				    }
					fos.close();
					Is.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
		
		}else {
			
			int id = Integer.parseInt(PId);
			Product p = productDB.getProductById(id);
			
			 imageName = p.getProductImage(); 
		}
		
		boolean isTrue;
		
		isTrue = productDB.updateProduct(PId, pName, pCategory, pDescription, pPrice, pQuantity, imageName);
		
		if(isTrue == true) {
			RequestDispatcher  dis = request.getRequestDispatcher("AdminproductListPage.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("productDetailPage.jsp");
			dis2.forward(request, response);
		}
	}
	

}
