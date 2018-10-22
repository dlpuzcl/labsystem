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
                        <a href="#">学期设置</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="color: red">当前学期为：${itermYear.years}学年——第${itermYear.iterm}学期</h1>
                <h1 class="page-header">学期设置</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        请认真填写以下数据
                    </div>
                    <div class="panel-body">
                        <div class="row">

                            <div class="col-xs-12">
                                <!-- PAGE CONTENT BEGINS -->
                                <form class="form-horizontal" id="set_iterm_form" action="">

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">学年</label>
                                        <div class="col-lg-5">
                                            <select class="form-control" id="years" name="years">
                                                <option value="">--请选择学年--</option>

                                                <option value="2018～2019">2018～2019</option>
                                                <option value="2019～2020">2019～2020</option>
                                                <option value="2020～2021">2020～2021</option>
                                                <option value="2021～2022">2021～2022</option>
                                                <option value="2022～2023">2022～2023</option>
                                                <option value="2023～2024">2023～2024</option>
                                                <option value="2024～2025">2024～2025</option>
                                                <option value="2025～2026">2025～2026</option>
                                                <option value="2026～2027">2026～2027</option>
                                                <option value="2027～2028">2027～2028</option>
                                                <option value="2028～2029">2028～2029</option>
                                                <option value="2029～2030">2029～2030</option>
                                                <option value="2030～2031">2030～2031</option>
                                                <option value="2031～2032">2031～2032</option>
                                                <option value="2032～2033">2032～2033</option>
                                                <option value="2033～2034">2033～2034</option>
                                                <option value="2034～2035">2034～2035</option>
                                                <option value="2035～2036">2035～2036</option>
                                                <option value="2036～2037">2036～2037</option>
                                                <option value="2037～2038">2037～2038</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <label class="col-lg-3 control-label">学期</label>
                                        <div class="col-lg-5">
                                            <select class="form-control" id="iterm" name="iterm">
                                                <option value="">--请选择学期--</option>
                                                <option value="1">第一学期</option>
                                                <option value="2">第二学期</option>

                                            </select>
                                        </div>
                                    </div>


                                    <div class="clearfix form-actions">
                                        <div class="col-md-offset-3 col-md-9">
                                            <button class="btn btn-primary" type="submit">
                                                <i class="ace-icon fa fa-check bigger-110"></i>
                                                立即提交
                                            </button> &nbsp; &nbsp; &nbsp;
                                            <button class="btn" type="reset">
                                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                                重置
                                            </button>
                                        </div>
                                    </div>

                                </form>

                            </div>
                            <!-- /.col -->
                        </div>

                    </div>
                    <!-- /.row (nested) -->
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

<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

<script src="<%=basePath%>morrisjs/morris.min.js"></script>


<script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>


<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>dist/js/sb-admin-2.js"></script>
<!-- 引入表单校验jquery插件 -->
<script src="<%=basePath%>jquery/jquery.validate.min.js"></script>
<script>
    $("#set_iterm_form").validate({
        rules: {

            "years": {
                "required": true,
            },
            "iterm": {
                "required": true,
            }
        },
        messages: {

            "years": {
                "required": "*学年不能为空",
            },
            "iterm": {
                "required": "*学期不能为空",
            }
        },

        submitHandler: function (form) {  //表单提交后要执行的内容
            $.post("<%=basePath%>apply/setIterm.action", $("#set_iterm_form").serialize(), function (data) {
                if (data.status == 200) {
                    alert("设置成功！");
                    window.location = "<%=basePath%>apply/setItermView.action"

                } else {
                    alert(data.msg);
                    window.location.reload();
                }

            });
        },
        invalidHandler: function (form, validator) {  //不通过回调
            return false;
        }
    });

</script>

</body>

</html>