<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <title>实验室预约</title>

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

    <style>
        th {
            text-align: center;

        }

        table {
              border-collapse: collapse;
              border: solid 0px red;
          }

        table td {
            width: 50px;
            height: 65px;
            border: solid 0px red;
            padding: 1px 5px;
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
                <h1 class="page-header">实验室预约</h1>
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
        <!-- /.panel -->

        <div class="tabbable">
            <ul class="nav nav-tabs padding-18">
                <li class="active">
                    <a data-toggle="tab" href="#teacher">
                        <i class="green icon-user bigger-120"></i> 单向预约
                    </a>
                </li>

                <li>
                    <a data-toggle="tab" href="#user">
                        <i class="pink icon-picture bigger-120"></i> 批量预约
                    </a>
                </li>
            </ul>

            <div class="tab-content no-border padding-24">
                <div id="teacher" class="tab-pane in active">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading" style="padding-bottom: 23px;">
                                    <i class="fa fa-bar-chart-o fa-fw"></i> 实验室预约
                                    <button onclick="getApply()" class="btn btn-primary pull-right">查询</button>
                                    <div class="pull-right">
                                        <form action="" id="queryApply">
                                            <div class="btn-group">

                                                <select class="form-control" name="room_id">

                                                    <c:forEach items="${labRoom }" var="lab" varStatus="vs">

                                                        <option value="${lab.room_id }">${lab.room_code }：${lab.place_count }人</option>

                                                    </c:forEach>

                                                </select>

                                            </div>

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                            <div class="btn-group">
                                                <select class="form-control" name="apply_week">
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

                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                        </form>
                                    </div>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="row">
                                        <div class=" col-md-12">

                                            <div class="" id="jqu">


                                                <table width="100%"
                                                       style="text-align: center; " border="0" cellspacing="20">
                                                    <thead>
                                                    <tr class="info">
                                                    <tr>
                                                        <td scope="col"> 周/节</td>
                                                        <td scope="col">星期一</td>
                                                        <td scope="col">星期二</td>
                                                        <td scope="col">星期三</td>
                                                        <td scope="col">星期四</td>
                                                        <td scope="col">星期五</td>
                                                        <td scope="col">星期六</td>
                                                        <td scope="col">星期天</td>
                                                    </tr>
                                                    </tr>
                                                    </thead>


                                                    <tbody style="text-align: center;">

                                                    <tr style="height: 80px">
                                                        <td scope="row">第1节
                                                        </td>
                                                        <td id="table_1_1">
                                                        </td>
                                                        <td id="table_2_1"></td>
                                                        <td id="table_3_1"></td>
                                                        <td id="table_4_1"></td>
                                                        <td id="table_5_1"></td>
                                                        <td id="table_6_1"></td>
                                                        <td id="table_7_1"></td>

                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <td scope="row">第2节
                                                        </td>
                                                        <td id="table_1_2"></td>
                                                        <td id="table_2_2"></td>
                                                        <td id="table_3_2"></td>
                                                        <td id="table_4_2"></td>
                                                        <td id="table_5_2"></td>
                                                        <td id="table_6_2"></td>
                                                        <td id="table_7_2"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <td scope="row">第3节
                                                        </td>
                                                        <td id="table_1_3"></td>
                                                        <td id="table_2_3"></td>
                                                        <td id="table_3_3"></td>
                                                        <td id="table_4_3"></td>
                                                        <td id="table_5_3"></td>
                                                        <td id="table_6_3"></td>
                                                        <td id="table_7_3"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <td scope="row">第4节
                                                        </td>
                                                        <td id="table_1_4"></td>
                                                        <td id="table_2_4"></td>
                                                        <td id="table_3_4"></td>
                                                        <td id="table_4_4"></td>
                                                        <td id="table_5_4"></td>
                                                        <td id="table_6_4"></td>
                                                        <td id="table_7_4"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <td scope="row">第5节
                                                        </td>
                                                        <td id="table_1_5">
                                                            <%--<div class="inpit" type='inpit/assembly' formname="ack_two">--%>
                                                            <%--<div class="li " radio>--%>
                                                            <%--<div name="two-a" value="a-1">--%>
                                                            <%--<h2>A1</h2>--%>
                                                            <%--<p>A1</p>--%>
                                                            <%--</div>--%>
                                                            <%--</div>--%>

                                                            <%--</div>--%>
                                                        </td>
                                                        <td id="table_2_5"></td>
                                                        <td id="table_3_5">

                                                        </td>
                                                        <td id="table_4_5"></td>
                                                        <td id="table_5_5"></td>
                                                        <td id="table_6_5"></td>
                                                        <td id="table_7_5"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <td scope="row">第6节
                                                        </td>
                                                        <td id="table_1_6"></td>
                                                        <td id="table_2_6"></td>
                                                        <td id="table_3_6"></td>
                                                        <td id="table_4_6"></td>
                                                        <td id="table_5_6"></td>
                                                        <td id="table_6_6"></td>
                                                        <td id="table_7_6"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <td scope="row">第7节
                                                        </td>
                                                        <td id="table_1_7">
                                                        </td>
                                                        <td id="table_2_7"></td>
                                                        <td id="table_3_7"></td>
                                                        <td id="table_4_7"></td>
                                                        <td id="table_5_7"></td>
                                                        <td id="table_6_7"></td>
                                                        <td id="table_7_7"></td>

                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <td scope="row">第8节
                                                        </td>
                                                        <td id="table_1_8"></td>
                                                        <td id="table_2_8"></td>
                                                        <td id="table_3_8"></td>
                                                        <td id="table_4_8"></td>
                                                        <td id="table_5_8"></td>
                                                        <td id="table_6_8"></td>
                                                        <td id="table_7_8"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <td scope="row">第9节
                                                        </td>
                                                        <td id="table_1_9"></td>
                                                        <td id="table_2_9"></td>
                                                        <td id="table_3_9"></td>
                                                        <td id="table_4_9"></td>
                                                        <td id="table_5_9"></td>
                                                        <td id="table_6_9"></td>
                                                        <td id="table_7_9"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <td scope="row">第10节
                                                        </td>
                                                        <td id="table_1_10"></td>
                                                        <td id="table_2_10"></td>
                                                        <td id="table_3_10"></td>
                                                        <td id="table_4_10"></td>
                                                        <td id="table_5_10"></td>
                                                        <td id="table_6_10"></td>
                                                        <td id="table_7_10"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <td scope="row">第11节
                                                        </td>
                                                        <td id="table_1_11"></td>
                                                        <td id="table_2_11"></td>
                                                        <td id="table_3_11"></td>
                                                        <td id="table_4_11"></td>
                                                        <td id="table_5_11"></td>
                                                        <td id="table_6_11"></td>
                                                        <td id="table_7_11"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <td scope="row">第12节
                                                        </td>
                                                        <td id="table_1_12"></td>
                                                        <td id="table_2_12"></td>
                                                        <td id="table_3_12"></td>
                                                        <td id="table_4_12"></td>
                                                        <td id="table_5_12"></td>
                                                        <td id="table_6_12"></td>
                                                        <td id="table_7_12"></td>
                                                    </tr>
                                                    </tbody>

                                                </table>

                                                <form id="form1">
                                                    <div class="col-md-4 col-md-offset-4">
                                                        <div class=" panel-default">

                                                            <div class="panel-body">
                                                                <div class="form-group">
                                                                    <input type="hidden" name="user_id" id="user_id"
                                                                           value="${user.user_id}">
                                                                    <select class="form-control" id="course"
                                                                            name="course_id">

                                                                        <option value="">--请选择课程--</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div type='inpit/assembly' formname="ack_two">
                                                    <button
                                                            class="btn btn-lg btn-success btn-block">提交
                                                    </button>
                                                </div>
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
                            <!-- /.panel-body -->
                        </div>

                    </div>
                    <!-- /row-fluid -->

                </div>
                <!-- #home -->


                <!-- 批量预约 -->

                <div id="user" class="tab-pane">
                    <div class="profile-users clearfix">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default ">
                                    <div class="panel-body">
                                        <form class="form-inline" id="form3">
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

                                                                                <select class="form-control"
                                                                                        name="room_id">

                                                                                    <option value="">--请选择实验室--</option>

                                                                                    <c:forEach items="${labRoom }"
                                                                                               var="lab" varStatus="vs">

                                                                                        <option value="${lab.room_id }">${lab.room_code }：${lab.place_count }人</option>

                                                                                    </c:forEach>

                                                                                </select>
                                                                            </div>
                                                                        </div>


                                                                        <div class="panel-body">
                                                                            <div class="form-group">
                                                                                <input type="hidden" name="user_id"
                                                                                       id="user_id2"
                                                                                       value="${user.user_id}">
                                                                                <select class="form-control"
                                                                                        id="course2"
                                                                                        name="course_id">

                                                                                    <option value="">--请选择课程--</option>
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

                        </div>


                    </div>
                    <!-- /#pictures -->
                </div>
            </div>
            <!-- 模态框（Modal） -->
            <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div id='modal_message' style="text-align: center"><h3>正在预约.....</h3></div>
                            <div class="progress progress-striped active">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60"
                                     aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                                    <span class="sr-only">100% 完成</span>
                                </div>
                            </div>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

            <!--弹出删除资源警告窗口-->
            <div class="modal fade" id="alertSource" role="dialog" aria-labelledby="gridSystemModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid" id="h5">
                                <%--<h5 id="h5">预约成功！</h5>--%>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary pull-right" data-dismiss="modal">确定</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
    </div>


    <script src="<%=basePath%>jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=basePath%>dist/js/sb-admin-2.js"></script>

    <script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>


    <script type="text/javascript" src="<%=basePath%>bootstrap/js/inpitassembly-2.0.js"></script>


    <script type="text/javascript">

        function getApply() {

            $.ajax({
                type: "get",
                url: "<%=basePath%>front/query.action",
                data: $('#queryApply').serialize(),
                success: function (data) {
                    //清空课程表
                    for (var i = 1; i < 13; i++) {
                        for (var j = 1; j < 8; j++) {

                            // var checkbox = "<input type='checkbox' name='day_section'  value='" + i + j + "'>"

                            var checkbox = "<div class=\"inpit\" type='inpit/assembly' formname=\"ack_two\">\n" +
                                "                                                        <div class=\"li \" radio index ='" + i + j + "' >\n" +
                                "                                                            <div name=\"two-a\" class=\"style_a \" value=\"" + i + j + "\">\n" +
                                "                                                            \n" +
                                "                                                            </div>\n" +
                                "                                                        </div>\n" +
                                "\n" +
                                "                                                    </div>"


                            $("#table_" + j + "_" + i).html(checkbox);
                        }
                    }
                    //遍历课程表
                    for (var i = 0; i < data.length; i++) {

                        var da = "<div class=\"inpit\" type='inpit/assembly' formname=\"ack_two\">\n" +
                            "                                                        <div class=\"li \" radio index ='" + i + j + "' >\n" +
                            "                                                            <div name=\"two-a\" disabled value=\"" + i + j + " \">\n" +
                            "                                                             <br> \n" +
                            "                                                               被选\n" +
                            "                                                              \n" +
                            "                                                            </div>\n" +
                            "                                                        </div>\n" +
                            "\n" +
                            "                                                    </div>"

                        $("#table_" + data[i].apply_day + "_" + data[i].apply_section).html(da);

                        // $("#table_" + data[i].apply_day + "_" + data[i].apply_section).html(data[i].course_name + "<br>" + data[i].course_class + "<br>" + data[i].user_name);
                    }
                }
            });

        }

        //选中表单
        $('#jqu').inpitassembly({
            selected: "ack",
            max: function (event, max) {
                alert("最大" + max)
            },
            min: function (event, min) {
                alert("最小" + min)
            }
        });

        $(function () {

            var id = $("#user_id").val()

            $.ajax({
                type: "get",
                url: "<%=basePath%>front/courseByUser.action",
                data: {"id": id},
                success: function (data) {

                    // //清空列表
                    // $("#course").html("");

                    //遍历课程表
                    for (var i = 0; i < data.length; i++) {
                        $("#course").append("<option value='" + data[i].course_id + "'>" + data[i].course_name + '：' + data[i].course_class + "</option>");
                    }

                    // //清空列表
                    // $("#course2").html("");

                    //遍历课程表
                    for (var i = 0; i < data.length; i++) {
                        $("#course2").append("<option value='" + data[i].course_id + "'>" + data[i].course_name + '：' + data[i].course_class + "</option>");
                    }
                }
            })
        });

        $('#jqu').find("button").click(function () {

            var val = check_result($(this));
            var length = val[0].data.length;
            for (var i = 0; i < length; i++) {
                var d = "day_section=" + val[0].data[i] + "&";
                var sum = d + sum;
            }

            var queryApply = $('#queryApply').serialize();
            var form1 = $('#form1').serialize();
            var formdata = queryApply + '&' + form1 + '&' + sum
            $("#searchModal").modal("show");//显示“正在查询”字样的模态框
            $.ajax({
                type: "get",
                url: "<%=basePath%>front/submit.action",
                data: formdata,
                success: function (data) {

                    $('#searchModal').modal('hide');//服务器停止了5秒,sleep(5)，假设是查询数据用了5秒
                    // setTimeout("$('#searchModal').modal('hide')",2000); //设置2000毫秒之后模态框消失


                    $('#searchModal').on('hidden.bs.modal', function () {
                        // $("#homeworkContent").html(mydata); //显示后端传递的结果
                        if (data == "0") {
                            // alert("预约成功！");
                            swal({title:"提示",text:"预约成功", type:"success"}, function () {

                            });

                        } else {
                            // alert("预约失败！");
                            swal({title:"提示",text:"预约失败", type:"error"}, function () {

                            });
                        }

                        getApply();
                    });

                    // if (data == "0") {
                    //     alert("预约成功！");
                    // } else {
                    //     alert("预约失败！");
                    // }
                    // getApply();

                }
            })


        });


        function apply() {
            $("#searchModal").modal("show");//显示“正在查询”字样的模态框
            var form2 = $('#form2').serialize();
            var form1 = $('#form3').serialize();
            var formdata = form2 + '&' + form1;

            $.ajax({
                type: "get",
                url: "<%=basePath%>front/batchSubmit.action",
                data: formdata,
                success: function (data) {


                    $('#searchModal').modal('hide');//服务器停止了5秒,sleep(5)，假设是查询数据用了5秒
                    // setTimeout("$('#searchModal').modal('hide')",2000); //设置2000毫秒之后模态框消失


                    $('#searchModal').on('hidden.bs.modal', function () {
                        // $("#homeworkContent").html(mydata); //显示后端传递的结果
                        if (data.status == 200) {
                            // alert("预约成功！");
                            swal({title:"提示",text:"预约成功", type:"success"}, function () {
                                window.location.reload();
                            });
                        } else {
                            swal({title:"提示",text:data.msg, type:"error"}, function () {

                            });
                        }

                    });


                }
            })
        }


    </script>
</body>

</html>
