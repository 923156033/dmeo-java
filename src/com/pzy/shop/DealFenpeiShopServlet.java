package com.pzy.shop;

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

import com.google.gson.Gson;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.pzy.domain.Goods;

/**
 * Servlet implementation class DealFenpeiShopServlet
 */
@WebServlet("/DealFenpeiShopServlet")
public class DealFenpeiShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DealFenpeiShopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession  hs = request.getSession(); 
		String shopid=(String)hs.getAttribute("shopid");
		String fendianid=request.getParameter("shopid");
		String shopname=request.getParameter("shopname");
		shopname = new String(shopname.getBytes("ISO-8859-1"), "utf-8");
		System.out.println(shopname);
		String[] choosegoods = request.getParameterValues("choosegoods");
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
		       // System.out.println(choosegoods.length);
		        for(int i = 0 ;i<=choosegoods.length-1;i++){
		        	  String sql = "SELECT * FROM goods where goodsid='"+choosegoods[i]+"' and shopid='"+shopid+"'";  
				        ResultSet rs = statement.executeQuery(sql); 
				        
				       // List<Goods> GoodsList = new ArrayList<Goods>();
				        while(rs.next()){
				        	Goods u = new Goods();
				        	u.setGoodsid(rs.getString(1));
				        	u.setGoodsname(rs.getString(2));
				        	u.setShopid(rs.getString(3));	
				        	u.setPrice(rs.getDouble(4));
				        	u.setImg(rs.getString(5));
				        	//GoodsList.add(u);
				        	String sql1 = "insert into goods (goodsid,goodsname,shopid,price,img,shopname) values('"+u.getGoodsid()+"','"+u.getGoodsname()+"','"+fendianid+"','"+u.getPrice()+"','"+u.getImg()+"','"+shopname+"')"; 
				        	statement1.executeUpdate(sql1);	
				        }
				       rs.close();  
		        }
		        statement.close();  
		        connection.close();  
		        
		        response.sendRedirect(request.getContextPath()+"/GetFendianServlet");
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
