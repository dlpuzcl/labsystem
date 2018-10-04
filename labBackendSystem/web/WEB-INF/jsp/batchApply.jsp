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

    <title>批量预约</title>

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

    <link rel="<%=basePath%>stylesheet" type="text/css" href="sweetalert/sweetalert.css">

    <!-- HTML5Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">

    </script>

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
                        <a href="主页.html">首页</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">教室预约</a>
                    </li>
                    <li>
                        <a href="实验室管理.html">批量预约</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">批量预约</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <div class="panel panel-default ">
            <div class="panel-body">
                <form class="form-inline" id="form1">
                    <div class="form-group">
                        <label>--从--</label>
                        <select class="form-control" name="apply_week_first">
                            <option value="1">第一周</option>
                            <option value="2">第二周</option>
                            <option value="3">第三周</option>
                            <option value="4">第四周</option>
                            <option value="5">第五周</option>
                            <option value="6">第六周</option>
                            <option value="7">第七周</option>
                            <option value="8">第八周</option>
                            <option value="9">第九周</option>
                            <option value="10">第十周</option>
                            <option value="11">第十一周</option>
                            <option value="12">第十二周</option>
                            <option value="13">第十三周</option>
                            <option value="14">第十四周</option>
                            <option value="15">第十五周</option>
                            <option value="16">第十六周</option>
                            <option value="17">第十七周</option>
                            <option value="18">第十八周</option>
                            <option value="19">第十九周</option>
                            <option value="20">第二十周</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>--到--</label>
                        <select class="form-control" name="apply_week_last">
                            <option value="1">第一周</option>
                            <option value="2">第二周</option>
                            <option value="3">第三周</option>
                            <option value="4">第四周</option>
                            <option value="5">第五周</option>
                            <option value="6">第六周</option>
                            <option value="7">第七周</option>
                            <option value="8">第八周</option>
                            <option value="9">第九周</option>
                            <option value="10">第十周</option>
                            <option value="11">第十一周</option>
                            <option value="12">第十二周</option>
                            <option value="13">第十三周</option>
                            <option value="14">第十四周</option>
                            <option value="15">第十五周</option>
                            <option value="16">第十六周</option>
                            <option value="17">第十七周</option>
                            <option value="18">第十八周</option>
                            <option value="19">第十九周</option>
                            <option value="20">第二十周</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>--</label>
                        <select class="form-control" name="apply_day">
                            <option value="1">星期一</option>
                            <option value="2">星期二</option>
                            <option value="3">星期三</option>
                            <option value="4">星期四</option>
                            <option value="5">星期五</option>
                            <option value="6">星期六</option>
                            <option value="7">星期日</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>--的--</label>
                        <select class="form-control" name="apply_section_first">
                            <option value="1">第一节</option>
                            <option value="2">第二节</option>
                            <option value="3">第三节</option>
                            <option value="4">第四节</option>
                            <option value="5">第五节</option>
                            <option value="6">第六节</option>
                            <option value="7">第七节</option>
                            <option value="8">第八节</option>
                            <option value="9">第九节</option>
                            <option value="10">第十节</option>
                            <option value="11">第十一节</option>
                            <option value="12">第十二节</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>--到--</label>
                        <select class="form-control" name="apply_section_last">
                            <option value="1">第一节</option>
                            <option value="2">第二节</option>
                            <option value="3">第三节</option>
                            <option value="4">第四节</option>
                            <option value="5">第五节</option>
                            <option value="6">第六节</option>
                            <option value="7">第七节</option>
                            <option value="8">第八节</option>
                            <option value="9">第九节</option>
                            <option value="10">第十节</option>
                            <option value="11">第十一节</option>
                            <option value="12">第十二节</option>
                        </select>
                    </div>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class=" col-md-12">
                                <div class="table-responsive">
                                    <form id="form2">
                                        <div class="col-md-4 col-md-offset-4">
                                            <div class=" panel-default">

                                                <div class="panel-body">
                                                    <div class="form-group">

                                                        <select class="form-control" name="room_id">

                                                            <option value="">--请选择实验室--</option>

                                                            <c:forEach items="${labRoom }" var="lab" varStatus="vs">

                                                                <option value="${lab.room_id }">${lab.room_code }：${lab.place_count }人</option>

                                                            </c:forEach>

                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="panel-body">
                                                    <div class="form-group">

                                                        <select class="form-control" id="user" name="user_id">

                                                            <option value="">--选择教师--</option>
                                                            <c:forEach items="${userList }" var="user">
                                                                <option value="${user.user_id }">
                                                                        ${user.user_name }
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="form-group">

                                                        <select class="form-control" id="course" name="course_id">
                                                            <option value="">--请先选择教师--</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                    <button onclick="apply()"
                                            class="btn btn-lg btn-success btn-block">提交
                                    </button>
                                </div>

                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.col-lg-4 (nested) -->
                            <div class="col-lg-8">
                                <div id="morris-bar-chart"></div>
                            </div>
                            <!-- /.col-lg-8 (nested) -->
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

        function apply() {

            var form2 = $('#form2').serialize();
            var form1 = $('#form1').serialize();
            var formdata = form2 + '&' + form1
            $.ajax({
                type: "get",
                url: "<%=basePath%>apply/batchSubmit.action",
                data: formdata,
                success: function (data) {

                    if (data.status == 200) {
                        alert("预约成功！");
                    } else {
                        alert(data.msg);
                    }
                    getApply();
                    // window.location.reload();
                    <%--window.location = "<%=basePath%>user/list.action"--%>

                }
            })
        }

        $("#user").change(function () {
            var id = $("#user").val();
            $.ajax({
                type: "get",
                url: "<%=basePath%>apply/courseByUser.action",
                data: {"id": id},
                success: function (data) {

                    //清空列表
                    $("#course").html("");

                    //遍历课程表
                    for (var i = 0; i < data.length; i++) {
                        $("#course").append("<option value='" + data[i].course_id + "'>" + data[i].course_name + '：' + data[i].course_class + "</option>");
                    }
                }
            })
        });
    </script>


</body>

</html>