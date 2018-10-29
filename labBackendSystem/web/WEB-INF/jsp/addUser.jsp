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
                        <a href="javascript:void(0)">用户管理</a>
                    </li>
                    <li>
                        <a href="#">用户添加</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">添加用户</h1>
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
                                                                <label class="col-lg-3 control-label">姓名</label>
                                                                <div class="col-lg-5">
                                                                    <input type="text" class="form-control" id="name"
                                                                           name="user_name">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label">邮箱</label>
                                                                <div class="col-lg-5">
                                                                    <input type="email" class="form-control" id="email"
                                                                           name="user_email">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label">电话</label>
                                                                <div class="col-lg-5">
                                                                    <input type="text" class="form-control"
                                                                           id="telephone" name="user_phone">
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label">学院</label>
                                                                <div class="col-lg-5">
                                                                    <select class="form-control" id="college"
                                                                            name="college">
                                                                        <option value="">--请选择--</option>
                                                                        <c:forEach items="${fromCollege}" var="item">
                                                                            <option value="${item.dict_id}">
                                                                                    ${item.dict_item_name }
                                                                            </option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label">职称</label>
                                                                <div class="col-lg-5">
                                                                    <select class="form-control" id="professionalTitle"
                                                                            placeholder="职称" name="professional_title">
                                                                        <option value="">--请选择--</option>
                                                                        <c:forEach items="${fromProfessionalTitle}"
                                                                                   var="item">
                                                                            <option value="${item.dict_id}">
                                                                                    ${item.dict_item_name }
                                                                            </option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>


                                                            <div class="form-group">
                                                                <label class="col-lg-3 control-label">颜色</label>

                                                                <div id="cp5" class="input-group colorpicker-component col-lg-5"
                                                                     data-color="#673AB7" style="padding-left: 15px;padding-right: 15px";
                                                                     title="Using input value" >
                                                                    <input type="text" class="form-control col-lg-5" name="user_color" />
                                                                    <span class="input-group-addon"><i></i></span>
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
                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label">用户名</label>
                                                                    <div class="col-lg-5">
                                                                        <input type="text" class="form-control"
                                                                               id="admini_name" name="admini_name">
                                                                    </div>
                                                                </div>

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

                                                                <div class="form-group">
                                                                    <label class="col-lg-3 control-label no-padding-right"
                                                                           for="admini_memo">备注</label>
                                                                    <div class="col-lg-5">
                                                                        <div class="pos-rel">
                                                                            <textarea
                                                                                    class="form-control limited autosize-transition"
                                                                                    id="admini_memo" maxlength="50"
                                                                                    name="admini_memo"></textarea>
                                                                        </div>
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
<script src="<%=basePath%>bootstrap/js/bootstrap-colorpicker.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

<script src="<%=basePath%>morrisjs/morris.min.js"></script>


<script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>


<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>dist/js/sb-admin-2.js"></script>

<!-- 引入表单校验jquery插件 -->
<script src="<%=basePath%>jquery/jquery.validate.min.js"></script>


<script>

    //自定义校验规则
    $.validator.addMethod(
        //规则的名称
        "checkUsername",
        //校验的函数
        function (value, element, params) {

            //定义一个标志
            var flag = false;

            //value:输入的内容
            //element:被校验的元素对象
            //params：规则对应的参数值
            //目的：对输入的username进行ajax校验
            $.ajax({
                "async": false,
                "url": "${pageContext.request.contextPath}/checkUsername",
                "data": {"username": value},
                "type": "POST",
                "dataType": "json",
                "success": function (data) {
                    flag = data.isExist;
                }
            });

            //返回false代表该校验器不通过
            return !flag;
        }
    );

    <%--function addUser() {--%>
    <%--$.post("<%=basePath%>user/add.action",$("#add_User_form").serialize(),function(data){--%>
    <%--if (data == "0"){--%>
    <%--alert("客户更新成功！");--%>
    <%--} else{--%>
    <%--alert("客户更新失败！");--%>
    <%--}--%>
    <%--// window.location.reload();--%>
    <%--window.location = "<%=basePath%>user/list.action"--%>
    <%--});--%>
    <%--}--%>


    $("#add_User_form").validate({
        rules: {

            "user_name": {
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

            "user_name": {
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
            $.post("<%=basePath%>user/add.action", $("#add_User_form").serialize(), function (data) {
                if (data.status == 200) {
                    alert("用户添加成功！");
                    window.location = "<%=basePath%>user/list.action"

                }
                if (data.status == 400) {
                    alert("管理员添加失败:" + data.msg);
                    window.location.reload();
                }
                if (data.status == 555) {
                    alert(data.msg);
                    window.location.reload();
                }
                if (data.status == 666) {
                    alert(data.msg);
                    window.location.reload();
                }
                if (data.status == 777) {
                    alert(data.msg);
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
            $.post("<%=basePath%>admini/add.action", $("#add_admini_form").serialize(), function (data) {
                if (data.status == 200) {
                    alert("管理员添加成功！");
                    <%--window.location = "<%=basePath%>user/list.action"--%>
                    window.location.reload();
                }
                if (data.status == 400) {
                    alert("管理员添加失败:" + data.msg);
                    window.location.reload();
                }

            });
        },
        invalidHandler: function (form, validator) {  //不通过回调
            return false;
        }

    });

    $(function () {
        $('#mycp').colorpicker();
    });
    $(function () {

        $('#cp5').colorpicker({
            format: "rgba"
        });

    });
</script>
</body>

</html>
