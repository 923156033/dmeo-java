package com.pzy.shop;

import java.io.IOException;
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
 * Servlet implementation class AddFendianServlet
 */
@WebServlet("/AddFendianServlet")
public class AddFendianServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFendianServlet() {
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
		
		//type= new String(type.getBytes("iso-8859-1"),"UTF-8");
		String shopname = request.getParameter("shopname");
		String shoppassword = request.getParameter("shoppassword");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		HttpSession  hs = request.getSession(); 
		String shopid=(String)hs.getAttribute("shopid");
		
		double maxdiscount=Double.parseDouble((String)hs.getAttribute("Maxdiscount"));
		double middiscount=Double.parseDouble((String)hs.getAttribute("Middiscount"));
		double mindiscount=Double.parseDouble((String)hs.getAttribute("Mindiscount"));
		String mibao="";
		if(question.equals("1"))
		{
			mibao="我最喜欢的食物是？";
		}
		else if(question.equals("2"))
		{
			mibao="我最尊敬的人是？";
		}
		else{
			mibao="我的名字是？";
		}
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
       
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection connection = (Connection) DriverManager.getConnection(url);  
		        Statement statement = (Statement) connection.createStatement();  
		        String sql = "insert into shop (shopname,shoppassword,question,answer,maxdiscount,middiscount,mindiscount,parentshopid) values('"+shopname+"','"+shoppassword+"','"+mibao+"','"+answer+"','"+maxdiscount+"','"+middiscount+"','"+mindiscount+"','"+shopid+"')"; 
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
			  
		//跳转
		//request.getRequestDispatcher("/GetUserServlet").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/GetFendianServlet");
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
