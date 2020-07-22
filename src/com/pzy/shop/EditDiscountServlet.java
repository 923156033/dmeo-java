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
 * Servlet implementation class EditDiscountServlet
 */
@WebServlet("/EditDiscountServlet")
public class EditDiscountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditDiscountServlet() {
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
		double maxdiscount=Double.parseDouble(request.getParameter("maxdiscount"));
		double middiscount=Double.parseDouble(request.getParameter("middiscount"));
		double mindiscount=Double.parseDouble(request.getParameter("mindiscount"));
		 System.out.println(maxdiscount);
		 System.out.println(middiscount);
		 System.out.println(mindiscount);
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
		        Statement statement1 = (Statement) connection.createStatement(); 
		        Statement statement2 = (Statement) connection.createStatement(); 
		        Statement statement3 = (Statement) connection.createStatement(); 
		        String sql =  "update shop set maxdiscount="+maxdiscount+","+"middiscount="+middiscount+","+"mindiscount="+mindiscount+" where shopid='"+shopid+"'";
                String sql1 = "update vip  set discount="+maxdiscount+" where shopid='"+shopid+"'and level='钻石会员'"; 
                String sql2 = "update vip  set discount="+middiscount+" where shopid='"+shopid+"'and level='白金会员'"; 
                String sql3 = "update vip  set discount="+mindiscount+" where shopid='"+shopid+"'and level='黄金会员'"; 
                System.out.println(sql);
                System.out.println(sql1);
		        System.out.println(sql2);
		        System.out.println(sql3);
		        int rs = statement.executeUpdate(sql);
		        int rs1= statement1.executeUpdate(sql1);
		        int rs2= statement1.executeUpdate(sql2);
		        int rs3= statement1.executeUpdate(sql3);
		        PrintWriter out = response.getWriter();
		        out.println("设置折扣成功");
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
