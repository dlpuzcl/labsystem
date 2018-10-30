<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>管理界面</title>

    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<%=basePath%>morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


    <link rel="<%=basePath%>stylesheet" type="text/css" href="sweetalert/sweetalert.css">
    <!--<link rel="stylesheet" href="../css/ace.min.css" id="main-ace-style" />-->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .error {
            color: red
        }
    </style>
    <script type="text/javascript">


    </script>
</head>

<body>

<div id="wrapper">

    <%@ include file="/WEB-INF/jsp/navigation.jsp" %>

    <div id="page-wrapper">
        <div class="row">
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="/admini/first.action">首页</a>
                    </li>

                    <li>
                        <a href="#">修改密码</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">修改密码</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-xs-12">
                <div id="user-profile-2" class="user-profile">
                    <div class="tabbable">
                        <ul class="nav nav-tabs padding-18">
                            <li class="active">
                                <a data-toggle="tab" href="#teacher">
                                    <i class="green icon-user bigger-120"></i> 教师
                                </a>
                            </li>

                            <li>
                                <a data-toggle="tab" href="#user">
                                    <i class="pink icon-picture bigger-120"></i> 管理员
                                </a>
                            </li>
                        </ul>

                        <div class="tab-content no-border padding-24">
                            <div id="teacher" class="tab-pane in active">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="panel panel-default">
                                            <!--<div class="panel-heading">
                        请认写以下数据
                    </div>-->
                                            <div class="panel-body">
                                                <div class="row">

                                                    <div class="col-xs-12">
                                                        <!-- PAGE CONTENT BEGINS -->
                                                        <form class="form-horizontal" id="add_User_form">
                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label">用户</label>
                                                                <div class="col-lg-5">
                                                                    <select class="form-control" id="user_id" name="user_id">

                                                                        <option value="">--选择教师--</option>
                                                                        <c:forEach items="${users }" var="user">
                                                                            <option value="${user.user_id }">
                                                                                    ${user.user_name }
                                                                            </option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <!--密码-->
                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label">密码</label>
                                                                <div class="col-lg-5">
                                                                    <input type="password" class="form-control"
                                                                           id="user_password" name="user_password">
                                                                </div>
                                                            </div>
                                                            <!--确认密码-->
                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label">确认密码</label>
                                                                <div class="col-lg-5">
                                                                    <input type="password" class="form-control"
                                                                           id="user_repassword" name="user_repassword">
                                                                </div>
                                                            </div>


                                                            <div class="clearfix form-actions">
                                                                <div class="col-md-offset-3 col-md-9">
                                                                    <button class="btn btn-primary" onclick="addUser()"
                                                                            type="submit">
                                                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                                                        立即提交
                                                                    </button> &nbsp; &nbsp; &nbsp;
                                                                    <button class="btn" type="reset">
                                                                        <i class="ace-icon fa fa-undo bigger-110"></i>
                                                                        重置
                                                                    </button>

                                                                </div>
                                                            </div>

                                                        </form>

                                                    </div>
                                                    <!-- /.col -->
                                                </div>

                                            </div>
                                            <!-- /.row (nested) -->
                                        </div>
                                        <!-- /.panel-body -->
                                    </div>

                                </div>
                                <!-- /row-fluid -->

                            </div>
                            <!-- #home -->


                            <!-- /#friends -->

                            <div id="user" class="tab-pane">
                                <div class="profile-users clearfix">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="panel panel-default">
                                                <!--<div class="panel-heading">
                        请认写以下数据
                    </div>-->
                                                <div class="panel-body">
                                                    <div class="row">

                                                        <div class="col-xs-12">
                                                            <!-- PAGE CONTENT BEGINS -->
                                                            <form class="form-horizontal" id="add_admini_form"
                                                                  action="">


                                                                <input type="hidden" value="${admini.admini_id}" name="admini_id">
                                                                <!--密码-->
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">密码</label>
                                                                    <div class="col-lg-5">
                                                                        <input type="password" class="form-control"
                                                                               id="admini_password"
                                                                               name="admini_password">
                                                                    </div>
                                                                </div>
                                                                <!--确认密码-->
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">确认密码</label>
                                                                    <div class="col-lg-5">
                                                                        <input type="password" class="form-control"
                                                                               id="admini_repassword"
                                                                               name="admini_repassword">
                                                                    </div>
                                                                </div>


                                                                <div class="clearfix form-actions">
                                                                    <div class="col-md-offset-3 col-md-9">
                                                                        <button class="btn btn-primary" type="submit">
                                                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                                                            立即提交
                                                                        </button> &nbsp; &nbsp; &nbsp;
                                                                        <button class="btn" type="reset">
                                                                            <i class="ace-icon fa fa-undo bigger-110"></i>
                                                                            重置
                                                                        </button>

                                                                    </div>
                                                                </div>

                                                            </form>

                                                        </div>
                                                        <!-- /.col -->
                                                    </div>

                                                </div>
                                                <!-- /.row (nested) -->
                                            </div>
                                            <!-- /.panel-body -->
                                        </div>

                                    </div>
                                </div>

                            </div>
                            <!-- /#pictures -->
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->

