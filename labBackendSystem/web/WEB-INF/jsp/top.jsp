<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0;">
            <div class="navbar-header">
                
                <!--<a class="navbar-brand" href="index.html">后台管理界面</a>-->
                <font class="navbar-brand" href="#" >实验室预约系统</font>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links  pull-right"">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw" ></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                    
                    	<c:if test="${empty user }">
	                    	<li><a href="/login/view.action"><i class="fa fa-user fa-fw"></i> 登录</a>
	                        </li>
	                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a>
	                        </li>
                    	</c:if>
                    	
                    	<c:if test="${!empty user }">
	                    	<li><a href="#"><i class="fa fa-user fa-fw"></i> ${user.user_name }</a>
	                        </li>
	                        <li><a href="/front/updatePasswordView.action"><i class="fa fa-gear fa-fw"></i> 设置</a>
	                        </li>
	                        <li class="divider"></li>
	                        <li><a href="/login/userLogout.action"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
	                        </li>
                    	</c:if>
                        
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
</body>
</html>