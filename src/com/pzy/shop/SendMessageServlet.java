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

/**
 * Servlet implementation class SendMessageServlet
 */
@WebServlet("/SendMessageServlet")
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageServlet() {
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
		//获取复选框选中的customerid数组
		String [] a = request.getParameterValues("customerid");
		String message = request.getParameter("message");
		message = new String(message.getBytes("ISO-8859-1"), "utf-8");
		HttpSession  hs = request.getSession(); 
		System.out.println(message);
		String shopid=(String)hs.getAttribute("shopid");
		String shopname=(String)hs.getAttribute("shopname");
		System.out.println(shopid);
		System.out.println(shopname);
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
	        try {
	   				Class.forName("com.mysql.jdbc.Driver").newInstance();
	   				 Connection connection = (Connection) DriverManager.getConnection(url);  
	   			        Statement statement = (Statement) connection.createStatement();  
	   			         String [] strArray = new String [100];
	   			        for(int i=0;i<a.length;i++)
	   			        	{
	   			        	   strArray[i] = "insert into message (customerid,shopid,shopname,message) values('"+a[i]+"','"+shopid+"','"+shopname+"','"+message+"')";
	   			        	   int rs = statement.executeUpdate(strArray[i]);
	   			        	}
	   			        System.out.println("发送成功");
	   			        statement.close();  
	   			        connection.close();  
	   			} catch (Exception e) {
	   				// TODO Auto-generated catch block
	   				e.printStackTrace();
	   			}  
	        response.sendRedirect(request.getContextPath()+"/GetshopVipServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
