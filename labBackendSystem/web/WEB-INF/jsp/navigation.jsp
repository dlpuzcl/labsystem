<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
     style="margin-bottom: 0; background-color: #337ab7">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span> <span
                class="icon-bar"></span> <span class="icon-bar"></span> <span
                class="icon-bar"></span>
        </button>
        <!--<a class="navbar-brand" href="index.html">后台管理界面</a>-->
        <font class="navbar-brand" href="#"
              style="color: white; font-size: 20px;">后台管理界面</font>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <%--<li class="dropdown"><a class="dropdown-toggle"--%>
        <%--data-toggle="dropdown" href="#" style="background-color: #337ab7;">--%>
        <%--<i class="fa fa-envelope fa-fw" style="color: gainsboro;"></i> <i--%>
        <%--class="fa fa-caret-down" style="color: gainsboro;"></i>--%>
        <%--</a>--%>
        <%--<ul class="dropdown-menu dropdown-messages">--%>
        <%--<li><a href="#">--%>
        <%--<div>--%>
        <%--<strong>臧成龙</strong> <span class="pull-right text-muted">--%>
        <%--<em>昨天</em>--%>
        <%--</span>--%>
        <%--</div>--%>
        <%--<div>成功预约了第七周7-8节课</div>--%>
        <%--</a></li>--%>
        <%--<li class="divider"></li>--%>
        <%--<li><a href="#">--%>
        <%--<div>--%>
        <%--<strong>史伟志</strong> <span class="pull-right text-muted">--%>
        <%--<em>昨天</em>--%>
        <%--</span>--%>
        <%--</div>--%>
        <%--<div>我看见你了，你别走！</div>--%>
        <%--</a></li>--%>
        <%--<li class="divider"></li>--%>
        <%--<li><a href="#">--%>
        <%--<div>--%>
        <%--<strong>张铁腾</strong> <span class="pull-right text-muted">--%>
        <%--<em>昨天</em>--%>
        <%--</span>--%>
        <%--</div>--%>
        <%--<div>哈哈哈，我要飞的更高</div>--%>
        <%--</a></li>--%>
        <%--<li class="divider"></li>--%>
        <%--<li><a class="text-center" href="#"> <strong>阅读更多的信息</strong>--%>
        <%--<i class="fa fa-angle-right"></i>--%>
        <%--</a></li>--%>
        <%--</ul> <!-- /.dropdown-messages --></li>--%>

        <%--<!-- /.dropdown -->--%>
        <%--<li class="dropdown"><a class="dropdown-toggle"--%>
        <%--data-toggle="dropdown" href="#" style="background-color: #337ab7;">--%>
        <%--<i class="fa fa-tasks fa-fw" style="color: gainsboro;"></i> <i--%>
        <%--class="fa fa-caret-down" style="color: gainsboro;"></i>--%>
        <%--</a>--%>
        <%--<ul class="dropdown-menu dropdown-tasks">--%>
        <%--<li><a href="#">--%>
        <%--<div>--%>
        <%--<p>--%>
        <%--<strong>Task 1</strong> <span class="pull-right text-muted">40%--%>
        <%--Complete</span>--%>
        <%--</p>--%>
        <%--<div class="progress progress-striped active">--%>
        <%--<div class="progress-bar progress-bar-success"--%>
        <%--role="progressbar" aria-valuenow="40" aria-valuemin="0"--%>
        <%--aria-valuemax="100" style="width: 40%">--%>
        <%--<span class="sr-only">40% Complete (success)</span>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</a></li>--%>
        <%--<li class="divider"></li>--%>
        <%--<li><a href="#">--%>
        <%--<div>--%>
        <%--<p>--%>
        <%--<strong>Task 2</strong> <span class="pull-right text-muted">20%--%>
        <%--Complete</span>--%>
        <%--</p>--%>
        <%--<div class="progress progress-striped active">--%>
        <%--<div class="progress-bar progress-bar-info" role="progressbar"--%>
        <%--aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"--%>
        <%--style="width: 20%">--%>
        <%--<span class="sr-only">20% Complete</span>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</a></li>--%>
        <%--<li class="divider"></li>--%>
        <%--<li><a href="#">--%>
        <%--<div>--%>
        <%--<p>--%>
        <%--<strong>Task 3</strong> <span class="pull-right text-muted">60%--%>
        <%--Complete</span>--%>
        <%--</p>--%>
        <%--<div class="progress progress-striped active">--%>
        <%--<div class="progress-bar progress-bar-warning"--%>
        <%--role="progressbar" aria-valuenow="60" aria-valuemin="0"--%>
        <%--aria-valuemax="100" style="width: 60%">--%>
        <%--<span class="sr-only">60% Complete (warning)</span>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</a></li>--%>
        <%--<li class="divider"></li>--%>
        <%--<li><a href="#">--%>
        <%--<div>--%>
        <%--<p>--%>
        <%--<strong>Task 4</strong> <span class="pull-right text-muted">80%--%>
        <%--Complete</span>--%>
        <%--</p>--%>
        <%--<div class="progress progress-striped active">--%>
        <%--<div class="progress-bar progress-bar-danger"--%>
        <%--role="progressbar" aria-valuenow="80" aria-valuemin="0"--%>
        <%--aria-valuemax="100" style="width: 80%">--%>
        <%--<span class="sr-only">80% Complete (danger)</span>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</a></li>--%>
        <%--<li class="divider"></li>--%>
        <%--<li><a class="text-center" href="#"> <strong>See--%>
        <%--All Tasks</strong> <i class="fa fa-angle-right"></i>--%>
        <%--</a></li>--%>
        <%--</ul> <!-- /.dropdown-tasks --></li>--%>
        <!-- /.dropdown -->

        <!-- /.dropdown -->
        <li class="dropdown"><a class="dropdown-toggle"
                                data-toggle="dropdown" href="#" style="background-color: #337ab7;">
            <i class="fa fa-user fa-fw" style="color: gainsboro;"></i> <i
                class="fa fa-caret-down" style="color: gainsboro;"></i>
        </a>
            <ul class="dropdown-menu dropdown-user">

                <c:if test="${empty admini }">
                    <li><a href=""><i class="fa fa-user fa-fw"></i> 登录</a></li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a></li>
                </c:if>

                <c:if test="${!empty admini }">
                    <li><a href="${pageContext.request.contextPath }/admini/edit.action?id=${admini.admini_id}"><i
                            class="fa fa-user fa-fw"></i>
                            ${admini. admini_name}</a></li>
                    <li><a href="${pageContext.request.contextPath }/admini/updatePasswordView.action">
                        <i class="fa fa-gear fa-fw"></i> 设置</a></li>
                    <li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath }/login/adminiLogout.action"><i
                            class="fa fa-sign-out fa-fw"></i>
                        注销</a></li>
                </c:if>

            </ul> <!-- /.dropdown-user --></li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <div class="user-panel" style="margin-top: 13px;">
                <a href="/admini/first.action">
                    <img src="<%=basePath%>img/user/b631.jpg" class="img-circle center-block"
                         height="130px"/>
                </a>
            </div>

            <ul class="nav" id="side-menu" style="text-align: center;">

                <li style="padding: 7px;">
                    <!-- /input-group -->
                </li>
                <li><a href="/admini/first.action"><i
                        class="fa fa-dashboard fa-fw"></i> 主页</a></li>
                <li><a href="#"><i class="fa fa-users fa-fw"></i> 用户管理<span
                        class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a
                                href="${pageContext.request.contextPath }/user/addview.action">用户添加</a>
                        </li>

                        <li><a
                                href="${pageContext.request.contextPath }/user/list.action">教师管理</a>
                        </li>
                    </ul> <!-- /.nav-second-level --></li>

                <li><a href="#"><i class="fa fa-institution fa-fw"></i>
                    实验室管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="${pageContext.request.contextPath }/lab/addview.action">实验室添加</a>
                        </li>
                        <li><a
                                href="${pageContext.request.contextPath}/lab/list.action">实验室管理</a>
                        </li>
                    </ul>
                </li>

                <li><a href="#"><i class="fa fa-calendar fa-fw"></i>
                    课程管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <%--<li><a href="${pageContext.request.contextPath }/lab/addview.action">课程添加</a>--%>
                        <%--</li>--%>
                        <li><a
                                href="${pageContext.request.contextPath}/course/list.action">课程管理</a>
                        </li>

                    </ul>
                </li>

                <li><a href="#"><i class="fa fa-tasks fa-fw"></i>
                    教室预约<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a
                                href="${pageContext.request.contextPath }/apply/one.action">单项预约</a></li>
                        <li><a href="${pageContext.request.contextPath }/apply/batch.action">批量预约</a>
                        </li>
                    </ul>
                </li>
                <li><a href="#"><i class="fa fa-search fa-fw"></i> 预约查询<span
                        class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="${pageContext.request.contextPath }/apply/queryApplyByLab.action">查询课表</a></li>
                        <li><a href="${pageContext.request.contextPath }/apply/queryApplyByUser.action">预约管理</a></li>
                        <li><a href="${pageContext.request.contextPath }/apply/queryByWeekView.action">所有预约</a></li>
                    </ul>
                </li>

                <li><a href="#"><i class="fa fa-codepen fa-fw"></i> 预约管理<span
                        class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="${pageContext.request.contextPath }/apply/setItermView.action">学期设置</a></li>
                        <li><a href="${pageContext.request.contextPath }/apply/dataStatistical.action">实验室统计</a></li>
                        <li><a href="${pageContext.request.contextPath }/apply/labRatioView.action">实验室利用率</a></li>


                    </ul>
                </li>

                <li><a href="#"><i class="fa fa-book fa-fw"></i> 数据字典<span
                        class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="${pageContext.request.contextPath }/baseDict/professional.action">专业设置</a></li>
                        <li><a href="${pageContext.request.contextPath }/baseDict/college.action">学院设置</a></li>
                        <li><a href="${pageContext.request.contextPath }/baseDict/professional_title.action">职称设置</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath }/baseDict/courseNature.action">课程性质</a></li>
                    </ul>
                </li>

                <li><a href="#"><i class="fa fa-recycle fa-fw"></i> 回收站<span
                        class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a href="${pageContext.request.contextPath }/user/recycleUser.action">用户</a></li>

                        <li><a href="${pageContext.request.contextPath }/course/recycleCourse.action">课程</a></li>
                        <li><a href="${pageContext.request.contextPath }/lab/recycleLab.action">实验室</a></li>

                    </ul>
                </li>


            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>


</body>
</html>