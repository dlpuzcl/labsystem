<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
    <style>
        /*a:link,a:visited{color:#444;text-decoration:none;}*/
        /*a:hover{color:#ff0000;}*/
        .huge {
            font-size: 33px;
        }
    </style>
</head>
<body>

<!-- /.row -->
<div class="row">
    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
        <div class="panel panel-primary">
            <a href="/front/courseTable.action">
                <div class="panel-heading" style="background-color:#337AB7;color:#FFFFFF;padding-color:#337AB7;">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-calendar fa-4x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">首页</div>
                            <div></div>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <span class="pull-left">查看详情</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
        <div class="panel panel-green">
            <a href="/frontCourse/list.action?id=${user.user_id}">
                <div class="panel-heading" style="background-color:#60B860;color:#FFFFFF;padding-color:#60B860;">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-tasks fa-4x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">课程</div>
                            <div></div>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <span class="pull-left">查看详情</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
        <div class="panel panel-yellow">
            <a href="/front/apply.action">
                <div class="panel-heading" style="background-color:#E8A74B;color:#FFFFFF;padding-color:#E8A74B;">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-shopping-cart fa-4x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">预约</div>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <span class="pull-left">查看详情</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
        <div class="panel panel-red">
            <a href="/front/queryApplyByUser.action?userName=${user.user_id}">
                <div class="panel-heading" style="background-color:#D9534F;color:#FFFFFF;padding-color:#D9534F;">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-support fa-4x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">已约</div>
                            <div></div>
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <span class="pull-left">查看详情</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
</div>
<!-- /.row -->


</body>
</html>