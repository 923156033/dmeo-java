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

import com.google.gson.Gson;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.pzy.domain.Customer;
import com.pzy.domain.Goods;
import com.pzy.domain.Shop;

/**
 * Servlet implementation class GetQuestionServlet
 */
@WebServlet("/GetQuestionServlet")
public class GetQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset = UTF-8");
		
		String username=URLDecoder.decode(request.getParameter("name"),"utf-8");
		username = new String(username.getBytes("ISO-8859-1"), "utf-8");
		System.out.println(username);
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
	        String sql1="select * from customer where customername='"+username+"'";
	        ResultSet rs1 = statement.executeQuery(sql1);
	        Customer u = new Customer();
	        Shop u1 = new Shop();
	        while(rs1.next()){
	        	u.setQuestion(rs1.getString(4));
	        	u.setAnswer(rs1.getString(5));
	        }
	        
	        String sql2="select * from shop where shopname='"+username+"' ";
	        ResultSet rs2 = statement1.executeQuery(sql2);
	        while(rs2.next()){
	        	u1.setQuestion(rs2.getString(4));
	        	u1.setAnswer(rs2.getString(5));
	        }
	        //判断结果集是否为空
	        if(rs1.isAfterLast()!=rs1.isBeforeFirst())
	        {
	        	
	        	   Gson gson = new Gson();
			        String customer_json = gson.toJson(u);
			        response.getWriter().write(customer_json);
	        }
	        if(rs2.isAfterLast()!=rs2.isBeforeFirst())
	        {
	        	 Gson gson = new Gson();
			        String shop_json = gson.toJson(u1);
			        response.getWriter().write(shop_json);
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
