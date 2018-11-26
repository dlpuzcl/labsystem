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

    <title>管理员信息</title>

    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <link href="<%=basePath%>bootstrap/css/bootstrap-colorpicker.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<%=basePath%>morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


    <link rel="<%=basePath%>stylesheet" type="text/css" href="sweetalert/sweetalert.css">

    <link rel="stylesheet" type="text/css" href="<%=basePath%>sweetalert/sweetalert.css">
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
                        <a href="javascript:void(0)">管理员信息</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">管理员信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-xs-12">
                <div id="user-profile-2" class="user-profile">
                    <div class="tabbable">
                        <div class="profile-users clearfix">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-default">

                                        <div class="panel-body">
                                            <div class="row">

                                                <div class="col-xs-12">
                                                    <!-- PAGE CONTENT BEGINS -->
                                                    <form class="form-horizontal" id="update_admini_form"
                                                          >
                                                        <input type="hidden" id="admini_id" name="admini_id"
                                                               value="${edit_admini.admini_id }"/>
                                                        <div class="form-group">
                                                            <label class="col-lg-3 control-label">用户名</label>
                                                            <div class="col-lg-5">
                                                                <input type="text" class="form-control"
                                                                       id="admini_name" name="admini_name"
                                                                       value="${edit_admini.admini_name }">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-lg-3 control-label">邮箱</label>
                                                            <div class="col-lg-5">
                                                                <input type="email" class="form-control"
                                                                       id="admini_email"
                                                                       name="admini_email"
                                                                       value="${edit_admini.admini_email }">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-lg-3 control-label no-padding-right"
                                                                   for="admini_memo">备注</label>
                                                            <div class="col-lg-5">
                                                                <div class="pos-rel">
                                                                            <textarea
                                                                                    class="form-control limited autosize-transition"
                                                                                    id="admini_memo" maxlength="50"
                                                                                    name="admini_memo">${edit_admini.admini_memo}</textarea>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="clearfix form-actions">
                                                            <div class="col-md-offset-3 col-md-9">
                                                                <button class="btn btn-primary" type="submit">
                                                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                                                    修改
                                                                </button> &nbsp; &nbsp; &nbsp;
                                                                <button class="btn" type="reset">
                                                                    <i class="ace-icon fa fa-undo bigger-110"></i>
                                                                    重置
                                                                </button>

                                                            </div>
                                                        </div>

                                                    </form>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.col -->
                        </div>

                    </div>
                </div>

            </div>
            <!-- /#pictures -->
        </div>
    </div>
</div>

<!-- /#page-wrapper -->

<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap-colorpicker.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

<script src="<%=basePath%>morrisjs/morris.min.js"></script>


<script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>


<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>dist/js/sb-admin-2.js"></script>

<!-- 引入表单校验jquery插件 -->
<script src="<%=basePath%>jquery/jquery.validate.min.js"></script>

<script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>


<script>


    $("#update_admini_form").validate({
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
            "admini_email": {
                "required": true,
                "email": true
            }
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
            },
            "admini_email": {
                "required": "*邮箱不能为空",
                "email": "*邮箱格式不正确"
            }

        },

        submitHandler: function (form) {  //表单提交后要执行的内容
            $.post("<%=basePath%>admini/update.action", $("#update_admini_form").serialize(), function (data) {
                if (data.status == 200) {
                    swal({title: "成功", text: "修改成功，重新登陆生效！", type: "success"}, function () {
                        window.location.reload();
                    });
                }
                if (data.status == 400) {
                    swal("用户修改失败！", data.msg, "error");
                }
                if (data.status == 333) {
                    swal("用户修改失败！", data.msg, "error");
                }
                if (data.status == 444) {
                    swal("用户修改失败！", data.msg, "error");
                }
                if (data.status == 555) {
                    swal("用户修改失败！", data.msg, "error");
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
