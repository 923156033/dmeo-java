package com.pzy.admin;

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

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
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
		String uid = request.getParameter("customerid");
		String upassword = request.getParameter("customerpassword");
		String upassword1 = request.getParameter("customerpassword1");
		//����������   
        String driverName = "com.mysql.jdbc.Driver";  
        //���ݿ��û���   
        String userName = "root";  
        //����   
        String userPasswd = "pzy123";  
        //���ݿ���   
        String dbName = "user";  
        //����   
        String tableName = "customer";  
        //�����ַ���   
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  
       
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection connection = (Connection) DriverManager.getConnection(url);  
		        Statement statement = (Statement) connection.createStatement();  
		        String sql = "update " + tableName+" set customerpassword='"+upassword+"'"+" where customerid='"+uid+"'"; 
		        System.out.println(sql);
		        int rs = statement.executeUpdate(sql);
		        //request.getRequestDispatcher("table.jsp").forward(request, response);
		        //rs.close();  
		        statement.close();  
		        connection.close();      
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			  
		//��ת
		//request.getRequestDispatcher("/GetUserServlet").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/GetUserServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
