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

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class ChangePsswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
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
        //���ݿ��û���   
        String userName = "root";  
        //����   
        String userPasswd = "pzy123";  
        //���ݿ���   
        String dbName = "user";  
        //����   	
       
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  
        PrintWriter pw=response.getWriter();
        
        try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = (Connection) DriverManager.getConnection(url);  
	        Statement statement = (Statement) connection.createStatement(); 
	        Statement statement1 = (Statement) connection.createStatement(); 
	        //��ȡ��Ա��customerid��ͨ��customername
	        String sql1="select * from customer where customername='"+username+"'";
	        ResultSet rs1 = statement.executeQuery(sql1);
	        
	        
	        String sql2="select * from shop where shopname='"+username+"' ";
	        ResultSet rs2 = statement1.executeQuery(sql2);
	        //�жϽ�����Ƿ�Ϊ��
	        	 
	        	 if(rs1.isAfterLast()==rs1.isBeforeFirst()&&rs2.isAfterLast()==rs2.isBeforeFirst())
	        	 {
	        		 pw.println("&nbsp;&nbsp;<font color='red'>���û�������</font>");
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
