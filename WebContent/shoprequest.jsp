<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta content="" name="description" />
    <meta content="webthemez" name="author" />
    <title>处理会员申请</title>
	<!-- Bootstrap Styles-->
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
    <script type="text/javascript">
    	function agreerequest(customerid,customername,shopid,shopname,level){
    		
    			location.href="${pageContext.request.contextPath }/AgreeRequestServlet?customerid="+customerid+
    					"&customername="+customername+"&shopid="+shopid+"&shopname="+shopname+"&level="+level;
    			var canClick = true;
    			document.getElementById("agree").disabled=true;;
    			
    	}
		function refuserequest(customerid,shopid,level){
    		
			location.href="${pageContext.request.contextPath }/RefuseRequestServlet?customerid="+customerid+
			"&shopid="+shopid+"&level="+level;
			
			document.getElementById("refuse").disabled=true;;
			
    	}
    </script>
    
</head>
<body>
 <div id="wrapper">
             <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><strong><i class="icon fa fa-plane"></i> 商家后台管理</strong></a>
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
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
		 
		
            <div id="page-inner"> 
               
            <div class="row">
             
                <div class="col-md-12">
                
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">
                             会员申请记录
                             
                        </div>
                        
                        <div class="panel-body">
                        
                            <div class="table-responsive">
                            
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            
                                            <th>用户名</th>
                                            <th>申请会员等级</th>
                                            <th>审核状态</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyid">
                                    <c:forEach items="${RequestList }" var="u">
								
								<tr class="odd gradeX">
								           
                                            <td  >  ${u.customername }  </td>
                                            <td >   ${u.level } </td> 
                                            <td >   ${u.state } </td>	
                                            <td><button class="btn btn-success" id="agree" onclick="agreerequest('${u.customerid }','${u.customername }','${u.shopid }','${u.shopname }','${u.level }')"><i class="fa fa-pencil"></i> 同意</button>
                                            <button class="btn btn-danger" id="refuse" onclick="refuserequest('${u.customerid }','${u.shopid }','${u.level }')"><i class="fa fa-pencil"></i> 拒绝</button></td>
                                      </tr>
							</c:forEach>
                                    </tbody>
                                </table>
                                
                                    
                                
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>     
            </div>
                <!-- /. ROW  -->
        </div>
       		<!-- 新增弹窗 -->
              <div id="myModal1" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">Modal title</h4>
					</div>
					<form name="form1" id="form1" action="AddshopVipServlet" method="post" >
					<div class="modal-body">

						<label style="width: 50px">用户名:</label><input type="text"  name="customername" id="customername" onBlur="startRequest()"/>
						<span id="nameCheck"></span><br/>
					    <label style="width: 50px">等级:</label> <div class="radio3 radio-check radio-inline">
                                            <input type="radio" id="radio4" name="level" value="钻石会员" checked>
                                            <label for="radio4">
                                             钻石会员
                                            </label>
                                          </div>
					     <div class="radio3 radio-check radio-inline">
                                            <input type="radio" id="radio4" name="level" value="白金会员" >
                                            <label for="radio3">
                                              白金会员
                                            </label>
                                          </div>
                                           <div class="radio3 radio-check radio-inline">
                                            <input type="radio" id="radio4" name="level" value=" 黄金会员">
                                            <label for="radio5">
                                              黄金会员
                                            </label>
                                          </div>
                            
                            
					   
					    
		
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary" >添加</button>
					</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>       
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
     
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