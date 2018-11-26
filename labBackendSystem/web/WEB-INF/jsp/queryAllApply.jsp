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

    <title>查询课表</title>

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

    <!-- HTML5Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">

    </script>
    <style>

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
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i> <a
                            href="/admini/first.action">首页</a></li>
                    <li><a href="javascript:void(0)">预约查询</a></li>
                    <li><a href="#">实验室课表</a></li>
                </ul>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">实验室查询</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading" style="padding-bottom: 0px;padding-top: 11px;height: 55px;padding-left: 0px">
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


                                &nbsp;&nbsp;&nbsp;

                                <div class="btn-group">
                                    <button class="btn btn btn-info"
                                            onClick="$('.exceldown').tableExport({type:'excel', pdfmake:{enabled:true}});">
                                        下载
                                    </button>

                                </div>

                                &nbsp;&nbsp;&nbsp;

                            </form>
                        </div>


                    </div>


                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row">
                            <div class=" col-md-12">
                                <div class="table-responsive" id="table">


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

        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

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




    $(function () {


        for (var i = 1; i <= 20; i++) {
            var table = "<table width=\"100%\" class=\"table exceldown\"\n" +
                "                                               style=\"text-align: center;\">\n" +
                "                                            <thead>\n" +
                "                                            <tr class=\"info\">\n" +
                "                                            <tr>\n" +
                "                                                <th scope=\"col\">周</th>\n" +
                "                                                <th scope=\"col\">星期/节次</th>\n" +
                "                                                <th scope=\"col\"><div style=\"padding: 8px 8px;border-radius:8px;width: 100px;\">  星期一</div></th>\n" +
                "                                                <th scope=\"col\"><div style=\"padding: 8px 8px;border-radius:8px;width: 100px;\">  星期二</div></th>\n" +
                "                                                <th scope=\"col\"><div style=\"padding: 8px 8px;border-radius:8px;width: 100px;\">  星期三</div></th>\n" +
                "                                                <th scope=\"col\"> <div style=\"padding: 8px 8px;border-radius:8px;width: 100px;\">  星期四</div></th>\n" +
                "                                                <th scope=\"col\"><div style=\"padding: 8px 8px;border-radius:8px;width: 100px;\">  星期五</div></th>\n" +
                "                                                <th scope=\"col\"><div style=\"padding: 8px 8px;border-radius:8px;width: 100px;\">  星期六</div></th>\n" +
                "                                                <th scope=\"col\"><div style=\"padding: 8px 8px;border-radius:8px;width: 100px;\">  星期天</div></th>\n" +
                "                                            </tr>\n" +
                "                                            </tr>\n" +
                "                                            </thead>\n" +
                "\n" +
                "\n" +
                "                                            <tbody style=\"text-align: center;\">\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <td  rowspan=\"12\">第" + i + "周</td>\n" +
                "                                                <th scope=\"row\">1节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_1\">\n" +
                "                                                    <%--<input type=\"checkbox\" id=\"11\" value=\"11\">--%>\n" +
                "                                                </td>\n" +
                "                                                <td id=\"table" + i + "_2_1\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_1\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_1\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_1\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_1\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_1\"></td>\n" +
                "\n" +
                "                                            </tr>\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <th scope=\"row\">2节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_2\"></td>\n" +
                "                                                <td id=\"table" + i + "_2_2\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_2\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_2\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_2\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_2\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_2\"></td>\n" +
                "                                            </tr>\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <th scope=\"row\">3节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_3\"></td>\n" +
                "                                                <td id=\"table" + i + "_2_3\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_3\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_3\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_3\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_3\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_3\"></td>\n" +
                "                                            </tr>\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <th scope=\"row\">4节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_4\"></td>\n" +
                "                                                <td id=\"table" + i + "_2_4\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_4\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_4\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_4\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_4\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_4\"></td>\n" +
                "                                            </tr>\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <th scope=\"row\">5节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_5\"></td>\n" +
                "                                                <td id=\"table" + i + "_2_5\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_5\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_5\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_5\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_5\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_5\"></td>\n" +
                "                                            </tr>\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <th scope=\"row\">6节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_6\"></td>\n" +
                "                                                <td id=\"table" + i + "_2_6\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_6\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_6\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_6\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_6\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_6\"></td>\n" +
                "                                            </tr>\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <th scope=\"row\">7节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_7\">\n" +
                "                                                </td>\n" +
                "                                                <td id=\"table" + i + "_2_7\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_7\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_7\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_7\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_7\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_7\"></td>\n" +
                "\n" +
                "                                            </tr>\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <th scope=\"row\">8节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_8\"></td>\n" +
                "                                                <td id=\"table" + i + "_2_8\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_8\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_8\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_8\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_8\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_8\"></td>\n" +
                "                                            </tr>\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <th scope=\"row\">9节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_9\"></td>\n" +
                "                                                <td id=\"table" + i + "_2_9\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_9\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_9\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_9\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_9\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_9\"></td>\n" +
                "                                            </tr>\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <th scope=\"row\">10节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_10\"></td>\n" +
                "                                                <td id=\"table" + i + "_2_10\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_10\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_10\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_10\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_10\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_10\"></td>\n" +
                "                                            </tr>\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <th scope=\"row\">11节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_11\"></td>\n" +
                "                                                <td id=\"table" + i + "_2_11\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_11\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_11\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_11\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_11\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_11\"></td>\n" +
                "                                            </tr>\n" +
                "                                            <tr style=\"height: 80px\">\n" +
                "                                                <th scope=\"row\">12节\n" +
                "                                                </th>\n" +
                "                                                <td id=\"table" + i + "_1_12\"></td>\n" +
                "                                                <td id=\"table" + i + "_2_12\"></td>\n" +
                "                                                <td id=\"table" + i + "_3_12\"></td>\n" +
                "                                                <td id=\"table" + i + "_4_12\"></td>\n" +
                "                                                <td id=\"table" + i + "_5_12\"></td>\n" +
                "                                                <td id=\"table" + i + "_6_12\"></td>\n" +
                "                                                <td id=\"table" + i + "_7_12\"></td>\n" +
                "                                            </tr>\n" +
                "                                            </tbody>\n" +
                "                                        </table>"

            $("#table").append(table);

        }
    })

    function getApply() {


        $.ajax({
            type: "get",
            url: "<%=basePath%>apply/queryByWeek.action",
            data: $('#queryApply').serialize(),
            success: function (data) {
                //清空课程表
                for (k = 1; k <= 20; k++) {

                    for (var i = 1; i < 13; i++) {
                        for (var j = 1; j < 8; j++) {

                            $("#table" + k + "_" + j + "_" + i).html("<div style='background-color: #E7EAED;padding: 8px 8px; color: #FFFFFF;border-radius:8px;width: 100px;' ><br><br><br></div>");
                        }
                    }

                }

                //遍历课程表
                for (var i = 0; i < data.length; i++) {

                    $("#table" + data[i].apply_week + "_" + data[i].apply_day + "_" + data[i].apply_section).html("<div style='background-color: " + data[i].user_color + ";padding: 8px 8px;color: #FFFFFF;border-radius:8px;width: 100px;' >" + data[i].course_name + "<br>" + data[i].course_class + "<br>" + data[i].user_name + "</div>");


                    // $("#table" + data[i].apply_week + "_" + data[i].apply_day + "_" + data[i].apply_section).html(data[i].course_name + "<br>" + data[i].course_class + "<br>" + data[i].user_name);
                }
            },
            error: function (data) {
                alert("ajax调用失败!");
            }
        });
    }


</script>


</body>

</html>