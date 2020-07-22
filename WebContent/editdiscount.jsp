<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0" />
 <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- Morris Chart Styles-->
   
        <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
<title>编辑折扣</title>
</head>
<body>
      <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href=""><strong><i class="icon fa fa-plane"></i> 商家后台管理</strong></a>
				<div id="sideNav" href="">
		<i class="fa fa-bars icon"></i> 
		</div>
            </div>

           <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                         <li><a href="shopindex.jsp"><i class="fa fa-user fa-fw"></i> 用户信息</a>
                        </li>
                        
                        <li class="divider"></li>
                        <li><a href="${pageContext.servletContext.contextPath }/LogoutServlet"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    
                   
					<li>
                        <a href="#"><i class="fa fa-sitemap"></i> 会员管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                              <a href="${pageContext.servletContext.contextPath }/GetshopVipServlet" >本店会员 </a>
                                
                            </li>
                           <li>
                            <a href="${pageContext.servletContext.contextPath }/GetShopRequestServlet" >会员申请记录 </a>
                           </li>
                            <li>
                                <a href="editdiscount.jsp" >会员折扣</a>
                            </li>
							</ul>
						</li>	
						
						
					<li>
                        <a href="#"><i class="fa fa-qrcode"></i> 我的分店<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                              <a href="${pageContext.servletContext.contextPath }/GetFendianServlet" >分店列表 </a>
                                
                            </li>
        
							</ul>
						</li>		
                   
                     <li>
                        <a href="${pageContext.servletContext.contextPath }/GetShopGoodsServlet" ><i class="fa fa-qrcode"></i> 本店商品</a>
                    </li>
               
                   
                   


                    
                  
                </ul>

            </div>

        </nav>
         
		 
		<div id="page-wrapper" >
		 
		
            <div id="page-inner"> 
               
            <div class="row">
             
                <div class="col-md-12">
                
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">
                             会员折扣
                             
                        </div>
                        
                        <div class="panel-body">
                        <form action="EditDiscountServlet">
                                  <div class="sub-title">钻石会员</div>
                                    <div>
                                        <select name="maxdiscount"class="selectbox">
                                            
                                            
                                                <option value="0.1">1折</option>
                                                <option value="0.2">2折</option>
                                                <option value="0.3">3折</option>
                                                <option value="0.4">4折</option>
                                                <option value="0.5"selected="selected">5折</option>
                                                <option value="0.6">6折</option>
                                                <option value="0.7">7折</option>
                                                <option value="0.8">8折</option>
                                                <option value="0.9">9折</option>
                                                <option value="1.0">10折</option>
                                                
                                         
                                            
                                        </select>
                                    </div>
                                    <div class="sub-title">白金会员</div>
                                    <div>
                                        <select name="middiscount"class="selectbox">
                                            
                                           
                                                <option value="0.1">1折</option>
                                                <option value="0.2">2折</option>
                                                <option value="0.3">3折</option>
                                                <option value="0.4">4折</option>
                                                <option value="0.5">5折</option>
                                                <option value="0.6"selected="selected">6折</option>
                                                <option value="0.7">7折</option>
                                                <option value="0.8">8折</option>
                                                <option value="0.9">9折</option>
                                                <option value="1.0">10折</option>
                                                
                                          
                                            
                                        </select>
                                    </div>
                                    <div class="sub-title">黄金会员</div>
                                    <div>
                                        <select name="mindiscount"class="selectbox">
                                            
                                           
                                                <option value="0.1">1折</option>
                                                <option value="0.2">2折</option>
                                                <option value="0.3">3折</option>
                                                <option value="0.4">4折</option>
                                                <option value="0.5">5折</option>
                                                <option value="0.6">6折</option>
                                                <option value="0.7" selected="selected">7折</option>
                                                <option value="0.8">8折</option>
                                                <option value="0.9">9折</option>
                                                <option value="1.0">10折</option>
                                                
                                          
                                            
                                        </select>
                                    </div>
                                     
                                    
                                    <div>
                                        
                                        <button type="submit" class="btn btn-default">保存更改</button>
                                    </div>
                                   
 </form>
                           
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>     
            </div>
                <!-- /. ROW  -->
        </div>
</div>
 <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
         <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
</body>
</html>