package com.pzy.customer;

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
 * Servlet implementation class AddRequestServlet
 */
@WebServlet("/AddRequestServlet")
public class AddRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRequestServlet() {
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
		String level=request.getParameter("level");
		String customername=(String)hs.getAttribute("customername");
		//type= new String(type.getBytes("iso-8859-1"),"UTF-8");
		String shopname=request.getParameter("shopname");
		
		
		//驱动程序名   
		
        String driverName = "com.mysql.jdbc.Driver";  
        //数据库用户名   
        String userName = "root";  
        //密码   
        String userPasswd = "pzy123";  
        //数据库名   
        String dbName = "user";  
       
       
        //联结字符串   
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  
        String sql="";
        String a="请求审核中";
        String sql1="select shopid from shop where shopname='"+shopname+"'";
        
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection connection = (Connection) DriverManager.getConnection(url);  
		        Statement statement = (Statement) connection.createStatement(); 
		        Statement statement1 = (Statement) connection.createStatement(); 
		        ResultSet rs = statement.executeQuery(sql1);
		        String shopid="";
		        while(rs.next()){
		           shopid=rs.getString(1);
		        }
		        System.out.println(shopid);
		        
		        
		       	 sql = "insert into request (customerid,customername,shopid,shopname,level,state) values('"+customerid+"','"+customername+"','"+shopid+"','"+shopname+"','"+level+"','"+a+"')"; 
				
		        
		        System.out.println(sql);
		        if(rs.isAfterLast()!=rs.isBeforeFirst())
		        {
		        	int rs1 = statement1.executeUpdate(sql);
		        }
		       
		        //rs.close();  
		        statement.close();  
		        connection.close();      
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			  
		//跳转
		//request.getRequestDispatcher("/GetUserServlet").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/GetRequestServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
