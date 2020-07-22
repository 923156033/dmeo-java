package com.pzy.shop;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.pzy.domain.Shop;

/**
 * Servlet implementation class GetFendianServlet
 */
@WebServlet("/GetFendianServlet")
public class GetFendianServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFendianServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset = UTF-8");
				HttpSession  hs = request.getSession(); 
				String shopid=(String)hs.getAttribute("shopid");
				
				 String driverName = "com.mysql.jdbc.Driver";  
			        //数据库用户名   
			        String userName = "root";  
			        //密码   
			        String userPasswd = "pzy123";  
			        //数据库名   
			        String dbName = "user";  
			        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
			                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8"; 
			        
			        try {
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection connection = (Connection) DriverManager.getConnection(url);  
				        Statement statement = (Statement) connection.createStatement();  
				        String sql = "select* FROM shop where parentshopid='"+shopid+"'"; 
				       
				        ResultSet rs = statement.executeQuery(sql); 
				        List<Shop> ShopList = new ArrayList<Shop>();
				        while(rs.next()){
				        	Shop u = new Shop();
				        	u.setShopid(rs.getString(1));
				        	u.setShopname(rs.getString(2));
				        	ShopList.add(u);
				        	
				        }
				        request.getSession().setAttribute("ShopList", ShopList);
				        request.getRequestDispatcher("fendian.jsp").forward(request, response);
				        rs.close();  
				        statement.close();  
				        connection.close(); 
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
			        
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
