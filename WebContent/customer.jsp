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
    <title>买家后台管理界面</title>
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
    	function delete_customer(customerid){
    		if(confirm("您确定要删除该买家吗？")){
    			location.href="${pageContext.request.contextPath }/DeleteUserServlet?customerid="+customerid;
    		}
    	}
		function edit_customer(customerid,customername,customerpassword){
    		
    		document.getElementById("customerid").value=customerid;
    		document.getElementById("customername").value=customername;
    		document.getElementById("customerpassword").value=customerpassword;
    		


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
                <a class="navbar-brand" href="#"><strong><i class="icon fa fa-plane"></i> 买家用户管理</strong></a>
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
                             用户列表
                             
                        </div>
                        
                        <div class="panel-body">
                        <button class="btn btn-success" data-toggle="modal" data-target="#myModal1">新增买家</button>
                            <div class="table-responsive">
                            
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>买家id</th>
                                            <th>买家用户名</th>
                                            
                                             <th>买家密码</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyid">
                                    <c:forEach items="${customerList }" var="u">
								
								<tr class="odd gradeX">
                                            <td  >  ${u.customerid }  </td>
                                            <td  >  ${u.customername }  </td>
                                            <td  >  ${u.customerpassword }  </td>
                                            <td><button class="btn btn-primary"  data-toggle="modal" data-target="#myModal"
                                             onclick="edit_customer('${u.customerid }','${u.customername }','${u.customerpassword }')" 
                                            ><i class="fa fa-edit "></i>编辑</button>
											<button class="btn btn-danger" onclick="delete_customer('${u.customerid }')"><i class="fa fa-pencil"></i> 删除</button></td>>
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
						<h4 class="modal-title">编辑买家信息</h4>
					</div>
					<form action="EditUserServlet">
					<div class="modal-body">
					
						<label style="width: 50px">id:</label><input type="text" readonly = "readonly" name="customerid" id="customerid"/>
						<label style="width: 50px">用户名:</label><input type="text" readonly = "readonly" name="customername"id="customername"/>
					    <br/><label style="width: 50px">密码:</label><input type="password" name="customerpassword"  id="customerpassword">
					   
					    
		
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
						<h4 class="modal-title">新增买家</h4>
					</div>
					<form id="form1" action="AddUserServlet" method="post" >
					<div class="modal-body">

						<label style="width: 90px">买家用户名:</label><input type="text"  placeholder="请输入用户名" name="customername"id="customername"/>
					    <br/><label style="width: 90px">密码:</label><input type="password" placeholder="请输入密码" name="customerpassword"  id="customerpassword"/>
					  <br/> <label style="width: 90px">密保问题:</label> <select name="question" style="width:180px;height:26px">
                        <option value="请选择密保问题">请选择密保问题</option>
                        <option value="我最喜欢的食物是？">我最喜欢的食物是？</option>
                        <option value="我最尊敬的人是？">我最尊敬的人是？</option>
                        <option value="我的名字是？">我的名字是？</option>
                         
                        
                   </select>     
                       <br/> <label style="width: 90px">	答案: </label><input type="text"  name="answer" id="answer" placeholder="请输入密保答案">
                           
					    
		
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