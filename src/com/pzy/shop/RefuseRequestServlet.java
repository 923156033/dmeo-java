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
 * Servlet implementation class RefuseRequestServlet
 */
@WebServlet("/RefuseRequestServlet")
public class RefuseRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefuseRequestServlet() {
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
		String customerid=request.getParameter("customerid");
		String customername=request.getParameter("customername");

		String level=request.getParameter("level");
		level = new String(level.getBytes("ISO-8859-1"), "utf-8");
		System.out.println(level);
		HttpSession  hs = request.getSession(); 
		String shopid=(String)hs.getAttribute("shopid");
		String shopname=(String)hs.getAttribute("shopname");
		//注册驱动   
        String driverName = "com.mysql.jdbc.Driver";  
        //数据库用户   
        String userName = "root";  
        //数据库密码   
        String userPasswd = "pzy123";  
        //数据库名 
        String dbName = "user";  
        //表名  
         
        //获取连接
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  
        try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			 Connection connection = (Connection) DriverManager.getConnection(url);  
		        Statement statement = (Statement) connection.createStatement();
		        Statement statement1 = (Statement) connection.createStatement();
			    String b="审核未通过";
		       
		         
		       
		        //判断是否申请过且已经同意，已经往vip表插入数据，此时点击拒绝进行删除该条记录
			    String sql2 = "update request  set state='"+b+"' where shopid='"+shopid+"'and customerid='"+customerid+"'and level='"+level+"'";
	        	System.out.println(sql2);
		        String sql1="select * from vip where shopid='"+shopid+"' and customerid='"+customerid+"'";
		        ResultSet rs = statement.executeQuery(sql1);
		        int rs4 = statement1.executeUpdate(sql2);
		       /* if(rs.isAfterLast()!=rs.isBeforeFirst())
	        	 {
		        	 
		        	 int rs2 = statement1.executeUpdate(sql2);
	        		 String sql3="delete FROM vip where customerid='"+customerid+"' and shopid='"+shopid+"'";
	        		 System.out.println(sql3);
	        		 int rs3 = statement1.executeUpdate(sql3);
	        	 }
		        else
		        {
		        	int rs4 = statement1.executeUpdate(sql2);
		        }*/
		        statement.close();  
		        connection.close();  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}  
        response.sendRedirect(request.getContextPath()+"/GetShopRequestServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
