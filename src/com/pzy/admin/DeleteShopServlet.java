package com.pzy.admin;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class DeleteShopServlet
 */
@WebServlet("/DeleteShopServlet")
public class DeleteShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteShopServlet() {
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
		String shopid = request.getParameter("shopid");
		//ɾ������
		//����������   
        String driverName = "com.mysql.jdbc.Driver";  
        //���ݿ��û���   
        String userName = "root";  
        //����   
        String userPasswd = "pzy123";  
        //���ݿ���   
        String dbName = "user";  
        //����   
        String tableName = "shop";  
        //�����ַ���   
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  
       
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection connection = (Connection) DriverManager.getConnection(url);  
		        Statement statement = (Statement) connection.createStatement();  
		        String sql = "delete FROM " + tableName+" where shopid='"+shopid+"'"; 
		        System.out.println(sql);
		        int rs = statement.executeUpdate(sql);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			  
		//��ת
		//request.getRequestDispatcher("/GetUserServlet").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/GetShopServlet");
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
