<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>管理界面</title>

    <!-- Bootstrap Core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


</head>

<body>

    <div id="wrapper">

       <%@ include file="/navigation.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">主&nbsp;页</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26</div>
                                    <div>新消息!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>新计划!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">14</div>
                                    <div>新课程!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">查看详情</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13</div>
                                    <div>问题反馈！</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
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
            <div class="row">
                
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-area-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 今天课表
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                      	  星期一			
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">星期一</a>
                                        </li>
                                        <li><a href="#">星期二</a>
                                        </li>
                                        <li><a href="#">星期三</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">星期四</a>
                                        </li>
                                        <li><a href="#">星期五</a>
                                        </li>
                                        <li><a href="#">星期六</a>
                                        </li>
                                        <li><a href="#">星期日</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped" style="text-align: center;">
                                            <thead>
                                                <tr>
                                                    <th  style="text-align: center;">#</th>
                                                    <th style="text-align: center;">B217</th>
                                                    <th style="text-align: center;">B227</th>
                                                    <th style="text-align: center;">B322前</th>
                                                    <th style="text-align: center;">B330</th>
                                                    <th style="text-align: center;">B331</th>
                                                    <th style="text-align: center;">B333</th>
                                                    <th style="text-align: center;">B322后</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>第一节</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                </tr>
                                                <tr>
                                                    <td>第二节</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                </tr>
                                                <tr>
                                                    <td>第三节</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                </tr>
                                                <tr>
                                                    <td>第四节</td>
                                                   <td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                </tr>
                                                <tr>
                                                    <td>第五节</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                </tr>
                                                <tr>
                                                    <td>第六节</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                </tr>
                                                <tr>
                                                    <td>第七节</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <<td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>第十节</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                    <td>编译原理<br />王海文</td>
                                                    <td>数据库原理<br />姚春龙</td>
                                                    <td>算法分析<br />邢军</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-8">
                                    <div id="morris-bar-chart"></div>
                                </div>
                                <!-- /.col-lg-8 (nested) -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
               
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="jquery/jquery-1.11.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="raphael/raphael.min.js"></script>
    <script src="morrisjs/morris.min.js"></script>
    <script src="/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>
