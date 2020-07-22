package com.pzy.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		         HttpServletRequest servletRequest = (HttpServletRequest) request;
		         HttpServletResponse servletResponse = (HttpServletResponse) response;
		         HttpSession session = servletRequest.getSession();
		         String customerid=(String)session.getAttribute("customerid");
		         String shopid=(String)session.getAttribute("shopid");
		         String adminid=(String)session.getAttribute("adminid");
		         String path = servletRequest.getRequestURI();
		        
		         if(path.indexOf("/login.jsp") > -1) {
		        	 if(path.contains(".css") || path.contains(".js"))
		        	             {
		        		            chain.doFilter(servletRequest, servletResponse);
		        	                return;
		        	              }
		        	        }
		        
		         //防止点击登录回到登录界面
		         if(path.indexOf("/LoginServlet") > -1) {
    	             chain.doFilter(servletRequest, servletResponse);
    	              return;
    	        }
		         if(path.indexOf("/ChangePasswordServlet") > -1) {
    	             chain.doFilter(servletRequest, servletResponse);
    	              return;
    	        }
		         if(path.indexOf("/ChangePasswordSubmit") > -1) {
    	             chain.doFilter(servletRequest, servletResponse);
    	              return;
    	        }
		         if(path.indexOf("/GetQuestionServlet") > -1) {
    	             chain.doFilter(servletRequest, servletResponse);
    	              return;
    	        }
		         if(path.indexOf("/registercustomer.jsp") > -1) {
    	             chain.doFilter(servletRequest, servletResponse);
    	              return;
    	        }
		         if(path.indexOf("/registersuccess.jsp") > -1) {
    	             chain.doFilter(servletRequest, servletResponse);
    	              return;
    	        }
		         
		         if(path.indexOf("/changepassword.jsp") > -1) {
    	             chain.doFilter(servletRequest, servletResponse);
    	              return;
    	        }
		         if(path.indexOf("/RegisterCustomer") > -1) {
    	             chain.doFilter(servletRequest, servletResponse);
    	              return;
    	        }
		         if(path.indexOf("/RegisterNamecheck") > -1) {
    	             chain.doFilter(servletRequest, servletResponse);
    	              return;
    	        }
		         
		         
		         if ((customerid == null || "".equals(customerid))&&(shopid == null || "".equals(shopid))&&(adminid == null || "".equals(adminid)) ){
		        	              // 跳转到登陆页面
		        	              servletResponse.sendRedirect(servletRequest.getContextPath()+"/login.jsp");
		        	              
		        	     		  /*session.invalidate();*/
		        	          } 
		         else {
		        	              // 已经登陆,继续此次请求
		        	 if((path.indexOf("/LogoutServlet") > -1)) {
	    	             chain.doFilter(servletRequest, servletResponse);
	    	              return;
	    	        }
		        	
		        	 if(customerid != null){
		        	        		  if((path.indexOf("/GetCustomerMessageServlet") > -1)||
		        	        				  (path.indexOf("/GetShopNameServlet") > -1)||
		        	        				  (path.indexOf("/EditCustomerMessageServlet") > -1)||
		        	        				  (path.indexOf("/GetShopServlet") > -1)||
		        	        				  (path.indexOf("/AddRequestServlet") > -1)||
		        	        				  (path.indexOf("/DeleteMessageServlet") > -1)||
		        	        				  (path.indexOf("/GetGoodsServlet") > -1)||
		        	        				  (path.indexOf("/GetMessageServlet") > -1)||
		        	        				  (path.indexOf("/GetRequestServlet") > -1)||
		        	        				  (path.indexOf("/GetVipServlet") > -1)||
		        	        				  (path.indexOf("/customergoods.jsp") > -1)||
		        	        				  (path.indexOf("/customerindex.jsp") > -1)||
		        	        				  (path.indexOf("/customervip.jsp") > -1)||
		        	        				  (path.indexOf("/message.jsp") > -1)||
		        	        				  (path.indexOf("/request.jsp") > -1)) {
		 		        	             chain.doFilter(servletRequest, servletResponse);
		 		        	              return;
		 		        	        }
		        	        		  else
		        	        		  {
		        	        			  servletResponse.sendRedirect(servletRequest.getContextPath()+"/customerindex.jsp");
		        	        		  }
		        	        	  }
		        	        	  if(adminid != null){
		        	        		          if((path.indexOf("/AddAdminServlet") > -1)||
		        	        				  (path.indexOf("/AddShopServlet") > -1)||
		        	        				  (path.indexOf("/AddUserServlet") > -1)||
		        	        				  (path.indexOf("/DeleteAdminServlet") > -1)||
		        	        				  (path.indexOf("/DeleteShopServlet") > -1)||
		        	        				  (path.indexOf("/DeleteUserServlet") > -1)||
		        	        				  (path.indexOf("/EditAdminServlet") > -1)||
		        	        				  (path.indexOf("/EditShopServlet") > -1)||
		        	        				  (path.indexOf("/EditUserServlet") > -1)||
		        	        				  (path.indexOf("/GetAdminServlet") > -1)||
		        	        				  (path.indexOf("/GetShopServlet") > -1)||
		        	        				  (path.indexOf("/GetUserServlet") > -1)||
		        	        				  (path.indexOf("/admin.jsp") > -1)||
		        	        				  (path.indexOf("/customer.jsp") > -1)||
		        	        				  (path.indexOf("/shop.jsp") > -1)) {
		 		        	             chain.doFilter(servletRequest, servletResponse);
		 		        	              return;
		 		        	        }
		        	        		  else
		        	        		  {
		        	        			  servletResponse.sendRedirect(servletRequest.getContextPath()+"/admin.jsp");
		        	        		  }
		        	        	  }
		        	        	  if(shopid != null){
		        	        		  if((path.indexOf("/ChangeLevelServlet") > -1)||
		        	        				  (path.indexOf("/EditShopMessageServlet") > -1)||
		        	        				  (path.indexOf("/EditShopServlet") > -1)||
		        	        				  (path.indexOf("/AddFendianServlet") > -1)||
		        	        				  (path.indexOf("/AddshopVipServlet") > -1)||
		        	        				  (path.indexOf("/AgreeRequestServlet") > -1)||
		        	        				  (path.indexOf("/DealFenpeiShopServlet") > -1)||
		        	        				  (path.indexOf("/DeleteFendianGoodsServlet") > -1)||
		        	        				  (path.indexOf("/DeleteFendianServlet") > -1)||
		        	        				  (path.indexOf("/EditDiscountServlet") > -1)||
		        	        				  (path.indexOf("/GetCustomerNameServlet") > -1)||
		        	        				  (path.indexOf("/GetShopMessageServlet") > -1)||  
		        	        				  (path.indexOf("/GetFendianGoodsAjaxServlet") > -1)||
		        	        				  (path.indexOf("/GetFendianServlet") > -1)||
		        	        				  (path.indexOf("/GetShopGoodsAjaxServlet") > -1)||
		        	        				  (path.indexOf("/GetShopGoodsServlet") > -1)||
		        	        				  (path.indexOf("/GetShopRequestServlet") > -1)||
		        	        				  (path.indexOf("/GetshopVipServlet") > -1)||
		        	        				  (path.indexOf("/RefuseRequestServlet") > -1)||
		        	        				  (path.indexOf("/SendMessageServlet") > -1)||
		        	        				  (path.indexOf("/NameCheck") > -1)||
		        	        				  (path.indexOf("/shopindex.jsp") > -1)||
		        	        				  (path.indexOf("/editdiscount.jsp") > -1)||(path.indexOf("/fendian.jsp") > -1)||(path.indexOf("/shopgoods.jsp") > -1)||(path.indexOf("/shoprequest.jsp") > -1)||(path.indexOf("/shopvip.jsp") > -1)) {
		 		        	             chain.doFilter(servletRequest, servletResponse);
		 		        	              return;
		 		        	        }
		        	        		  else
		        	        		  {
		        	        			  servletResponse.sendRedirect(servletRequest.getContextPath()+"/shopvip.jsp");
		        	        		  }
		        	        	  }
		        	        	  
		        	        	  
		        	        	  
		        	          }
		        	          
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}



}
