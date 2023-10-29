package com.product;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class productInsert
 */

@WebServlet("/productInsert")
@MultipartConfig
public class productInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String productName = request.getParameter("productName");
		String productCategory = request.getParameter("productCategory");
		String productDescription = request.getParameter("productDescription");
		String productPrice = request.getParameter("productPrice");
		String productQuantity = request.getParameter("productQuantity");
		
		Part productImage = request.getPart("image");
		
		String imageName = productImage.getName();
		String imagePath = "C:/Users/sande/OneDrive/Desktop/repo_Project/online-medicine-ordering-system/src/main/webapp/productImage/" + imageName ;
		
		//catche the errors in file handling 
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
		
		boolean isTrue;
		
		/*if (productName.isEmpty()) {
		    request.setAttribute("error", "Username is required.");
		    request.getRequestDispatcher("navigationBar.jsp").forward(request, response);
		    return;
		}*/

		
		isTrue = productDB.insertProduct(productName, productCategory, productDescription, productPrice, productQuantity, imageName);
		
		if(isTrue == true) {
			RequestDispatcher  dis = request.getRequestDispatcher("addproductform.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("AdminproductListPage.jsp");
			dis2.forward(request, response);
		}
	}

}
