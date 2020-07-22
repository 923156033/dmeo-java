<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">  
            var time = 4;  
            function returnUrlByTime() {    
                window.setTimeout('returnUrlByTime()', 1000);    
                time = time - 1;    
                if(time<=0){  
                    time = 0;  
             window.setTimeout("location.href='${pageContext.request.contextPath}/login.jsp';", 0);   
                }  
                document.getElementById("layer").innerHTML = time;    
            }    
        </script>  
<body onload="returnUrlByTime()">  
 <div >  
<a href="login.jsp" ><font size="5px" >恭喜您注册成功，<b><span id="layer">3</span></b>秒后会自动跳转登录界面，如果没有跳转，请点这里......</font></a></div>  
</body>  
</html>