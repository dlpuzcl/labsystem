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

    <title>实验室管理</title>

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
    <link href="<%=basePath%>css/style.css" rel="stylesheet">

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
        th {
            text-align: center;
        }

        table {
            border-collapse: collapse;
            border: solid 0px red;
        }

        table td {
            width: 50px;
            height: 20px;
            border: solid 0px red;
            padding: 0px 10px;
        }
        .error {
            color: red
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
                    <li><a href="javascript:void(0)">预约</a></li>
                    <li><a href="#">单项预约</a></li>
                </ul>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">实验室预约</h1>
            </div>
            <!-- /.col-lg-12 -->
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

                                &nbsp;&nbsp;

                            </form>
                        </div>


                    </div>


                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row">


                            <div class=" col-md-12">

                                <div class="table-responsive" id="jqu">


                                    <table width="100%"
                                           style="text-align: center; " border="0">
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
                                        <div type='inpit/assembly' formname="ack_two">
                                            <button
                                                    class="btn btn-lg btn-success btn-block" type="submit">提交
                                            </button>
                                        </div>
                                    </form>

                                </div>

                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.col-lg-4 (nested) -->

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
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid" id="h5">
                        <%--<h5>预约成功！</h5>--%>
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
<!-- /#wrapper -->

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
<script type="text/javascript" src="<%=basePath%>bootstrap/js/inpitassembly-2.0.js"></script>
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

                        // var checkbox = "<input type='checkbox' name='day_section'  value='" + i + j + "'>"

                        var checkbox = "<div class=\"inpit\" type='inpit/assembly' formname=\"ack_two\">\n" +
                            "                                                        <div class=\"li \" radio index ='" + i + j + "' >\n" +
                            "                                                            <div name=\"two-a\" class=\"style_a\" value=\"" + i + j + "\">\n" +
                            "                                                               \n" +
                            "                                                                \n" +
                            "                                                            </div>\n" +
                            "                                                        </div>\n" +
                            "\n" +
                            "                                                    </div>"


                        $("#table_" + j + "_" + i).html(checkbox);
                    }
                }
                // //遍历课程表
                // for (var i = 0; i < data.length; i++) {
                //
                //     var da = "<div class=\"inpit\" type='inpit/assembly' formname=\"ack_two\">\n" +
                //         "                                                        <div class=\"li \" radio index ='" + i + j + "' >\n" +
                //         "                                                            <div name=\"two-a\" disabled value=\"" + i + j + " \">\n" +
                //         "                                                               " + data[i].course_name + "<br> \n" +
                //         "                                                                " + data[i].course_class + "<br>\n" +
                //         "                                                                " + data[i].user_name + "<br>\n" +
                //         "                                                            </div>\n" +
                //         "                                                        </div>\n" +
                //         "\n" +
                //         "                                                    </div>"
                //
                //     $("#table_" + data[i].apply_day + "_" + data[i].apply_section).html(da);
                //
                //     // $("#table_" + data[i].apply_day + "_" + data[i].apply_section).html(data[i].course_name + "<br>" + data[i].course_class + "<br>" + data[i].user_name);
                // }


                //遍历课程表
                for (var i = 0; i < data.length; i++) {

                    var da = "<div class=\"inpit\" type='inpit/assembly' formname=\"ack_two\">\n" +
                        "                                                        <div class=\"li \" radio index ='" + i + j + "' >\n" +
                        "                                                            <div name=\"two-a\" disabled value=\"" + i + j + " \">\n" +
                        "                                                              <br> \n" +
                        "                                                               被选 \n" +
                        "                                                                \n" +
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

    //获取表单的值
    <%--$('#jqu').find("button").click(function () {--%>

        <%--$("#searchModal").modal("show");//显示“正在查询”字样的模态框--%>


        <%--// * ==========================--%>
        <%--// * 向check_result方法传本身--%>
        <%--// * 如果你忘记，inpit/assembly依旧会提醒你--%>
        <%--// * ==========================--%>
        <%--var val = check_result($(this));--%>
        <%--var length = val[0].data.length;--%>
        <%--for (var i = 0; i < length; i++) {--%>
            <%--var d = "day_section=" + val[0].data[i] + "&";--%>
            <%--var sum = d + sum;--%>
        <%--}--%>

        <%--var queryApply = $('#queryApply').serialize();--%>
        <%--var form1 = $('#form1').serialize();--%>
        <%--var formdata = queryApply + '&' + form1 + '&' + sum--%>
        <%--$.ajax({--%>
            <%--type: "get",--%>
            <%--url: "<%=basePath%>apply/submit.action",--%>
            <%--data: formdata,--%>
            <%--success: function (data) {--%>

                <%--$('#searchModal').modal('hide');//服务器停止了5秒,sleep(5)，假设是查询数据用了5秒--%>
                <%--// setTimeout("$('#searchModal').modal('hide')",2000); //设置2000毫秒之后模态框消失--%>


                <%--$('#searchModal').on('hidden.bs.modal', function () {--%>
                    <%--// $("#homeworkContent").html(mydata); //显示后端传递的结果--%>
                    <%--if (data.status == 200) {--%>
                        <%--// alert("预约成功！");--%>
                        <%--swal({title: "提示", text: "预约成功", type: "success"}, function () {--%>

                        <%--});--%>

                    <%--} else {--%>
                        <%--// alert("预约失败！");--%>
                        <%--swal({title: "提示", text: data.msg, type: "error"}, function () {--%>

                        <%--});--%>
                    <%--}--%>
                    <%--getApply();--%>
                <%--});--%>

            <%--}--%>
        <%--})--%>


    <%--});--%>


    $("#form1").validate({
        rules: {

            "room_id": {
                "required": true,
            },
            "user_id": {
                "required": true,
            },

            "course_id": {
                "required": true,
            }

        },
        messages: {

            "room_id": {
                "required": "*实验室不能为空",
            },
            "user_id": {
                "required": "*任课教师不能为空",
            },
            "course_id": {
                "required": "*课程不能为空",
            }
        },

        submitHandler: function (form) {  //表单提交后要执行的内容
            //获取表单的值
            $('#jqu').find("button").click(function () {

                $("#searchModal").modal("show");//显示“正在查询”字样的模态框


                // * ==========================
                // * 向check_result方法传本身
                // * 如果你忘记，inpit/assembly依旧会提醒你
                // * ==========================
                var val = check_result($(this));
                var length = val[0].data.length;
                for (var i = 0; i < length; i++) {
                    var d = "day_section=" + val[0].data[i] + "&";
                    var sum = d + sum;
                }

                var queryApply = $('#queryApply').serialize();
                var form1 = $('#form1').serialize();
                var formdata = queryApply + '&' + form1 + '&' + sum
                $.ajax({
                    type: "get",
                    url: "<%=basePath%>apply/submit.action",
                    data: formdata,
                    success: function (data) {

                        $('#searchModal').modal('hide');//服务器停止了5秒,sleep(5)，假设是查询数据用了5秒
                        // setTimeout("$('#searchModal').modal('hide')",2000); //设置2000毫秒之后模态框消失


                        $('#searchModal').on('hidden.bs.modal', function () {
                            // $("#homeworkContent").html(mydata); //显示后端传递的结果
                            if (data.status == 200) {
                                // alert("预约成功！");
                                swal({title: "提示", text: "预约成功", type: "success"}, function () {

                                });
                                getApply();

                            } else {
                                // alert("预约失败！");
                                swal({title: "提示", text: data.msg, type: "error"}, function () {

                                });
                            }

                        });

                    }
                })


            });

        },
        invalidHandler: function (form, validator) {  //不通过回调
            return false;
        }
    });

</script>


</body>

</html>