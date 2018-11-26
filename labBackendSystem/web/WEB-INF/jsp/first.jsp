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

    <title>实验室管理</title>

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

    <script type="text/javascript">

    </script>

    <style type="text/css">


        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }


    </style>
</head>

<body onload="getApply()">

<div id="wrapper">

    <%@ include file="/WEB-INF/jsp/navigation.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">首页</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">预约</div>
                                    <div></div>
                                </div>
                            </div>
                        </div>
                        <a href="/apply/one.action">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">用户</div>
                                    <div></div>
                                </div>
                            </div>
                        </div>
                        <a href="/user/list.action">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">课程</div>
                                    <div></div>
                                </div>
                            </div>
                        </div>
                        <a href="/course/list.action">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">实验室</div>
                                    <div></div>
                                </div>
                            </div>
                        </div>
                        <a href="/lab/list.action">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="padding-bottom: 0px;padding-top: 11px;height: 55px;padding-left: 0px;">

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

                                    &nbsp;&nbsp;
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

                                    &nbsp;&nbsp;&nbsp;

                                </form>
                            </div>


                        </div>


                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class=" col-md-12">
                                    <div class="table-responsive">
                                        <form id="form1">

                                            <table width="100%" class="table  "
                                                   style="text-align: center;">
                                                <thead>
                                                <tr class="info">
                                                <tr>
                                                    <th scope="col"></th>
                                                    <th scope="col">
                                                        <div style="padding: 8px 8px;border-radius:8px;width: 100px;">  星期一</div>
                                                    </th>
                                                    <th scope="col">
                                                        <div style="padding: 8px 8px;border-radius:8px;width: 100px;">  星期二</div>
                                                    </th>
                                                    <th scope="col">
                                                        <div style="padding: 8px 8px;border-radius:8px;width: 100px;">  星期三</div>
                                                    </th>
                                                    <th scope="col">
                                                        <div style="padding: 8px 8px;border-radius:8px;width: 100px;">  星期四</div>
                                                    </th>
                                                    <th scope="col">
                                                        <div style="padding: 8px 8px;border-radius:8px;width: 100px;">  星期五</div>
                                                    </th>
                                                    <th scope="col">
                                                        <div style="padding: 8px 8px;border-radius:8px;width: 100px;">  星期六</div>
                                                    </th>
                                                    <th scope="col">
                                                        <div style="padding: 8px 8px;border-radius:8px;width: 100px;">  星期天</div>
                                                    </th>
                                                </tr>
                                                </tr>
                                                </thead>


                                                <tbody style="text-align: center;">
                                                <tr style="height: 80px">
                                                    <th scope="row">1节
                                                    </th>
                                                    <td id="table_1_1">
                                                        <%--<input type="checkbox" id="11" value="11">--%>
                                                    </td>
                                                    <td id="table_2_1"></td>
                                                    <td id="table_3_1"></td>
                                                    <td id="table_4_1"></td>
                                                    <td id="table_5_1"></td>
                                                    <td id="table_6_1"></td>
                                                    <td id="table_7_1"></td>

                                                </tr>
                                                <tr style="height: 80px">
                                                    <th scope="row">2节
                                                    </th>
                                                    <td id="table_1_2"></td>
                                                    <td id="table_2_2"></td>
                                                    <td id="table_3_2"></td>
                                                    <td id="table_4_2"></td>
                                                    <td id="table_5_2"></td>
                                                    <td id="table_6_2"></td>
                                                    <td id="table_7_2"></td>
                                                </tr>
                                                <tr style="height: 80px">
                                                    <th scope="row">3节
                                                    </th>
                                                    <td id="table_1_3"></td>
                                                    <td id="table_2_3"></td>
                                                    <td id="table_3_3"></td>
                                                    <td id="table_4_3"></td>
                                                    <td id="table_5_3"></td>
                                                    <td id="table_6_3"></td>
                                                    <td id="table_7_3"></td>
                                                </tr>
                                                <tr style="height: 80px">
                                                    <th scope="row">4节
                                                    </th>
                                                    <td id="table_1_4"></td>
                                                    <td id="table_2_4"></td>
                                                    <td id="table_3_4"></td>
                                                    <td id="table_4_4"></td>
                                                    <td id="table_5_4"></td>
                                                    <td id="table_6_4"></td>
                                                    <td id="table_7_4"></td>
                                                </tr>
                                                <tr style="height: 80px">
                                                    <th scope="row">5节
                                                    </th>
                                                    <td id="table_1_5"></td>
                                                    <td id="table_2_5"></td>
                                                    <td id="table_3_5"></td>
                                                    <td id="table_4_5"></td>
                                                    <td id="table_5_5"></td>
                                                    <td id="table_6_5"></td>
                                                    <td id="table_7_5"></td>
                                                </tr>
                                                <tr style="height: 80px">
                                                    <th scope="row">6节
                                                    </th>
                                                    <td id="table_1_6"></td>
                                                    <td id="table_2_6"></td>
                                                    <td id="table_3_6"></td>
                                                    <td id="table_4_6"></td>
                                                    <td id="table_5_6"></td>
                                                    <td id="table_6_6"></td>
                                                    <td id="table_7_6"></td>
                                                </tr>
                                                <tr style="height: 80px">
                                                    <th scope="row">7节
                                                    </th>
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
                                                    <th scope="row">8节
                                                    </th>
                                                    <td id="table_1_8"></td>
                                                    <td id="table_2_8"></td>
                                                    <td id="table_3_8"></td>
                                                    <td id="table_4_8"></td>
                                                    <td id="table_5_8"></td>
                                                    <td id="table_6_8"></td>
                                                    <td id="table_7_8"></td>
                                                </tr>
                                                <tr style="height: 80px">
                                                    <th scope="row">9节
                                                    </th>
                                                    <td id="table_1_9"></td>
                                                    <td id="table_2_9"></td>
                                                    <td id="table_3_9"></td>
                                                    <td id="table_4_9"></td>
                                                    <td id="table_5_9"></td>
                                                    <td id="table_6_9"></td>
                                                    <td id="table_7_9"></td>
                                                </tr>
                                                <tr style="height: 80px">
                                                    <th scope="row">10节
                                                    </th>
                                                    <td id="table_1_10"></td>
                                                    <td id="table_2_10"></td>
                                                    <td id="table_3_10"></td>
                                                    <td id="table_4_10"></td>
                                                    <td id="table_5_10"></td>
                                                    <td id="table_6_10"></td>
                                                    <td id="table_7_10"></td>
                                                </tr>
                                                <tr style="height: 80px">
                                                    <th scope="row">11节
                                                    </th>
                                                    <td id="table_1_11"></td>
                                                    <td id="table_2_11"></td>
                                                    <td id="table_3_11"></td>
                                                    <td id="table_4_11"></td>
                                                    <td id="table_5_11"></td>
                                                    <td id="table_6_11"></td>
                                                    <td id="table_7_11"></td>
                                                </tr>
                                                <tr style="height: 80px">
                                                    <th scope="row">12节
                                                    </th>
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

                                        </form>

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
        function getApply() {
            $.ajax({
                type: "get",
                url: "<%=basePath%>apply/query.action",
                data: $('#queryApply').serialize(),
                success: function (data) {
                    //清空课程表
                    for (var i = 1; i < 13; i++) {
                        for (var j = 1; j < 8; j++) {

                            $("#table_" + j + "_" + i).html("<div style='background-color: #E7EAED;padding: 8px 8px; color: #FFFFFF;border-radius:8px;width: 100px;' ><br><br><br></div>");
                        }
                    }
                    //遍历课程表
                    for (var i = 0; i < data.length; i++) {
                        $("#table_" + data[i].apply_day + "_" + data[i].apply_section).html("<div style='background-color: " + data[i].user_color + ";padding: 8px 8px;color: #FFFFFF;border-radius:8px;width: 100px;' >"+data[i].course_name + "<br>" + data[i].course_class + "<br>" + data[i].user_name+"</div>");
                    }
                }
            });
        }



    </script>


</body>

</html>