package com.pzy.controller;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class RegisterCustomer
 */
@WebServlet("/RegisterCustomer")
public class RegisterCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCustomer() {
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
		username = new String(username.getBytes("ISO-8859-1"), "utf-8");
		String password = request.getParameter("password");
		String registertype = request.getParameter("registertype");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		answer = new String(answer.getBytes("ISO-8859-1"), "utf-8");
		String mibao="";
		if(question.equals("1"))
		{
			mibao="我最喜欢的食物是？";
		}
		else if(question.equals("2"))
		{
			mibao="我最尊敬的人是？";
		}
		else{
			mibao="我的名字是？";
		}
		
		 String driverName = "com.mysql.jdbc.Driver";  
	        //数据库用户名   
	        String userName = "root";  
	        //密码   
	        String userPasswd = "pzy123";  
	        //数据库名   
	        String dbName = "user";  
	        //表名   	
	        String tableName = ""; 
	        if(registertype.equals("1"))
	        {
	        	tableName="customer";
	        }
	        else
	        {
	        	tableName="shop";
	        }
	         
	        //联结字符串   
	        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
	                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  
	       
				try {
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection connection = (Connection) DriverManager.getConnection(url);  
			        Statement statement = (Statement) connection.createStatement();  
			        String sql = "insert into " + tableName+"(customername,customerpassword,question,answer) values('"+username+"','"+password+"','"+mibao+"','"+answer+"')"; 
			        System.out.println(sql);
			        String sql1 = "insert into " + tableName+"(shopname,shoppassword,question,answer) values('"+username+"','"+password+"','"+mibao+"','"+answer+"')"; 
			        System.out.println(sql1);
			        if(tableName.equals("customer"))
			        {
			        	int rs = statement.executeUpdate(sql);
			        }
			        else
			        	{
			        	int rs1= statement.executeUpdate(sql1);
			        	}
			        
			        request.getRequestDispatcher("registersuccess.jsp").forward(request, response);
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
