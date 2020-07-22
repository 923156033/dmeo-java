package com.pzy.shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class ChangeLevelServlet
 */
@WebServlet("/ChangeLevelServlet")
public class ChangeLevelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeLevelServlet() {
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
		String shopid=(String)hs.getAttribute("shopid");
		String shopname=(String)hs.getAttribute("shopname");
		String customerid=request.getParameter("customerid");
		String customername=request.getParameter("customername1");
		String level1=request.getParameter("level1");
		String level="";
		double discount;
		String maxdiscount=(String)hs.getAttribute("Maxdiscount");
		String middiscount=(String)hs.getAttribute("Middiscount");
		String mindiscount=(String)hs.getAttribute("Mindiscount");
		
		System.out.println(maxdiscount);
		if(level1.equals("钻石会员")){
			level="钻石会员";
			discount=Double.parseDouble(maxdiscount);
		}
		else if(level1.equals("白金会员"))
		{
			level="白金会员";
			discount=Double.parseDouble(middiscount);
		}
		else
		{
			level="黄金会员";
			discount=Double.parseDouble(mindiscount);
		}
		 String driverName = "com.mysql.jdbc.Driver";  
	        //数据库用户名   
	        String userName = "root";  
	        //密码   
	        String userPasswd = "pzy123";  
	        //数据库名   
	        String dbName = "user";  
	        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
	                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  

			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection connection = (Connection) DriverManager.getConnection(url);  
		        Statement statement = (Statement) connection.createStatement(); 
		        
		        String sql =  "update vip set discount="+discount+","+"level='"+level+"' where shopid='"+shopid+"' and customerid='"+customerid+"'";
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
