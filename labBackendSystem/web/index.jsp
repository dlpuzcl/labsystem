<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>


<!DOCTYPE HTML>
<html>

<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=basePath%>css/style3.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>sweetalert/sweetalert.css">

    <script src="js/jquery-1.10.2.min.js"></script>
    <style type="text/css">
        .error_page {
            box-sizing: border-box;
            height: 100vh;
            background: url("<%=basePath%>/img/bj.jpg") no-repeat center;
            background-size: auto 100vh;
            position: relative;

        }

        body {
            background-color: #3895e8;
        }
        .login input[type="password"] {
            background: url("<%=basePath%>img/icons.png") no-repeat 13px -36px;
        }
        .login input[type="text"] {
            background: url("<%=basePath%>img/icons.png") no-repeat 14px 13px;;
        }
        .nav>li>a {
            text-align: center;
        }

    </style>
</head>

<body>
<!--/login-->

<div class="error_page">

    <!--/login-top-->

    <div class="error-top" style="margin-top: 110px;border-radius: 10px;">
        <h2 class="inner-tittle page"></h2>
        <div class="login">
            <h3 class="inner-tittle t-inner">登录</h3>
            <div class="buttons login" style="margin-bottom: 24px;">
                <ul class="nav  padding-18">
                    <li class="active">
                        <a data-toggle="tab" class="hvr-sweep-to-right" href="#user">
                            用户
                        </a>
                    </li>
                    <li class="lost">
                        <a data-toggle="tab" class="hvr-sweep-to-left" href="#admini">
                            管理员
                        </a>
                    </li>

                </ul>
            </div>
            <div class="tab-content no-border padding-24">
                <div id="user" class="tab-pane in active">
                    <form id="form1">

                        <input type="text" class="text" id="num" name="user_name" placeholder="工号/手机号/邮箱">
                        <input type="password" id="pass" name="user_password" placeholder="请输入密码">

                        <div class="">
                            <label style="width: 59%;" class="pull-left">
                                <input type="text" id="veri" placeholder="请输验证码">
                            </label>

                            <label>
                                <img src="<%=basePath%>getpatchcaImage.action" id="img1" style="width: 7em;margin-top: 2px;">
                            </label>
                        </div>
                    </form>
                    <div class="submit"><input type="submit" onclick="Btn()" value="Login"></div>

                    <div class="new">

                    </div>

                </div>

                <div id="admini" class="tab-pane">
                    <form id="form2">
                        <input type="text" class="text" id="num2" name="admini_name" placeholder="管理员账号">
                        <input type="password" id="pass2" name="admini_password" placeholder="请输入密码">

                        <div class="">
                            <label style="width: 59%;" class="pull-left">
                                <input type="text" id="veri2" placeholder="请输验证码">
                            </label>
                            <label><img src="<%=basePath%>getpatchcaImage.action" id="img2" style="width: 7em;margin-top: 2px;"></label>
                        </div>
                    </form>
                    <div class="submit"><input type="submit" onclick="Btn2()" value="Login"></div>


                    <div class="new">


                    </div>


                </div>
            </div>
        </div>
    </div>

    <!--//login-top-->
    <div class="footer" style="margin-top: 530px;">
        <p>Copyright &copy; 2018.dlpuzcl臧成龙

        </p>
    </div>
</div>

<!--//login-->
<!--footer section start-->

<!--footer section end-->
<!--/404-->
<!--js -->
<script src="<%=basePath%>jquery/jquery.min.js"></script>
<script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script>
    function Btn() {

        var code = $("#veri").val();
        $("input[type=submit]").attr('disabled', true)//在按钮提交之后和AJAX提交之前将按钮设置为禁用
        $.ajax({
            type: "POST",
            url: "<%=basePath%>validateCode.action",
            dataType: "text",
            data: 'code=' + code,
            success: function (data) {
                if (data == "true") {

                    $.post("<%=basePath%>login/user.action", $("#form1").serialize(), function (data) {


                        if (data.status == 200) {
                            window.location = "<%=basePath%>front/apply.action"
                        }
                        if (data.status == 300) {
                            swal("提示", data.msg, "error")
                        }
                        if (data.status == 400) {
                            swal("提示", data.msg, "error")
                        }
                        if (data.status == 500) {
                            swal("提示", data.msg, "error")
                        }

                    });
                } else {

                    swal("提示", "验证码错误", "error")

                    $("#img1").attr("src", "<%=basePath%>getpatchcaImage.action");


                }
                $("input[type=submit]").attr('disabled', false)//在提交成功之后重新启用该按钮

            },
            error: function (data) {
                swal("提示", "ajax调用失败", "error")
                $("button[type=submit]").attr('disabled', false)//在提交成功之后重新启用该按钮

            }
        });

    }


    function Btn2() {

        var code = $("#veri2").val();
        $("input[type=submit]").attr('disabled', true)//在按钮提交之后和AJAX提交之前将按钮设置为禁用

        $.ajax({
            type: "POST",
            url: "<%=basePath%>validateCode.action",
            dataType: "text",
            data: 'code=' + code,
            success: function (data) {
                if (data == "true") {

                    $.post("<%=basePath%>login/admini.action", $("#form2").serialize(), function (data) {

                        if (data == 0) {
                            window.location = "<%=basePath%>admini/first.action"
                        }
                        else {

                            swal("提示", "账号或密码错误", "error")
                        }
                    });

                } else {

                    swal("提示", "验证码错误", "error")


                    $("#img2").attr("src", "<%=basePath%>getpatchcaImage.action");


                }
                $("input[type=submit]").attr('disabled', false)//在提交成功之后重新启用该按钮
            },
            error: function (data) {
                swal("提示", "ajax调用失败", "error")
                $("input[type=submit]").attr('disabled', false)//在提交成功之后重新启用该按钮
            }
        });


    }

    $("#img1").click(function () {


        document.getElementById('img1').src = "<%=basePath%>getpatchcaImage.action";
    });
    $("#img2").click(function () {
        $("#img2").attr("src", "<%=basePath%>getpatchcaImage.action");
    });
</script>

</body>

</html>