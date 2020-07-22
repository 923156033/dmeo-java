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
import com.pzy.domain.Message;

/**
 * Servlet implementation class GetMessageServlet
 */
@WebServlet("/GetMessageServlet")
public class GetMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMessageServlet() {
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
		HttpSession  hs = request.getSession(); 
		String customerid=(String)hs.getAttribute("customerid");
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
			        String sql = "SELECT * FROM message where customerid='"+customerid+"'";  
			        ResultSet rs = statement.executeQuery(sql); 
			        List<Message> MessageList = new ArrayList<Message>();
			        while(rs.next()){
			        	Message u = new Message();
			        	u.setCustomerid(rs.getString(1));
			        	u.setShopid(rs.getString(2));
			        	u.setShopname(rs.getString(3));	
			        	u.setMessage(rs.getString(4));	
			        	MessageList.add(u);
			        }
			        request.getSession().setAttribute("MessageList", MessageList);
			        request.getRequestDispatcher("message.jsp").forward(request, response);
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
