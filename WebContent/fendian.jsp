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
    <title>我的分店</title>
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
    function delete_fendian(fendianid){
    	
    	if(confirm("您确定要删除该分店吗？")){
    		
    		location.href="${pageContext.request.contextPath }/DeleteFendianServlet?fendianid="+fendianid;
    	}
    }
    function delete_fendiangoods(fendianid,goodsid)
    {
        if(confirm("您确定要删除该分店的商品吗？")){
    		//alert(fendianid+","+goodsid);
        	location.href="${pageContext.request.contextPath }/DeleteFendianGoodsServlet?fendianid="+fendianid+"&goodsid="+goodsid;
    	}
    }
    function fendian_detail(fendianid)
    {
 	
    	var tbody=window.document.getElementById("tbody-result1");
    	tbody.innerHTML = "";
    	$.ajax({
    		url:"${pageContext.request.contextPath }/GetFendianGoodsAjaxServlet?fendianid="+fendianid,
    		dataType:"json",
    		async:false,
    		success:function(data){
    				//alert(data);
                 for(var i = 0;i<=data.length-1;i++ ){
                	var tr = document.createElement("tr");
        			var td1 = document.createElement("td");
        			var textnode1 = document.createTextNode(data[i].goodsid);
        			td1.appendChild(textnode1);
        			
        			var td2 = document.createElement("td");
        			var textnode2 = document.createTextNode(data[i].goodsname);
        			td2.appendChild(textnode2);
        			
        			var td3 = document.createElement("td");
        			var textnode3 = document.createTextNode(data[i].price);
        			td3.appendChild(textnode3);
        			
        			
        			
        			var td5 = document.createElement("td");
        			td5.innerHTML = "<button class='btn btn-danger' onclick='delete_fendiangoods("+fendianid+","+data[i].goodsid+")'> <i class='fa fa-pencil'></i> 删除</button>";
        			
        			tr.appendChild(td1);
        			tr.appendChild(td2);
        			tr.appendChild(td3);
        			
        			tr.appendChild(td5);
        			
        			tbody.appendChild(tr);
                }
    			
    		}
    		
    	});
    	}
    
    function get_shopgoods(fendianid,shopname)
    {
    	window.document.getElementById("shopid").value=fendianid;
    	window.document.getElementById("shopname").value=shopname;
    	var tbody=window.document.getElementById("tbody-result");
    	tbody.innerHTML = "";
    	$.ajax({
    		url:"${pageContext.request.contextPath }/GetShopGoodsAjaxServlet",
    		dataType:"json",
    		async:false,
    		success:function(data){
    		
                 for(var i = 0;i<=data.length-1;i++ ){
                	var tr = document.createElement("tr");
        			var td1 = document.createElement("td");
        			var textnode1 = document.createTextNode(data[i].goodsid);
        			td1.appendChild(textnode1);
        			
        			var td2 = document.createElement("td");
        			var textnode2 = document.createTextNode(data[i].goodsname);
        			td2.appendChild(textnode2);
        			
        			var td3 = document.createElement("td");
        			var textnode3 = document.createTextNode(data[i].price);
        			td3.appendChild(textnode3);
        			
        			
        			
        			var td5 = document.createElement("td");
        			var checkbox = document.createElement("input");
        			checkbox.type="checkbox";
        			checkbox.id=data[i].goodsid;
        			checkbox.name="choosegoods";
        			checkbox.value=data[i].goodsid
        			td5.appendChild(checkbox);
        			
        			tr.appendChild(td1);
        			tr.appendChild(td2);
        			tr.appendChild(td3);
        			
        			tr.appendChild(td5);
        			
        			tbody.appendChild(tr);
                }
    			
    		}
    		
    	});
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
        </div>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
		 
		
            <div id="page-inner"> 
               
            <div class="row">
             
                <div class="col-md-12">
                
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                    
                        <div class="panel-heading">
                             我的分店
                             
                        </div>
                        
                        <div class="panel-body">
                        <button class="btn btn-success" data-toggle="modal" data-target="#myModal1">新增分店</button>
                            <div class="table-responsive">
                            
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                          <th>分店id</th>
                                            <th>分店名</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyid">
                                    <c:forEach items="${ShopList  }" var="u">
								
								<tr class="odd gradeX">
                                           <td >   ${u.shopid } </td> 
                                            <td >   ${u.shopname } </td>
                                          
                                            <td><button class="btn btn-primary" onclick="get_shopgoods('${u.shopid }','${u.shopname }')" data-toggle="modal" data-target="#myModal" ><i class="fa fa-edit "></i>分配分店商品</button>
											<button class="btn btn-danger" onclick="delete_fendian('${u.shopid }')"><i class="fa fa-pencil"></i> 删除</button>
											<button class="btn btn-success" data-toggle="modal" data-target="#myModal2"  onclick="fendian_detail('${u.shopid }')"><i class="fa fa-pencil"></i> 详情</button></td>
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
             <!-- 详情弹窗 -->
               <div id="myModal2" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">分店商品详情</h4>
					</div>
					
					<div class="modal-body">
					
						<table class="table table-striped table-bordered table-hover" id="goods_table">
                                    <thead>
                                        <tr>
                                            <th>商品id</th>
                                            <th>商品名</th>
                                            <th>价格</th>
                                           
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody-result1">
                                    
                                    </tbody>
						
						</table>
					    
					
					    
		
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						
					</div>
					
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		 <!-- 结束详情弹窗 -->
            <!-- 分配商品弹窗 -->
            
         <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">分配商品</h4>
					</div>
					<form action="DealFenpeiShopServlet" method="get">
					<div class="modal-body">
					
						<input type="hidden" id="shopid" name="shopid">
						<input type="hidden" id="shopname" name="shopname">
						<table class="table table-striped table-bordered table-hover" id="goods_table">
                                    <thead>
                                        <tr>
                                            <th>商品id</th>
                                            <th>商品名</th>
                                            <th>价格</th>
                                            <th>选择</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody-result">
                                    
                                    </tbody>
						
						</table>
					    
					
					    
		
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary" >分配</button>
					</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- 结束分配商品弹窗 -->
		<!-- 新增分店弹窗 -->
              <div id="myModal1" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">新增分店</h4>
					</div>
					<form name="form1" id="form1" action="AddFendianServlet" method="post" >
					<div class="modal-body">

						
						<input type="text"  name="shopname" id="shopname" placeholder="请输入分店名">
					    
                       <br/> <input type="text"  name="shoppassword" id="shoppassword" placeholder="请输入密码">
                        <br/> <select name="question">
                        <option value="0">请选择密保问题</option>
                        <option value="1">我最喜欢的食物是？</option>
                        <option value="2">我最尊敬的人是？</option>
                        <option value="3">我的名字是？</option>
                         	
                        
                   </select>      
                       <br/> <input type="text"  name="answer" id="answer" placeholder="请输入密保答案">          
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
		<!-- 结束新增分店弹窗 -->
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