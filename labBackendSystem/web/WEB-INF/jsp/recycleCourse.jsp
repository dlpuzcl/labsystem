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

    <title>课程找回</title>

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
                        <a href="#">课程回收站</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">课程回收站</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <div class="panel panel-default ">
            <div class="panel-body">
                <form class="form-inline" action="${pageContext.request.contextPath }/course/recycleCourse.action"
                      method="get">
                    <div class="form-group">
                        <label for="courseName">课程名称</label>
                        <input type="text" class="form-control" id="courseName" placeholder="课程名称"
                               value="${vo.courseName }"
                               name="courseName">
                    </div>

                    <div class="form-group">
                        <label for="userName">教师</label>
                        <select class="form-control" id="userName" name="userName">
                            <option value="">--请选择--</option>
                            <c:forEach items="${userList}" var="item">
                                <option value="${item.user_name}"
                                        <c:if test="${item.user_name == vo.userName}"> selected</c:if>
                                >
                                        ${item.user_name }
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
                                            <td>课程名称</td>
                                            <td>上课班级</td>
                                            <td>上课教师</td>
                                            <td>上课人数</td>
                                            <td>学时</td>
                                            <td>性质</td>
                                            <td>备注</td>
                                            <td>编辑</td>
                                            <td>删除</td>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <c:forEach items="${page.rows }" var="course" varStatus="vs">
                                            <tr>
                                                <td>${vs.count}</td>
                                                <td>${course.course_name }</td>
                                                <td>${course.course_class }</td>
                                                <td>${course.user_id }</td>
                                                <td>${course.course_students}</td>
                                                <td>${course.course_time }</td>
                                                <td>${course.course_nature }</td>
                                                <td>${course.course_memo }</td>

                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs"
                                                       onclick="backCourse(${course.course_id})">
                                                        <i class="ace-icon fa fa-pencil"></i>
                                                        找回
                                                    </a>
                                                </td>


                                                <td>
                                                    <a href="#" class="btn btn-danger btn-xs"
                                                       onclick="deleteCourse(${course.course_id})">
                                                        <i class="ace-icon fa fa-trash-o"></i>
                                                        彻底删除
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                    <div class="col-md-12 text-right">
                                        <itcast:page url="${pageContext.request.contextPath }/course/recycleCourse.action"/>
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
    <!-- /#wrapper -->

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

    <script>



        function backCourse(id) {

            swal({
                    title: "是否找回？",
                    text: "课程！",
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
                        $.post("<%=basePath%>course/back.action", {"id": id}, function (data) {
                            if (data == "0") {
                                swal({title: "成功", text: "课程已经找回！", type: "success"},
                                    function () {
                                        window.location.reload();
                                    });


                            } else {
                                swal("失败！", "课程找回失败。", "error");
                            }
                        });

                    } else {
                        swal("取消！", "课程未找回)",
                            "error");
                    }


                });


        }

        function deleteCourse(id) {

            swal({
                    title: "确定删除吗？",
                    text: "课程将彻底删除无法找回！",
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
                        $.post("<%=basePath%>course/thoroughDelete.action", {"id": id}, function (data) {
                            if (data == "0") {
                                swal({title: "成功！", text: "课程已经被删除。", type: "success"},
                                    function () {
                                        window.location.reload();
                                    });


                            } else {
                                swal("失败！", "删除失败，请检查此课程是否存在预约！", "error");
                            }
                        });

                    } else {
                        swal("取消！", "课程是安全的)",
                            "error");
                    }


                });


        }


    </script>


</body>

</html>