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
import com.pzy.domain.Goods;
import com.pzy.domain.GoodsDiscount;
import com.pzy.domain.Vip;

/**
 * Servlet implementation class GetGoodsServlet
 */
@WebServlet("/GetGoodsServlet")
public class GetGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetGoodsServlet() {
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
        
        //获取连接
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd+"&useUnicode=true&characterEncoding=UTF8";  
        try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			 Connection connection = (Connection) DriverManager.getConnection(url);  
		        Statement statement = (Statement) connection.createStatement(); 
		        Statement statement1 = (Statement) connection.createStatement(); 
		       
		        String sql = "SELECT * FROM goods where childgoods='1'"; 
		        ResultSet rs = statement.executeQuery(sql); 
		        List<Goods> GoodsList = new ArrayList<Goods>();
		        
		        while(rs.next()){
		        	Goods u = new Goods();
		        	u.setGoodsid(rs.getString(1));
		        	u.setGoodsname(rs.getString(2));
		        	u.setShopid(rs.getString(3));	
		        	
		        	u.setPrice(rs.getDouble(4));
		        	u.setImg(rs.getString(5));
		        	u.setShopname(rs.getString(7));
		        	GoodsList.add(u);
		        }
		        //
		        String sql1 = "SELECT * FROM vip where customerid='"+customerid+"'";  
		        List<Vip> VipList = new ArrayList<Vip>();
		        ResultSet rs1 = statement1.executeQuery(sql1); 
		        while(rs1.next()){
		        	Vip u1 = new Vip();
		        	u1.setShopid(rs1.getString(1));
		        	u1.setCustomerid(rs1.getString(2));
		        	u1.setShopname(rs1.getString(3));	
		        	u1.setDiscount(rs1.getDouble(4));	
		        	u1.setLevel(rs1.getString(5));	
		        	u1.setCustomername(rs1.getString(6));	 
		        	VipList.add(u1);
		        }
		        List<GoodsDiscount> GoodsDiscountList = new ArrayList<GoodsDiscount>();
		        for (Goods Goods : GoodsList) {
		        	GoodsDiscount gd = new GoodsDiscount();
		        	if(VipList.size()!=0){
		        		for (Vip vip : VipList) {
			        		
			        		if(Goods.getShopid().equals(vip.getShopid())){
			        			Double discountprice = Goods.getPrice() * vip.getDiscount();
			        			gd.setDiscountprice(discountprice);
			        			break;
			        		}
			        		else{
			        			gd.setDiscountprice(Goods.getPrice());
			        		}
						}
		        	}
		        	else{
		        		gd.setDiscountprice(Goods.getPrice());
		        	}
		        	
		        	gd.setGoodsid(Goods.getGoodsid());
		        	gd.setGoodsname(Goods.getGoodsname());
		        	gd.setShopid(Goods.getShopid());	
		        	gd.setPrice(Goods.getPrice());
		        	gd.setImg(Goods.getImg());
		        	gd.setShopname(Goods.getShopname());
		        	GoodsDiscountList.add(gd);
				}
		        request.getSession().setAttribute("GoodsDiscountList", GoodsDiscountList);
		        request.getRequestDispatcher("customergoods.jsp").forward(request, response);
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
