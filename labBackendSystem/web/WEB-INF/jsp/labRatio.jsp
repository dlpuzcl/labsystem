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

    <title>实验室添加</title>

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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <script src="<%=basePath%>jquery/jquery.min.js"></script>
    <script src="<%=basePath%>bootstrap/js/Chart.js" type="text/javascript"></script>


    <![endif]-->
    <style type="text/css">
        .error {
            color: red
        }
    </style>
</head>

<body onload="queryLabRatio()">

<div id="wrapper">

    <%@ include file="/WEB-INF/jsp/navigation.jsp" %>
    <button onload="queryLabRatio()"></button>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">实验室利用率</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <!-- /.col-lg-6 -->
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    利用率
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="morris-bar-chart"></div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>

        <!-- /.col-lg-6 -->
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    总利用率
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="morris-donut-chart"></div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>


        <!-- /.row -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->

<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

<script src="<%=basePath%>morrisjs/morris.min.js"></script>

<script src="<%=basePath%>morrisjs/morris-data.js"></script>

<script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>

<script src="<%=basePath%>jquery/raphael/raphael.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>dist/js/sb-admin-2.js"></script>
<!-- 引入表单校验jquery插件 -->
<script src="<%=basePath%>jquery/jquery.validate.min.js"></script>
<script>


    function queryLabRatio() {



        $.ajax({
            type: "get",
            url: "<%=basePath%>apply/labRatio.action",
            success: function (data) {

                Morris.Bar({
                    element: 'morris-bar-chart',
                    data: data,
                    xkey: 'label',
                    ykeys: ['value'],
                    labels: ['label'],
                    hideHover: 'auto',
                    resize: true
                });

            }
        })


        $.ajax({
            type: "get",
            url: "<%=basePath%>apply/labRatioSum.action",
            success: function (data) {

               var t = 1 - data.value;

                new Morris.Donut({
                    element: 'morris-donut-chart',
                    colors: ["#3c8dbc", "#f56954", "#00a65a"],
                    data:[data,{
                        label :"未利用率",
                        value:t

                    }],
                    resize: true
                });
            }
        })
    }


</script>

</body>

</html>