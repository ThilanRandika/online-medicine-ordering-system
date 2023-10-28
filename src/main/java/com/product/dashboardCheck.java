package com.product;

import java.io.IOException;
import com.product.dashboardCheck;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class dashboardCheck
 */
@WebServlet("/dashboardCheck")
public class dashboardCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dashboardCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("").append(request.getContextPath());
		
			
		 	List<String> labels = new ArrayList<>();
	        List<Integer> data = new ArrayList<>();

	        try {
	        	 String url = "jdbc:mysql://localhost:3306/oop_project?useSSL=false";
	        	 String username = "root";
	        	 String password = "sandeep";
	        	 Connection con;
	        	
	        	con = DriverManager.getConnection(url, username, password);
				
				String sql = "select Pcatogary, count(productid) as numberOfProducts from product group by Pcatogary";
				PreparedStatement preparedStatement = con.prepareStatement(sql);
				
				 ResultSet rs = preparedStatement.executeQuery();
				
				while (rs.next()) {
	                labels.add(rs.getString("Pcatogary"));
	                data.add(rs.getInt("numberOfProducts"));
	            }
				
				con.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}

	        HttpSession session = request.getSession();
			session.setAttribute("catagory", labels);
			session.setAttribute("catagoryNum", data);
			response.sendRedirect("newDasgBoard.jsp");
	    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
