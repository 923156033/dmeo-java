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
    <title>管理员后台管理界面</title>
<!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="assets/css/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
   
    <script type="text/javascript">
    	function delete_admin(adminid){
    		if(confirm("您确定要删除该管理员吗？")){
    			location.href="${pageContext.request.contextPath }/DeleteAdminServlet?adminid="+adminid;
    			
    		}
    	}
		function edit_admin(adminid,adminname,adminpassword){
    		
    		document.getElementById("adminid").value=adminid;
    		document.getElementById("adminname").value=adminname;
    		document.getElementById("adminpassword").value=adminpassword;
    	}
    </script>
 
</head>
<body>
  <div id="wrapper">
        <div class="sidebar-collapse">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><strong><i class="icon fa fa-plane"></i> 管理员用户管理</strong></a>
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
                        <a href="#"><i class="fa fa-sitemap"></i> 用户管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                           <li>
                               <a href="${pageContext.servletContext.contextPath }/GetAdminServlet" >管理员</a>
                            </li>
                            <li>
                                <a href="${pageContext.servletContext.contextPath }/GetUserServlet" >买家</a>
                            </li>
                            <li>
                               <a href="${pageContext.servletContext.contextPath }/GetShopServlet" >商家</a>
                            </li>
                            
							</ul>
						</li>	
                   
                    


                    
                 
                </ul>

            </div>

        </nav>
        </div>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
		 
		
            <div id="page-inner"> 
               
            <div class="row">
             
                <div class="col-md-12">
                
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">
                             管理员列表
                             
                        </div>
                        
                        <div class="panel-body">
                        <button class="btn btn-success" data-toggle="modal" data-target="#myModal1">新增管理员</button>
                           
                            <div class="table-responsive">
                            
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>管理员id</th>
                                            <th>用户名</th>
                                           
                                            <th>密码</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyid">
                                    <c:forEach items="${AdminList }" var="u">
								
								<tr class="odd gradeX">
                                            <td  >  ${u.adminid }  </td>
                                            <td  >  ${u.adminname }  </td>
                                          <td  >  ${u.adminpassword }  </td>
                                            <td><button class="btn btn-primary"  data-toggle="modal" data-target="#myModal"
                                             onclick="edit_admin('${u.adminid }','${u.adminname }','${u.adminpassword }')" 
                                            ><i class="fa fa-edit "></i>编辑</button>
											<button class="btn btn-danger" onclick="delete_admin('${u.adminid }')"><i class="fa fa-pencil"></i> 删除</button></td>
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
            <!-- 编辑弹窗 -->
            
         <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">编辑管理员信息</h4>
					</div>
					<form action="EditAdminServlet">
					<div class="modal-body">
					
						<label style="width: 50px">id:</label><input type="text" readonly = "readonly" name="adminid" id="adminid"/>
						<label style="width: 50px">用户名:</label><input type="text" readonly = "readonly" name="adminname"id="adminname"/>
					   <br/> <label style="width: 50px">密码:</label><input type="password" name="adminpassword"  id="adminpassword">
					   
					    
		
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary" >保存更改</button>
					</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- 新增弹窗 -->
              <div id="myModal1" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">新增管理员</h4>
					</div>
					<form id="form1" action="AddAdminServlet" method="post" >
					<div class="modal-body">

						<label style="width: 50px">用户名:</label><input type="text"  name="adminname"id="adminname"/>
					    <label style="width: 50px">密码:</label><input type="password" name="adminpassword"  id="adminpassword"/>
					  
                            
					   
					    
		
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
                <!-- /. ROW  -->
        </div>
              
    </div>
    
             <!-- /. PAGE INNER  -->
            
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