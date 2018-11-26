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
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>设置学院</title>

    <!-- Bootstrap Core CSS -->
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


    <link rel="stylesheet" type="text/css" href="<%=basePath%>sweetalert/sweetalert.css">

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
                        <a href="javascript:void(0)">数据字典</a>
                    </li>
                    <li>
                        <a href="#">设置学院</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">设置学院</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading" style="padding-bottom: 0px;padding-top: 11px;height: 55px;">
                        <div class="pull-right">
                            <a href="#" class="btn btn-success" data-toggle="modal"
                               data-target="#customerAddDialog">添加
                            </a>
                        </div>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row">
                            <div class=" col-md-12">
                                <div class="table-responsive">

                                    <table width="100%" class="table table-striped table-bordered table-hover"
                                           style="text-align: center;">
                                        <thead>
                                        <tr class="info">
                                            <td>序号</td>
                                            <td>学院名称</td>
                                            <td>删除</td>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${fromCollege}" var="row" varStatus="vs">
                                            <tr>
                                                <td>${vs.count }</td>

                                                <td>${row.dict_item_name} </td>
                                                <td>
                                                    <a href="#" class="btn btn-danger btn-xs"
                                                       onclick="deleteProfessional(${row.dict_id})">
                                                        <i class="ace-icon fa fa-trash-o"></i>
                                                        删除
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                </div>

                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>



        <%--添加对话框--%>
        <div class="modal fade" id="customerAddDialog" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="ModalLabel">添加学院</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="add_Profession_form">
                            <input type="hidden" id="dict_type_code" name="dict_type_code" value="002"/>
                            <input type="hidden" id="dict_type_name" name="dict_type_name" value="学院"/>

                            <div class="form-group">
                                <label for="dict_item_name" class="col-sm-2 control-label">学院</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="dict_item_name" placeholder="学院"
                                           name="dict_item_name">
                                </div>
                            </div>


                            <%--<submit type="button" class="btn btn-primary" >提交</submit>--%>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button class="btn btn-primary" type="submit">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    立即提交
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="<%=basePath%>jquery/jquery.min.js"></script>
    <script src="<%=basePath%>bootstrap/js/bootstrap-colorpicker.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

    <script src="<%=basePath%>morrisjs/morris.min.js"></script>


    <script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>


    <!-- Custom Theme JavaScript -->
    <script src="<%=basePath%>dist/js/sb-admin-2.js"></script>

    <script src="<%=basePath%>jquery/jquery.validate.min.js"></script>


    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>


        $("#add_Profession_form").validate({
            rules: {

                "dict_item_name": {
                    "required": true,
                }
            },
            messages: {

                "dict_item_name": {
                    "required": "*学院名称不能为空",
                }
            },

            submitHandler: function (form) {  //表单提交后要执行的内容
                $.post("<%=basePath%>baseDict/add.action", $("#add_Profession_form").serialize(), function (data) {
                    if (data == "0") {
                        swal({title: "成功", text: "学院添加成功", type: "success"}, function () {
                            window.location.reload();
                        });

                    }else {
                        swal("失败！", "学院添加失败。", "error");
                    }

                });
            },
            invalidHandler: function (form, validator) {  //不通过回调
                return false;
            }
        });

        function deleteProfessional(id) {
            swal({
                    title: "确定删除吗？",
                    text: "很重要的！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定删除！",
                    cancelButtonText: "取消删除！",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {
                    if (isConfirm) {
                        $.post("<%=basePath%>baseDict/delete.action", {"id": id}, function (data) {
                            if (data == "0") {
                                swal({title: "删除！", text: "学院已经被删除。", type: "success"},
                                    function () {
                                        window.location.reload();
                                    });


                            } else {
                                swal("删除！", "学院删除失败。", "error");
                            }
                        });

                    } else {
                        swal("取消！", "学院是安全的:)",
                            "error");
                    }


                });

        }


    </script>

</body>

</html>