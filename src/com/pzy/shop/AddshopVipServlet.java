package com.pzy.shop;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class AddshopVipServlet
 */
@WebServlet("/AddshopVipServlet")
public class AddshopVipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddshopVipServlet() {
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
		//username = new String(username.getBytes("ISO-8859-1"), "utf-8");
		String level = request.getParameter("level");
		HttpSession  hs = request.getSession(); 
		String shopid=(String)hs.getAttribute("shopid");
		String shopname=(String)hs.getAttribute("shopname");
		String Maxdiscount=(String)hs.getAttribute("Maxdiscount");
		String Middiscount=(String)hs.getAttribute("Middiscount");
		String Mindiscount=(String)hs.getAttribute("Mindiscount");
		double discount;
		if(level.equals("钻石会员"))
		{
			discount=Double.parseDouble(Maxdiscount);
		}
		else if(level.equals("白金会员"))
		{
			discount=Double.parseDouble(Middiscount);
		}
		else
		{
			discount=Double.parseDouble(Mindiscount);
		}
		String customername = request.getParameter("customername");
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
		        Statement statement1 = (Statement) connection.createStatement(); 
		        //获取会员的customerid，通过customername
		        String sql1="select * from customer where customername='"+customername+"'";
		        ResultSet rs1 = statement.executeQuery(sql1);
		        String customerid="";
		        while(rs1.next()){
		        	 customerid=rs1.getString("customerid");
		        }
		        String sql = "insert into vip (shopid,customerid,shopname,discount,level,customername) values('"+shopid+"','"+customerid+"','"+shopname+"',"+discount+",'"+level+"','"+customername+"')"; 
		        System.out.println(sql);
		        String sql2="select * from vip where customername='"+customername+"' and shopid='"+shopid+"'";
		        ResultSet rs2 = statement1.executeQuery(sql2);
		        if((rs1.isAfterLast()!=rs1.isBeforeFirst())&&(rs2.isAfterLast()==rs2.isBeforeFirst()))
		        {    
		        	    int rs = statement.executeUpdate(sql); 
		        }
		        //request.getRequestDispatcher("table.jsp").forward(request, response);
		        //rs.close();  
		        statement.close();  
		        connection.close();      
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			  
		//跳转
		//request.getRequestDispatcher("/GetUserServlet").forward(request, response);
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
