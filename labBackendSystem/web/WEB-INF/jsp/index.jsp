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
                <form id="admini_login">
                    <p class="p-input pos">
                        <label for="name_emil">用户名/邮箱</label>
                        <input type="text" id="name_emil">
                        <span class="tel-warn num-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                    </p>
                    <p class="p-input pos">
                        <label for="user_password">请输入密码</label>
                        <input type="password" style="display:none"/>
                        <input type="password" id="user_password" autocomplete="new-password">
                        <span class="tel-warn pass-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                    </p>

                    <p class="p-input pos code ">
                        <label for="veri">请输入验证码</label>
                        <input type="text" id="code">
                        <img src="">
                        <span class="tel-warn img-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                        <!-- <a href="javascript:;">换一换</a> -->
                    </p>
                    <div class="r-forget cl">
                        <a href="./reg.html" class="z">账号注册</a>
                        <a href="./getpass.html" class="y">忘记密码</a>
                    </div>
                    <button class="lang-btn">登录</button>
                </form>
            </div>
            <div class="form2 hide">
                <form action="${pageContext.request.contextPath }/admini/login.action">
                    <p class="p-input pos">
                        <label for="admini_name">管理员</label>
                        <input type="text" id="admini_name" name="admini_name">
                        <span class="tel-warn num-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                    </p>
                    <p class="p-input pos">
                        <label for="admini_password">请输入密码</label>
                        <input type="password" style="display:none"/>
                        <input type="password" id="admini_password" autocomplete="new-password" name="admini_password">
                        <span class="tel-warn pass-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                    </p>

                    <p class="p-input pos code hide">
                        <label for="veri">请输入验证码</label>
                        <input type="text" id="veri">
                        <img src="">
                        <span class="tel-warn img-err hide"><em>账号或密码错误，请重新输入</em><i class="icon-warn"></i></span>
                        <a href="javascript:;">换一换</a>
                    </p>
                    <div class="r-forget cl">
                        <a href="./reg.html" class="z">账号注册</a>
                        <a href="./getpass.html" class="y">忘记密码</a>
                    </div>
                    <button class="lang-btn">登录</button>
                </form>
            </div>


            <!--<div class="third-party">
                <a href="#" class="log-qq icon-qq-round"></a>
                <a href="#" class="log-qq icon-weixin"></a>
                <a href="#" class="log-qq icon-sina1"></a>
            </div>-->
            <p class="right">Powered by © 2018</p>
        </div>
    </div>
</div>
<script src="<%=basePath%>./js/jquery.js"></script>
<script src="<%=basePath%>./js/agree.js"></script>
<script src="<%=basePath%>./js/login.js"></script>
</body>
</html>