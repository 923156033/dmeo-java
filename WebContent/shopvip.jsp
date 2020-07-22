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
    <title>商家后台界面</title>
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
</head>
<script type="text/javascript">
var xmlHttp;
function createXMLHttpRequest(){
 if(window.ActiveXObject){
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
 }
 else if(window.XMLHttpRequest){
  xmlHttp=new XMLHttpRequest();
 }
}

function startRequest(){
 createXMLHttpRequest();
 xmlHttp.onreadystatechange=handleStateChange;
 xmlHttp.open("POST","NameCheck?name="+form1.customername.value,true);
 xmlHttp.send(null);
}

function handleStateChange(){
 if(xmlHttp.readyState==4){
  if(xmlHttp.status==200){
   document.getElementById("nameCheck").innerHTML=xmlHttp.responseText;
  }
 }
}
</script>
<script type="text/javascript">
function tianchong(customerid,customername){
	document.getElementById("customerid").value=customerid;
	document.getElementById("customername1").value=customername;
	
}
</script>
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
                             本店会员
                             
                        </div>
                        
                       <div class="panel-body">
                        <button class="btn btn-success" data-toggle="modal" data-target="#myModal1">新增会员</button>
                            <div class="table-responsive">
                           
                           <form action="SendMessageServlet">  
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>会员id</th>
                                            <th>会员用户名</th>
                                            <th>折扣</th>
                                            <th>会员等级</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody-result">
                                    <c:forEach items="${ShopVipList }" var="u">
								
								<tr class="odd gradeX">
								            <td  >  <input type="checkbox" name="customerid" value="${u.customerid }" />${u.customerid }  </td>
                                            <td  >  ${u.customername }  </td>
                                            <td >   ${u.discount } </td> 
                                            <td >   ${u.level } </td>
                                            <td><button class="btn btn-primary" data-toggle="modal" type="button" data-target="#myModal" onclick="tianchong('${u.customerid }','${u.customername }')"><i class="fa fa-edit "></i>修改会员等级</button></td>	
                                      </tr>
							</c:forEach>
                                    </tbody>
                                </table>
                                 
                                    <div class="sub-title">营销信息</div>
                                    <div>
                                        <textarea class="form-control" name="message"rows="3"></textarea>
                                        <button type="submit" class="btn btn-default">发送</button>
                                    </div>
                                     
                                   
                                </form> 
                                
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>     
         
         
           <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
			
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">更改会员等级</h4>
					</div>
					<form  action="ChangeLevelServlet" method="post" >
					<div class="modal-body">

						
						<label style="width: 50px">id:</label><input type="text" readonly = "readonly" name="customerid" id="customerid"/>
						<label style="width: 50px">用户名:</label><input type="text" readonly = "readonly" name="customername1"id="customername1"/>
					   <br/> <label style="width: 50px">等级:</label>
                                            <input type="radio" id="radio1" name="level1" value="钻石会员" checked>
                                            <label for="radio4">
                                             钻石会员
                                            </label>
                                        
					  
                                            <input type="radio" id="radio1" name="level1" value="白金会员" >
                                            <label for="radio3">
                                              白金会员
                                            </label>
                                          
                                           
                                            <input type="radio" id="radio1" name="level1" value=" 黄金会员">
                                            <label for="radio5">
                                              黄金会员
                                            </label>
                                          
                            
                            
					   
					    
		
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
						<h4 class="modal-title">新增会员</h4>
					</div>
					<form name="form1" id="form1" action="AddshopVipServlet" method="post" >
					<div class="modal-body">
                    <div class="dropdown">
						<label style="width: 50px">用户名:</label><input type="text"  name="customername" id="customername" 
						class="dropdown-toggle" data-toggle="dropdown" onBlur="startRequest()"/>
						<ul id="menu-ul" class="dropdown-menu" role="menu" 
										aria-labelledby="dropdownMenu1" style="display:none; margin-left: 50px;">
										
										
									</ul>
									</div>
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
                            
                            
					  
					    
		
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary" >添加</button>
						
					</div>
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
   	var allcustomername;
  	  
    	$('#customername').bind('input propertychange', function() {  
    		console.log($(this).val());
    		if($(this).val()!='')
    			serach_customername($(this).val())
    			else
    			$('#menu-ul').hide()
    	});  
	   function serach_customername(str)
	   {
		   var dest = []
		   if(allcustomername!=''&&allcustomername!=null)
		   {
		   		for(var i in allcustomername)
		   			{
		   				if(allcustomername[i].customername.indexOf(str)!=-1)
		   					{
		   					console.log(allcustomername[i].customername)
		   					dest.push(allcustomername[i].customername)
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
						   txt +='<a role="menuitem" tabindex="-1" onclick="showcustomername(\''+dest[i]+'\')">'+dest[i]+'</a></li>'
					   }
			   	 $('#menu-ul').empty();
			   	 $('#menu-ul').append(txt);
			   }
	   }
	   function showcustomername(str)
	   {
		   $('#menu-ul').hide();
		   $('#customername').val(str);
	   }
    function get_customername()
    {
 	
    
    	$.ajax({
    		url:"${pageContext.request.contextPath }/GetCustomerNameServlet" ,
    		dataType:"json",
    		async:false,
    		success:function(data){
    				//alert(data);
    			if(data!=''&&data!=null)
    				allcustomername = data;
               console.log(data)
    		}
    		
    	});
    	}
    get_customername()
 

    
    </script>
   
</body>
</html>