package com.pzy.controller;

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
import com.pzy.domain.Admin;
import com.pzy.domain.Customer;
import com.pzy.domain.Shop;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
				String username = request.getParameter("username");
				//username = new String(username.getBytes("ISO-8859-1"), "utf-8");
				String password = request.getParameter("password");
				String logintype = request.getParameter("logintype");
				
				 String driverName = "com.mysql.jdbc.Driver";  
			        //数据库用户名   
			        String userName = "root";  
			        //密码   
			        String userPasswd = "pzy123";  
			        //数据库名   
			        String dbName = "user";  
			        //表名   	
			        String tableName = ""; 
			        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
			                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  
			    if(logintype.equals("1"))
			    {
			    	   try {
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection connection = (Connection) DriverManager.getConnection(url);  
					        Statement statement = (Statement) connection.createStatement();  
					        String sql = "SELECT * FROM  customer" ; 
					        ResultSet rs = statement.executeQuery(sql);
					        Customer u=new Customer();
					        List<Customer> CustomerList = new ArrayList<Customer>();
					        boolean isLoginSuccess=false;
					        while(rs.next()){
					        if(username!=null&&!username.equals("")&&password!=null&&!password.equals(""))
					        {   
					        	if(username.equals(rs.getString(2))&&password.equals(rs.getString(3)))
					        	{
					        		String customerid=rs.getString(1);
							        HttpSession session=request.getSession();
							        session.setAttribute("customerid",customerid);
							        session.setAttribute("customername",username);
					        		u.setCustomerid(rs.getString(1));
					        		u.setCustomername(rs.getString(2));
					        		u.setCustomerpassword(rs.getString(3));
					        		u.setQuestion(rs.getString(4));
					        		u.setAnswer(rs.getString(5));
					        		CustomerList.add(u);
					        		request.getSession().setAttribute("CustomerList", CustomerList);
								    request.getRequestDispatcher("customerindex.jsp").forward(request, response);
								    isLoginSuccess=true;
					        	}	
					        	
					        }	
					        
					        }
					        if(!isLoginSuccess)
					        {
					        	response.sendRedirect("login.jsp");
					        }
					        
					       
					        //request.getRequestDispatcher("table.jsp").forward(request, response);
					        //rs.close();  
					        statement.close();  
					        connection.close();    
					    	
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} 
			    	    
			    }
			    else  if(logintype.equals("2"))
			    {
			    	try {
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection connection = (Connection) DriverManager.getConnection(url);  
				        Statement statement = (Statement) connection.createStatement(); 
				        Statement statement1 = (Statement) connection.createStatement();
				        String sql = "SELECT * FROM  shop" ;
				        /*String sql1 = "SELECT * FROM  shop where shopname='"+username+"' and parentshopid is null" ;*/
				        ResultSet rs = statement.executeQuery(sql);
				       
				        Shop u=new Shop();
				        
				        List<Shop> ShopList = new ArrayList<Shop>();
				        boolean isLoginSuccess=false;
				        while(rs.next()){
				        if(username!=null&&!username.equals("")&&password!=null&&!password.equals(""))
				        {   
				        	if(username.equals(rs.getString(2))&&password.equals(rs.getString(3)))
				        	{
				        	 String shopid=rs.getString(1);
				        	 String shopname=rs.getString(2);
				        	 String Maxdiscount=rs.getString(6);
				        	 String Middiscount=rs.getString(7);
				        	 String Mindiscount=rs.getString(8);
							 HttpSession session=request.getSession();
							 session.setAttribute("shopid",shopid);
							 session.setAttribute("shopname",shopname);
							 session.setAttribute("Maxdiscount",Maxdiscount);
							 session.setAttribute("Middiscount",Middiscount);
							 session.setAttribute("Mindiscount",Mindiscount);
				        		u.setShopid(rs.getString(1));
				        		u.setShopname(rs.getString(2));
				        		u.setShoppassword(rs.getString(3));
				        		u.setQuestion(rs.getString(4));
				        		u.setAnswer(rs.getString(5));
				        		u.setMaxdiscount(rs.getString(6));
				        		u.setMiddiscount(rs.getString(7));
				        		u.setMindiscount(rs.getString(8));
				        		
				        		ShopList.add(u);
				        		request.getSession().setAttribute("ShopList", ShopList);
							   
								 request.getRequestDispatcher("shopindex.jsp").forward(request, response);
								
							 
							   
							    isLoginSuccess=true;
				        		
				        	}
				        }      
				        }   
				        if(!isLoginSuccess)
				        {
				        	response.sendRedirect("login.jsp");
				        }
				        //request.getRequestDispatcher("table.jsp").forward(request, response);
				        //rs.close();  
				        statement.close();  
				        connection.close();  
				        
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
			    	
			    	
			   
			    	}
			    else
			     {

			    	try {
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						Connection connection = (Connection) DriverManager.getConnection(url);  
				        Statement statement = (Statement) connection.createStatement(); 
				        
				        String sql = "SELECT * FROM  admin" ;			        
				        ResultSet rs = statement.executeQuery(sql);
				        Admin u=new Admin();
				        boolean isLoginSuccess=false;
				        while(rs.next()){
				        if(username!=null&&!username.equals("")&&password!=null&&!password.equals(""))
				        {   
				        	if(username.equals(rs.getString(2))&&password.equals(rs.getString(3)))
				        	{
				        	 String adminid=rs.getString(1);
				        	 String adminname=rs.getString(2);
				        	 System.out.println(adminid);
				        	 System.out.println(adminname);
							 HttpSession session=request.getSession();
							 session.setAttribute("adminid",adminid);
							 session.setAttribute("adminname",adminname);
							
				        		u.setAdminid(rs.getString(1));
				        		u.setAdminname(rs.getString(2));
							    request.getRequestDispatcher("admin.jsp").forward(request, response);
							    isLoginSuccess=true;
				        	}
				        }
				        }   
				        if(!isLoginSuccess)
				        {
				        	response.sendRedirect("login.jsp");
				        }
				        //request.getRequestDispatcher("table.jsp").forward(request, response);
				        //rs.close();  
				        statement.close();  
				        connection.close();  

					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
			    	
			    	
			   
			    	
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
