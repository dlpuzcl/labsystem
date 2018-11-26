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

    <title>数据统计</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<%=basePath%>morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>font-awesome/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">

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
                        <a href="javascript:void(0)">预约管理</a>
                    </li>
                    <li>
                        <a href="#">数据统计</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">数据统计</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading" style="padding-bottom: 0px;padding-top: 11px;height: 55px;">
                        <div class="pull-right">
                            <form class="form-inline"
                                  action="${pageContext.request.contextPath }/apply/dataStatistical.action"
                                  method="get" id="myform">

                                <div class="form-group">
                                    <label for="room_id">实验室名称</label>
                                    <select class="form-control" id="room_id" name="room_id" onchange="submitForm()">
                                        <option value="0">--请选择--</option>
                                        <c:forEach items="${labRoom }" var="lab" varStatus="vs">

                                            <option value="${lab.room_id }" <c:if
                                                    test="${lab.room_id == apply.room_id}"> selected</c:if>>
                                                    ${lab.room_code }：${lab.place_count }人
                                            </option>

                                        </c:forEach>
                                    </select>
                                </div>

                                &nbsp;&nbsp;&nbsp;

                                <div class="btn-group">
                                    <button class="btn btn btn-info"
                                            onClick="$('.exceldown').tableExport({type:'excel',pdfmake:{enabled:true}});">
                                        下载
                                    </button>

                                </div>

                                &nbsp;&nbsp;&nbsp;

                                <%--<button type="submit" class="btn btn-primary">查询</button>--%>
                            </form>
                            <input type="hidden" value="${allLab}" id="allLab">
                        </div>
                    </div>


                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row">
                            <div class=" col-md-12">
                                <div class="table-responsive">

                                    <table width="100%" class="table table-striped table-bordered table-hover exceldown"
                                           style="text-align: center;" id="mytable">
                                        <thead>
                                        <tr class="info">
                                            <td>序号</td>
                                            <td>上课教室</td>
                                            <td>课程名称</td>
                                            <td>上课教师</td>
                                            <td>上课班级</td>
                                            <td>上课人数</td>
                                            <td>性质</td>
                                            <td>学时</td>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <c:forEach items="${dataList }" var="data" varStatus="vs">
                                            <tr>
                                                <td>${vs.count}</td>
                                                <td>${data.room_code }</td>
                                                <td>${data.course_name }</td>
                                                <td>${data.user_name }</td>
                                                <td>${data.course_class }</td>
                                                <td>${data.course_students}</td>
                                                <td>${data.course_nature }</td>
                                                <td id="${vs.count}">${data.course_time }</td>
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

        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" action="#"
                      method="get">
                    <div class="form-group">
                        <label for="times">总学时</label>
                        <input type="text" class="form-control" id="times" placeholder="总学时"
                               name="times">
                    </div>


                    <div class="form-group">
                        <label for="utilization">利用率</label>
                        <input type="text" class="form-control" id="utilization" placeholder="利用率"
                               name="utilization">
                    </div>

                </form>
            </div>
        </div>

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


        <%--<script type="text/javascript" src="<%=basePath%>excel/jquery.js"></script>--%>
        <script type="text/javascript" src="<%=basePath%>excel/pdfmake.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>excel/vfs_fonts.js"></script>
        <!--
        <script type="text/javascript" src="../libs/pdfmake/mirza_fonts.js"></script>
        -->
        <script type="text/javascript" src="<%=basePath%>excel/FileSaver.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>excel/tableExport.js"></script>
        <script type="text/javascript" src="<%=basePath%>excel/html2canvas.min.js"></script>

    <script>

        var s = 0;
        $("table").each(function(){  // 获取表格table中，第几个td的文本
            for (var i = 1; i < $(this).find("tr").length; i++) {
               var  t = $(this).find('tr').eq(i).find('td').eq(7).text();
               s = Number(s) +Number(t) ;
            }
        })
        $("#times").val(s);

        var ut;
        var room_id = $("#room_id").val();
        var allLab = $("#allLab").val();
        if (room_id == null || room_id == "" || room_id == 0){
            ut = s/(20*5*8*allLab);
        }else {
            ut = s/(20*5*8);
        }

        ut = ut.toFixed(4);
        $("#utilization").val(ut);

        function submitForm() {
            var form = document.getElementById("myform");
            form.submit();
        }


    </script>


</body>

</html>