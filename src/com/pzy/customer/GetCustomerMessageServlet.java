package com.pzy.customer;

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

/**
 * Servlet implementation class GetShopMessageServlet
 */
@WebServlet("/GetCustomerMessageServlet")
public class GetCustomerMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCustomerMessageServlet() {
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
		 HttpSession  hs = request.getSession(); 
			String customerid=(String)hs.getAttribute("customerid");
		//注册驱动   
        String driverName = "com.mysql.jdbc.Driver";  
        //数据库用户   
        String userName = "root";  
        //数据库密码   
        String userPasswd = "pzy123";  
        //数据库名 
        String dbName = "user";  
        //表名  
        String tableName = "customer";  
        //获取连接
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  
        try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			 Connection connection = (Connection) DriverManager.getConnection(url);  
		        Statement statement = (Statement) connection.createStatement();  
		        String sql = "SELECT * FROM  customer where customerid='"+customerid+"'"  ;  
		        ResultSet rs = statement.executeQuery(sql); 
		        List<Customer> CustomerList = new ArrayList<Customer>();
		        while(rs.next()){
		        	Customer u = new Customer();
		        	u.setCustomerid(rs.getString(1));
		        	u.setCustomername(rs.getString(2));
		        	u.setCustomerpassword(rs.getString(3));	
		        	u.setQuestion(rs.getString(4));	
		        	u.setAnswer(rs.getString(5));	
		        	CustomerList.add(u);
		        }
		        request.getSession().setAttribute("CustomerList", CustomerList);
		        request.getRequestDispatcher("customerindex.jsp").forward(request, response);
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
