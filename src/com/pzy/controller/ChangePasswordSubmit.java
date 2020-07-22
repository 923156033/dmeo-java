package com.pzy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class ChangePasswordSubmit
 */
@WebServlet("/ChangePasswordSubmit")
public class ChangePasswordSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordSubmit() {
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
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String answer=request.getParameter("answer");
		/*String username=URLDecoder.decode(request.getParameter("name"),"utf-8");*/
		//username = new String(username.getBytes("ISO-8859-1"), "utf-8");
		//answer = new String(answer.getBytes("ISO-8859-1"), "utf-8");
		System.out.println(username);
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
        PrintWriter pw=response.getWriter();
        
        try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = (Connection) DriverManager.getConnection(url);  
	        Statement statement = (Statement) connection.createStatement(); 
	        Statement statement1 = (Statement) connection.createStatement(); 
	        Statement statement2 = (Statement) connection.createStatement();
	        Statement statement3 = (Statement) connection.createStatement();
	        //获取会员的customerid，通过customername
	        String sql1="select answer from customer where customername='"+username+"'";
	        ResultSet rs1 = statement.executeQuery(sql1);
	       
	        while(rs1.next()){
	        	 System.out.println(rs1.getString(1));
	        	if(answer.equals(rs1.getString(1)))
	        	{
	        		String sql2="update customer set customerpassword='"+password+"'where customername='"+username+"'";
	        		int rs = statement2.executeUpdate(sql2);
	        		//pw.println("<script>alert('修改成功');</script>");
	        		pw.println("<script> if(confirm('修改成功')){"+
	            			"location.href='login.jsp';}</script>");
	        		//request.getRequestDispatcher("login.jsp").forward(request, response);
	        	}
	        	else
	        	{
	        		pw.println("<script> if(confirm('密保答案错误')){"+
	            			"location.href='changepassword.jsp';}</script>");
	        		//pw.println("<script>alert('密保答案错误');</script>");
	        		//request.getRequestDispatcher("changepassword.jsp").forward(request, response);
	        	}
	        }
	        statement.close();
	        
	        String sql2="select answer from shop where shopname='"+username+"' ";
	        ResultSet rs2 = statement1.executeQuery(sql2);
	        //判断结果集是否为空
	        while(rs2.next()){
	        	 System.out.println(rs2.getString(1));
	        	if(answer.equals(rs2.getString(1)))
	        	{
	        		String sql3="update shop set shoppassword='"+password+"' where shopname='"+username+"'";
	        		int rs = statement3.executeUpdate(sql3);
	        		pw.println("<script> if(confirm('修改成功')){"+
    			"location.href='login.jsp';}</script>");
	        		//request.getRequestDispatcher("login.jsp").forward(request, response);
	        	}
	        	else
	        	{
	        		pw.println("<script> if(confirm('密保答案错误')){"+
            			"location.href='changepassword.jsp';}</script>");
	        		//pw.println("<script type='text/javascript'>alert('密保答案错误');</script>");
	        		//request.getRequestDispatcher("changepassword.jsp").forward(request, response);
	        	}
	        } 
	        
	       
	        	
	        	
	        
	        //request.getRequestDispatcher("table.jsp").forward(request, response);
	        //rs.close();  
	          
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
