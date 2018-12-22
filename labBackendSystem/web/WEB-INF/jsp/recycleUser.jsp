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

    <title>用户回收站</title>

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
                        <a href="javascript:void(0)">回收站</a>
                    </li>
                    <li>
                        <a href="#">用户回收站</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">用户回收站</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->


        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" action="${pageContext.request.contextPath }/user/recycleUser.action"
                      method="get">
                    <div class="form-group">
                        <label for="userName">教师名称</label>
                        <input type="text" class="form-control" id="userName" placeholder="教师名称" value="${vo.userName }"
                               name="userName">
                    </div>
                    <div class="form-group">
                        <label for="professional_title">职称</label>
                        <select class="form-control" id="professional_title" placeholder="职称" name="professionalTitle">
                            <option value="">--请选择--</option>
                            <c:forEach items="${fromProfessionalTitle}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == vo.professionalTitle}"> selected</c:if>
                                >
                                        ${item.dict_item_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="add_college">学院</label>
                        <select class="form-control" id="add_college" name="userCollege">
                            <option value="">--请选择--</option>
                            <c:forEach items="${fromCollege}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == vo.userCollege}"> selected</c:if>
                                >
                                        ${item.dict_item_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">查询</button>

                </form>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading" style="padding-bottom: 23px;">

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
                                            <td>姓名</td>
                                            <td>电话</td>
                                            <td>邮箱</td>
                                            <td>职称</td>
                                            <td>学院</td>
                                            <td>专业</td>
                                            <td>颜色</td>
                                            <td>状态</td>
                                            <td>编辑</td>
                                            <td>删除</td>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${page.rows}" var="row" varStatus="vs">
                                            <tr>
                                                <td>${vs.count }</td>
                                                <td>${row.user_name }</td>
                                                <td>${row.user_phone}</td>
                                                <td>${row.user_email}</td>
                                                <td>${row.professional_title }</td>
                                                <td>${row.college}</td>
                                                <td>${row.profession}</td>
                                                <td>
                                                    <div style="background-color:${row.user_color};height: 22px;border-radius:10px;"></div>

                                                </td>
                                                <c:if test="${row.user_state == 1}">
                                                    <td>
                                                        <div style="color:#5CB85C"> 已激活</div>
                                                    </td>
                                                </c:if>
                                                <c:if test="${row.user_state == 0}">
                                                    <td>
                                                        <div style="color:#D9534F"> 未激活</div>
                                                    </td>
                                                </c:if>

                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs"
                                                       onclick="backUser(${row.user_id})">
                                                        <i class="ace-icon fa fa-pencil"></i>
                                                        找回
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-danger btn-xs"
                                                       onclick="deleteUser(${row.user_id})">
                                                        <i class="ace-icon fa fa-trash-o"></i>
                                                        彻底删除
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="col-md-12 text-right">
                                        <itcast:page url="${pageContext.request.contextPath }/user/recycleUser.action"/>
                                    </div>

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

        function backUser(id) {
            swal({
                    title: "提示",
                    text: "是否找回这位用户！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定！",
                    cancelButtonText: "取消！",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {
                    if (isConfirm) {
                        $.post("<%=basePath%>user/back.action", {"id": id}, function (data) {
                            if (data == "0") {
                                swal({title: "成功", text: "用户已经找回！", type: "success"},
                                    function () {
                                        window.location.reload();
                                    });


                            } else {
                                swal("失败", "用户找回失败。", "error");
                            }
                        });

                    } else {
                        swal("取消！", "用户未找回！)",
                            "error");
                    }


                });

        }


        function deleteUser(id) {
            swal({
                    title: "确定删除吗？",
                    text: "删除后用户将无法找回！",
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
                        $.post("<%=basePath%>user/thoroughDelete.action", {"id": id}, function (data) {
                            if (data == "0") {
                                swal({title: "成功！", text: "用户已经被删除。", type: "success"},
                                    function () {
                                        window.location.reload();
                                    });


                            } else {
                                swal("失败！", "请检查用户是否存在课程和预约", "error");
                            }
                        });

                    } else {
                        swal("取消！", "用户是安全的:)",
                            "error");
                    }


                });

        }


        $(function () {
            $('#mycp').colorpicker();
        });
        $(function () {

            $('#cp5,#cp6').colorpicker({
                format: "rgba"
            });

        });
    </script>

</body>

</html>