<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<link href="assets/logincss/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="assets/logincss/style.css">
<link rel="stylesheet" type="text/css" href="assets/logincss/userpanel.css">
<link rel="stylesheet" type="text/css" href="assets/logincss/jquery.ui.all.css">
</head>
<body class="login" mycollectionplug="bind">
<div class="login_m">

<div ><h1 style="font-size: 40px">微商城用户管理子系统</h1><div>
<div class="" style="height:20px">&nbsp<div>
<div class="login_boder">
<div class="login_padding" id="login_model">
<form action="LoginServlet" method="post">
  <h2>用户名</h2>
  <label>
    <input type="text" name="username" class="txt_input txt_input2"  placeholder="请输入用户名">
  </label>
  <h2>密码</h2>
  <label>
    <input type="password" name="password"  class="txt_input" placeholder="请输入密码">
  </label>
  
  <p class="forgot"><a id="iforget" href="registercustomer.jsp">注册</a>&nbsp;&nbsp;<a id="iforget" href="changepassword.jsp">忘记密码？</a></p>
  <div class="rem_sub">
  <div class="rem_sub_l">
  <input type="radio" name="logintype" value="1" checked>
   <label for="radio">买家</label>
   <input type="radio" name="logintype" value="2">
   <label for="radio">商家</label>
   <input type="radio" name="logintype" value="3">
   <label for="radio">管理员</label>
   </div>
    <label>
      <input type="submit" class="sub_button" name="button" id="button" value="登录" style="opacity: 0.7;">
    </label>
  </div>
  </form>
</div>
</div><!--login_boder end-->
</div><!--login_m end-->
</body>
</html>