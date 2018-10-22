<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="Keywords" content="网站关键词">
    <meta name="Description" content="网站介绍">
    <link rel="stylesheet" href="<%=basePath%>./css/base.css">
    <link rel="stylesheet" href="<%=basePath%>./css/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>./css/reg.css">
</head>
<body>
<div id="ajax-hook"></div>
<div class="wrap">
    <div class="wpn">
        <div class="form-data pos">
            <a href=""><img src="<%=basePath%>./img/logo.png" class="head-logo"></a>
            <div class="change-login">
                <p class="account_number on">教师登录</p>
                <p class="message">管理员登录</p>
            </div>
            <div class="form1">
                <form id="form1">
                    <p class="p-input pos">
                        <label for="num">手机号/用户名/邮箱</label>
                        <input type="text" id="num" name="user_name">
                        <span class="tel-warn num-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                    </p>
                    <p class="p-input pos">
                        <label for="pass">请输入密码</label>
                        <input type="password" style="display:none"/>
                        <input type="password" id="pass" autocomplete="new-password" name="user_password">
                        <span class="tel-warn pass-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                    </p>
                    <p class="p-input pos code">
                        <label for="veri">请输入验证码</label>
                        <input type="text" id="veri">
                        <img src="/getpatchcaImage.action" id="img1">
                        <%--<span class="tel-warn img-err hide"><em>验证码错误，请重新输入</em><i class="icon-warn"></i></span>--%>
                        <!-- <a href="javascript:;">换一换</a> -->
                    </p>
                    <div class="r-forget cl">
                        <div class="tel-warn img-err hide"><em>验证码错误，请重新输入</em><i class="icon-warn"></i></div>

                    <%--<a href="#" class="z">账号注册</a>--%>
                        <%--<a href="#" class="y">忘记密码</a>--%>
                    </div>
                </form>
                <button class="lang-btn off log-btn" onclick="Btn()"> 登录</button>

            </div>
            <div class="form2 hide">

                <form action="<%=basePath%>login/admini.action" id="form2">
                    <p class="p-input pos">
                        <label for="num2">用户名</label>
                        <input type="text" id="num2" name="admini_name">
                        <span class="tel-warn num-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                    </p>
                    <p class="p-input pos">
                        <label for="pass2">请输入密码</label>
                        <input type="password" style="display:none"/>
                        <input type="password" id="pass2" name="admini_password" autocomplete="new-password">
                        <span class="tel-warn pass-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                    </p>
                    <p class="p-input pos code ">
                        <label for="veri2">请输入验证码</label>
                        <input type="text" id="veri2">
                        <img src="/getpatchcaImage.action" id="img2">
                        <span class="tel-warn img-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                        <!-- <a href="javascript:;">换一换</a> -->
                    </p>
                    <div class="r-forget cl">
                        <a href="#" class="z">账号注册</a>
                        <a href="#" class="y">忘记密码</a>
                    </div>
                </form>
                <button class="lang-btn" id="btn2" onclick="Btn2()"> 登录</button>

            </div>
            <%--<div class="r-forget cl">--%>
            <%--<a href="./reg.html" class="z">账号注册</a>--%>
            <%--<a href="./getpass.html" class="y">忘记密码</a>--%>
            <%--</div>--%>
            <%--<button class="lang-btn off log-btn" > 登录</button>--%>
            <%--<div class="third-party">--%>
            <%--<a href="#" class="log-qq icon-qq-round"></a>--%>
            <%--<a href="#" class="log-qq icon-weixin"></a>--%>
            <%--<a href="#" class="log-qq icon-sina1"></a>--%>
            <%--</div>--%>
            <p class="right">Powered by © 2018</p>
        </div>
    </div>



</div>


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

<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

<script src="<%=basePath%>./js/jquery.js"></script>
<script src="<%=basePath%>./js/agree.js"></script>
<script src="<%=basePath%>./js/login.js"></script>

<script>
    function Btn() {

        var code = $("#veri").val();

        $.ajax({
            type:"POST",
            url:"<%=basePath%>validateCode.action",
            dataType:"text",
            data:'code='+code,
            success:function(data){
                if(data=="true"){

                    $.post("<%=basePath%>login/user.action", $("#form1").serialize(), function (data) {



                        if (data == "0") {
                            window.location = "<%=basePath%>front/apply.action"
                        } else if (data == "1") {
                            $(".message").addClass("on");

                            $('.pass-err').removeClass('hide').find('em').text(data.msg);
                            $('.num-err').removeClass('hide').find('em').text(data.msg);
                            $('.num-err').find('i').attr('class', 'icon-warn').css("color", "#d9585b");

                            $('.pass-err').find('i').attr('class', 'icon-warn').css("color", "#d9585b");
                            $('.code').removeClass('hide');
                        }

                    });
                }else{

                    alert("验证码错误！")

                    var a = "<%=basePath%>getpatchcaImage.action"
                    $("#img1").attr("src", a);


                }
            },
            error:function(data){
                alert("ajax调用失败!");
            }
        });









    }

    function Btn2() {

        var code = $("#veri2").val();

        $.ajax({
            type:"POST",
            url:"<%=basePath%>validateCode.action",
            dataType:"text",
            data:'code='+code,
            success:function(data){
                if(data=="true"){

                    $.post("<%=basePath%>login/admini.action", $("#form2").serialize(), function (data) {

                        if (data == "0") {
                            window.location = "<%=basePath%>admini/first.action"
                        } else if (data == "1") {

                            $(".message").addClass("on");
                            $(".account_number").removeClass("on");
                            $(".form2").removeClass("hide");
                            $(".form1").addClass("hide");
                            $('.pass-err').removeClass('hide').find('em').text(data.msg);
                            $('.pass-err').find('i').attr('class', 'icon-warn').css("color", "#d9585b");
                            $('.num-err').removeClass('hide').find('em').text(data.msg);
                            $('.num-err').find('i').attr('class', 'icon-warn').css("color", "#d9585b");
                            $('.code').removeClass('hide');
                        }
                    });

                }else{

                    alert("验证码错误！")

                    var a = "<%=basePath%>getpatchcaImage.action"
                    $("#img2").attr("src", a);


                }
            },
            error:function(data){
                alert("ajax调用失败!");
            }
        });




    }

    $("#img1").click(function(){
        var a = "<%=basePath%>getpatchcaImage.action"
        $("#img1").attr("src", a);
    });
    $("#img2").click(function(){
        var a = "<%=basePath%>getpatchcaImage.action"
        $("#img2").attr("src", a);
    });


</script>
</body>
</html>