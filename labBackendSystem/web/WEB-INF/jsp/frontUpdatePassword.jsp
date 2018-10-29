<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="itcast" uri="http://itcast.cn/common/" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>重置密码</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<%=basePath%>morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link href="<%=basePath%>css/style.css" rel="stylesheet">


    <link rel="stylesheet" type="text/css" href="<%=basePath%>sweetalert/sweetalert.css">



    <style type="text/css">
        .table th, .table td {
            text-align: center;
            vertical-align: middle!important;
        }

    </style>
</head>

<body onload="getApply() ">

<div id="wrapper">

    <%@ include file="/WEB-INF/jsp/top.jsp" %>

    <div id="page-wrapper"
         style="min-height: 429px;margin-left: 0px;margin-right: 0px;border-left-width: 0px;padding-left: 200px;padding-right: 200px;">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <h1 class="page-header">重置密码</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <%@ include file="/WEB-INF/jsp/middle.jsp" %>

        <div class="row">

            <!-- /.panel-heading -->
            <div class="panel-body">
                <div id="morris-area-chart"></div>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        请认真填写以下数据
                    </div>
                    <div class="panel-body">
                        <div class="row">

                            <div class="col-xs-12">
                                <!-- PAGE CONTENT BEGINS -->
                                <form class="form-horizontal" id="add_User_form" action="" >

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
            <!-- /.panel -->
        </div>
        <!-- /.row -->

    </div>

</div>
<!-- /#pictures -->
</div>
</div>


<!-- /.panel -->

<!-- /.panel -->
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<script src="<%=basePath%>jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>dist/js/sb-admin-2.js"></script>

<script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>


<script type="text/javascript" src="<%=basePath%>bootstrap/js/inpitassembly-2.0.js"></script>

<%--表单校验--%>
<script src="<%=basePath%>jquery/jquery.validate.min.js"></script>
<script type="text/javascript">


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
            $.post("<%=basePath%>front/updatePassword.action", $("#add_User_form").serialize(), function (data) {
                if (data == "0") {
                    alert("密码更新成功！");
                    window.location = "<%=basePath%>front/apply.action"

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


</script>
</body>

</html>
