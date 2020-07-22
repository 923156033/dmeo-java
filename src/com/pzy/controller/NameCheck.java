package com.pzy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class NameCheck
 */
@WebServlet("/NameCheck")
public class NameCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NameCheck() {
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
		
		String customername=URLDecoder.decode(request.getParameter("name"),"utf-8");
		        customername = new String(customername.getBytes("ISO-8859-1"), "utf-8");
		        
		        HttpSession  hs = request.getSession(); 
				String shopid=(String)hs.getAttribute("shopid");
		        String driverName = "com.mysql.jdbc.Driver";  
		        //数据库用户名   
		        String userName = "root";  
		        //密码   
		        String userPasswd = "pzy123";  
		        //数据库名   
		        String dbName = "user";  
		        //表名   	
		       
		        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
		                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  
		        PrintWriter pw=response.getWriter();
		        
		        try {
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection connection = (Connection) DriverManager.getConnection(url);  
			        Statement statement = (Statement) connection.createStatement(); 
			        Statement statement1 = (Statement) connection.createStatement(); 
			        //获取会员的customerid，通过customername
			        String sql1="select * from customer where customername='"+customername+"'";
			        ResultSet rs1 = statement.executeQuery(sql1);
			        
			        
			        String sql2="select * from vip where customername='"+customername+"' and shopid='"+shopid+"'";
			        ResultSet rs2 = statement1.executeQuery(sql2);
			        //判断结果集是否为空
			        	 
			        	 if(rs2.isAfterLast()!=rs2.isBeforeFirst())
			        	 {
			        		 pw.println("&nbsp;&nbsp;<font color='red'>该用户已经是本店会员</font>");
			        	 }
			        	 if(rs1.isAfterLast()==rs1.isBeforeFirst())
			        	 {
			        		 pw.println("&nbsp;&nbsp;<font color='red'>该用户不存在</font>");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