<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

<script src="<%=basePath%>morrisjs/morris.min.js"></script>


<script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>


<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>dist/js/sb-admin-2.js"></script>

<!-- 引入表单校验jquery插件 -->
<script src="<%=basePath%>jquery/jquery.validate.min.js"></script>


<script>




    $("#add_User_form").validate({
        rules: {

            "user_id": {
                "required": true,
            },
            "user_phone": {
                "required": true,
                "rangelength": [11, 11]
            },
            "user_password": {
                "required": true,
                "rangelength": [6, 12]
            },
            "user_repassword": {
                "required": true,
                "rangelength": [6, 12],
                "equalTo": "#user_password"
            },
            "user_email": {
                "required": true,
                "email": true
            },
            "professional_title": {
                "required": true,
            },
            "college": {
                "required": true,
            }
        },
        messages: {

            "user_id": {
                "required": "*姓名不能为空",
            },
            "user_phone": {
                "required": "*电话不能为空",
                "rangelength": "*电话号码格式不正确"
            },
            "password": {
                "required": "*密码不能为空",
                "rangelength": "*密码长度6-12位"
            },
            "repassword": {
                "required": "*密码不能为空",
                "rangelength": "*密码长度6-12位",
                "equalTo": "*两次密码不一致"
            },
            "user_email": {
                "required": "*邮箱不能为空",
                "email": "*邮箱格式不正确"
            },
            "professional_title": {
                "required": "*职称不能为空",
            },
            "college": {
                "required": "*学院不能为空",
            }
        },

        submitHandler: function (form) {  //表单提交后要执行的内容
            $.post("<%=basePath%>user/updatePassword.action", $("#add_User_form").serialize(), function (data) {
                if (data == "0") {
                    alert("密码更新成功！");

                } else {
                    alert("密码更新失败");
                    window.location.reload();
                }

            });
        },
        invalidHandler: function (form, validator) {  //不通过回调
            return false;
        }
    });


    $("#add_admini_form").validate({
        rules: {

            "admini_name": {
                "required": true,
            },

            "admini_password": {
                "required": true,
                "rangelength": [6, 12]
            },
            "admini_repassword": {
                "required": true,
                "rangelength": [6, 12],
                "equalTo": "#admini_password"
            },
        },
        messages: {
            "admini_name": {
                "required": "*用户名不能为空",
            },

            "admini_password": {
                "required": "*密码不能为空",
                "rangelength": "*密码长度6-12位"
            },
            "admini_repassword": {
                "required": "*密码不能为空",
                "rangelength": "*密码长度6-12位",
                "equalTo": "*两次密码不一致"
            }

        },

        submitHandler: function (form) {  //表单提交后要执行的内容
            $.post("<%=basePath%>admini/updatePassword.action", $("#add_admini_form").serialize(), function (data) {
                if (data == "0") {
                    swal({title: "提示", text: "密码更新成功", type: "success"}, function () {

                    });

                } else {
                    swal({title: "提示", text: data.msg, type: "error"}, function () {
                        window.location.reload();
                    });
                }

            });
        },
        invalidHandler: function (form, validator) {  //不通过回调
            return false;
        }

    });


</script>
</body>

</html>
