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
import com.pzy.domain.Admin;

/**
 * Servlet implementation class GetAdminServlet
 */
@WebServlet("/GetAdminServlet")
public class GetAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAdminServlet() {
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
		//ע������   
        String driverName = "com.mysql.jdbc.Driver";  
        //���ݿ��û�   
        String userName = "root";  
        //���ݿ�����   
        String userPasswd = "pzy123";  
        //���ݿ��� 
        String dbName = "user";  
        //����  
        String tableName = "admin";  
        //��ȡ����
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  
        try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			 Connection connection = (Connection) DriverManager.getConnection(url);  
		        Statement statement = (Statement) connection.createStatement();  
		        String sql = "SELECT * FROM " + tableName;  
		        ResultSet rs = statement.executeQuery(sql); 
		        List<Admin> AdminList = new ArrayList<Admin>();
		        while(rs.next()){
		        	Admin u = new Admin();
		        	u.setAdminid(rs.getString(1));
		        	u.setAdminname(rs.getString(2));
		        	u.setAdminpassword(rs.getString(3));	
		        	AdminList.add(u);
		        }
		        request.getSession().setAttribute("AdminList", AdminList);
		        request.getRequestDispatcher("admin.jsp").forward(request, response);
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
