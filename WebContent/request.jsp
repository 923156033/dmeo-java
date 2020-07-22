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
    <title>会员申请</title>
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
                 <a class="navbar-brand" href=""><strong><i class="icon fa fa-plane"></i> 买家后台</strong></a>
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
                        <li><a href="customerindex.jsp"><i class="fa fa-user fa-fw"></i> 用户信息</a>
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
                        <a href="${pageContext.servletContext.contextPath }/GetVipServlet" >我的会员 </a>
						</li>	
						 <li>
                        <a href="${pageContext.servletContext.contextPath }/GetRequestServlet" >我的会员申请 </a>
						</li>	
						</ul>	
						</li>
                    <li>
                        <a href="${pageContext.servletContext.contextPath }/GetMessageServlet" ><i class="fa fa-qrcode"></i> 优惠信息</a>
                    </li>
               
                   
                    <li>
                        <a href="${pageContext.servletContext.contextPath }/GetGoodsServlet" ><i class="fa fa-desktop"></i> 商品列表</a>
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
                             我的会员申请
                             
                        </div>
                        
                        <div class="panel-body">
                        
                            <div class="table-responsive">
                            
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>商家名</th>
                                            <th>申请会员等级</th>
                                            <th>申请状态</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyid">
                                    <c:forEach items="${RequestList }" var="u">
								
								<tr class="odd gradeX">
                                            <td  >  ${u.shopname }  </td>  
                                            <td >   ${u.level } </td>	
                                            <td >   ${u.state } </td>	
                                      </tr>
							</c:forEach>
                                   
                                    </tbody>
                                </table>
                                
                                <form action="AddRequestServlet" method="post">
                                <div class="panel-body">
                                    <div class="sub-title">会员申请</div>
                                    <div class="dropdown">
                                    <label style="width: 50px">商家名:</label><input type="text"  name="shopname" id="shopname" class="dropdown-toggle" 
			data-toggle="dropdown" />
                                    
                                    <ul id="menu-ul" class="dropdown-menu" role="menu" 
										aria-labelledby="dropdownMenu1" style="display:none; margin-left: 50px;">
										
										
									</ul>
                                  </div>
                                    <br/>
                                    <div>
                                       <br/>
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
                                        <button type="submit" class="btn btn-default">发送请求</button>
                                    </div>
                                    </div> 
                                </form>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>     
            </div>
                <!-- /. ROW  -->
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
    <script type="text/javascript">
   	var allshopname;
  	  
    	$('#shopname').bind('input propertychange', function() {  
    		console.log($(this).val());
    		if($(this).val()!='')
    			serach_shopname($(this).val())
    			else
    			$('#menu-ul').hide()
    	});  
	   function serach_shopname(str)
	   {
		   var dest = []
		   if(allshopname!=''&&allshopname!=null)
		   {
		   		for(var i in allshopname)
		   			{
		   				if(allshopname[i].shopname.indexOf(str)!=-1)
		   					{
		   					console.log(allshopname[i].shopname)
		   					dest.push(allshopname[i].shopname)
		   					}
		   			}
		   }
		   console.log(dest)
		   if(dest!=''&&dest.length!=0)
			   {
			   	   $('#menu-ul').show()
			   	   var txt =''
				   for(var i in dest)
					   {
					   txt +='<li role="presentation">'
						   txt +='<a role="menuitem" tabindex="-1" onclick="showshopname(\''+dest[i]+'\')">'+dest[i]+'</a></li>'
					   }
			   	 $('#menu-ul').empty();
			   	 $('#menu-ul').append(txt);
			   }
	   }
	   function showshopname(str)
	   {
		   $('#menu-ul').hide();
		   $('#shopname').val(str);
	   }
    function get_shopname()
    {
 	
    
    	$.ajax({
    		url:"${pageContext.request.contextPath }/GetShopNameServlet" ,
    		dataType:"json",
    		async:false,
    		success:function(data){
    				//alert(data);
    			if(data!=''&&data!=null)
    				allshopname = data;
               console.log(data)
    		}
    		
    	});
    	}
    get_shopname()
 

    
    </script>
   
</body>
</html>