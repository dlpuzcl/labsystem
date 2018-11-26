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

    <title>实验室回收站</title>

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

    <link rel="stylesheet" type="text/css" href="<%=basePath%>sweetalert/sweetalert.css">


    <script type="text/javascript">

    </script>

    <style type="text/css">
        .error{
            color:red
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
                        <a href="#">实验室回收站</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">实验室回收站</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <div class="panel panel-default " >
            <div class="panel-body">
                <form class="form-inline" action="${pageContext.request.contextPath }/lab/recycleLab.action"
                      method="get">
                    <div class="form-group">
                        <label for="roomCode">房间号</label>
                        <input type="text" class="form-control" id="roomCode" placeholder="房间号" value="${vo.roomCode }"
                               name="roomCode">
                    </div>

                    <div class="form-group">
                        <label for="add_college">学院</label>
                        <select class="form-control" id="add_college" name="roomCollege">
                            <option value="">--请选择--</option>
                            <c:forEach items="${fromCollege}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == vo.roomCollege}"> selected</c:if>
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
                                            <td>房间号</td>
                                            <td>实验室名称</td>
                                            <td>人数</td>
                                            <td>所属学院</td>
                                            <td>备注</td>
                                            <td>编辑</td>
                                            <%--<td>删除</td>--%>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <c:forEach items="${page.rows }" var="lab" varStatus="vs">
                                            <tr>
                                                <td>${vs.count}</td>
                                                <td>${lab.room_code }</td>
                                                <td>${lab.room_name }</td>
                                                <td>${lab.place_count }</td>
                                                <td>${lab.room_college }</td>
                                                <td>${lab.room_memo }</td
                                                <td>

                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs"
                                                       onclick="backLab(${lab.room_id})">
                                                        <i class="ace-icon fa fa-pencil"></i>
                                                        修改
                                                    </a>
                                                </td>


                                                <%--<td>--%>
                                                    <%--<a href="#" class="btn btn-danger btn-xs"--%>
                                                       <%--onclick="deleteLab(${lab.room_id})">--%>
                                                        <%--<i class="ace-icon fa fa-trash-o"></i>--%>
                                                        <%--删除--%>
                                                    <%--</a>--%>
                                                <%--</td>--%>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                    <div class="col-md-12 text-right">
                                        <itcast:page url="${pageContext.request.contextPath }/lab/recycleLab.action"/>
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

    <script src="<%=basePath%>jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

    <script src="<%=basePath%>morrisjs/morris.min.js"></script>
    <%--表单校验--%>
    <script src="<%=basePath%>jquery/jquery.validate.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=basePath%>dist/js/sb-admin-2.js"></script>

    <script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>

    <script>



        function backLab(id) {


            swal({
                    title: "是否找回？",
                    text: "实验室！",
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
                        $.post("<%=basePath%>lab/back.action", {"id": id}, function (data) {
                            if (data == "0") {
                                swal({title: "成功", text: "实验室已经被找回。", type: "success"},
                                    function () {
                                        window.location.reload();
                                    });


                            } else {
                                swal("失败", "实验室找回失败。", "error");
                            }
                        });

                    } else {
                        swal("取消！", "实验室未找回！)",
                            "error");
                    }


                });
        }

    </script>


</body>

</html>