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

    <title>实验室预约</title>

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

    <!-- HTML5Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">

    </script>

    <style type="text/css">
        .error{
            color:red
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
                        <a href="主页.html">首页</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">实验室预约</a>
                    </li>
                    <li>
                        <a href="实验室管理.html">单向预约</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">实验室预约</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <div class="panel panel-default " >
            <div class="panel-body">
                <form class="form-inline" action="${pageContext.request.contextPath }/lab/list.action"
                      method="get">
                    <div class="form-group">
                        <label for="roomCode">房间号</label>
                        <input type="text" class="form-control" id="roomCode" placeholder="房间号" value="${vo.roomCode }"
                               name="roomCode">
                    </div>

                    <div class="form-group">
                        <label for="add_college">学院</label>
                        <select class="form-control" id="add_college" name="roomCollege">
                            <option value="">--请选择--</option>
                            <c:forEach items="${fromCollege}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == vo.roomCollege}"> selected</c:if>
                                >
                                        ${item.dict_item_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">查询</button>

                </form>

            </div>
        </div>


        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        实验室
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover"
                               style="text-align: center;">
                            <thead>
                            <tr class="info">
                                <td>序号</td>
                                <td>房间号</td>
                                <td>实验室名称</td>
                                <td>人数</td>
                                <td>所属学院</td>
                                <td>备注</td>
                                <td>编辑</td>
                            </tr>
                            </thead>

                            <tbody>

                            <c:forEach items="${page.rows }" var="lab" varStatus="vs">
                                <tr>
                                    <td>${vs.count}</td>
                                    <td>${lab.room_code }</td>
                                    <td>${lab.room_name }</td>
                                    <td>${lab.place_count }</td>
                                    <td>${lab.room_college }</td>
                                    <td>${lab.room_memo }</td
                                    <td>

                                    </td>
                                    <td>
                                        <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                           data-target="#applyLabDialog"
                                           onclick="save(${lab.room_id})">
                                            <i class="ace-icon fa fa-pencil"></i>
                                            预约
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="col-md-12 text-right">
                            <itcast:page url="${pageContext.request.contextPath }/lab/list.action"/>
                        </div>

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <%--实验室预约对话框--%>
        <div class="modal fade" id="applyLabDialog" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myaddLabel">实验室预约</h4>
                    </div>
                    <div class="modal-body">
                                <div class="panel-heading" style="padding-bottom: 23px;">
                                        <form action="" id="queryApply">
                                            <div class="btn-group">
                                                <select class="form-control" name="apply_week">
                                                    <option value="1" onclick="getApply(1,)">第一周</option>
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
                                        </form>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">

                                            <div class="table-responsive">
                                                <table width="100%" class="table table-bordered "
                                                       style="text-align: center;">
                                                    <thead >
                                                    <tr class="info">
                                                    <tr >
                                                        <th scope="col"></th>
                                                        <th scope="col">星期一</th>
                                                        <th scope="col">星期二</th>
                                                        <th scope="col">星期三</th>
                                                        <th scope="col">星期四</th>
                                                        <th scope="col">星期五</th>
                                                        <th scope="col">星期六</th>
                                                        <th scope="col">星期天</th>
                                                    </tr>
                                                    </tr>
                                                    </thead>


                                                    <tbody style="text-align: center;">
                                                    <tr style="height: 80px">
                                                        <th scope="row">1-2节
                                                        </th>
                                                        <td id="table_1_1"></td>
                                                        <td id="table_2_1"></td>
                                                        <td id="table_3_1"></td>
                                                        <td id="table_4_1"></td>
                                                        <td id="table_5_1"></td>
                                                        <td id="table_6_1"></td>
                                                        <td id="table_7_1"></td>

                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <th scope="row">3-4节
                                                        </th>
                                                        <td id="table_1_2"></td>
                                                        <td id="table_2_2"></td>
                                                        <td id="table_3_2"></td>
                                                        <td id="table_4_2"></td>
                                                        <td id="table_5_2"></td>
                                                        <td id="table_6_2"></td>
                                                        <td id="table_7_2"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <th scope="row">5-6节
                                                        </th>
                                                        <td id="table_1_3"></td>
                                                        <td id="table_2_3"></td>
                                                        <td id="table_3_3"></td>
                                                        <td id="table_4_3"></td>
                                                        <td id="table_5_3"></td>
                                                        <td id="table_6_3"></td>
                                                        <td id="table_7_3"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <th scope="row">7-8节
                                                        </th>
                                                        <td id="table_1_4"></td>
                                                        <td id="table_2_4"></td>
                                                        <td id="table_3_4"></td>
                                                        <td id="table_4_4"></td>
                                                        <td id="table_5_4"></td>
                                                        <td id="table_6_4"></td>
                                                        <td id="table_7_4"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <th scope="row">9-10节
                                                        </th>
                                                        <td id="table_1_5"></td>
                                                        <td id="table_2_5"></td>
                                                        <td id="table_3_5"></td>
                                                        <td id="table_4_5"></td>
                                                        <td id="table_5_5"></td>
                                                        <td id="table_6_5"></td>
                                                        <td id="table_7_5"></td>
                                                    </tr>
                                                    <tr style="height: 80px">
                                                        <th scope="row">11-12节
                                                        </th>
                                                        <td id="table_1_6"></td>
                                                        <td id="table_2_6"></td>
                                                        <td id="table_3_6"></td>
                                                        <td id="table_4_6"></td>
                                                        <td id="table_5_6"></td>
                                                        <td id="table_6_6"></td>
                                                        <td id="table_7_6"></td>
                                                    </tr>
                                                    </tbody>
                                                </table>

                                                <div class="col-md-4 col-md-offset-4">
                                                    <div class=" panel-default">

                                                        <div class="panel-body">
                                                            <form role="form">
                                                                <div class="form-group">



                                                                    <select class="form-control">

                                                                        <option value="">选择课程</option>
                                                                        <c:forEach items="${CourseList }" var="course">

                                                                            <option value="${course.couid }">${course.couname }</option>

                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <button type="submit"
                                                                        class="btn btn-lg btn-success btn-block">提交
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.table-responsive -->
                                        <div class="col-lg-8">
                                            <div id="morris-bar-chart"></div>
                                        </div>
                                        <!-- /.col-lg-8 (nested) -->
                                </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <!-- /#wrapper -->

    <script src="<%=basePath%>jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

    <script src="<%=basePath%>morrisjs/morris.min.js"></script>
    <%--表单校验--%>
    <script src="<%=basePath%>jquery/jquery.validate.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=basePath%>dist/js/sb-admin-2.js"></script>

    <script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>

    <script>

        function save(id){
            var room_id = id;
        }

        function getApply() {
            $.ajax({
                type:"get",
                url:"<%=basePath%>apply/query.action",
                data:{"room_id":room_id},
                success:function(data) {
                    //清空课程表
                    for(var i=1;i<7;i++){
                        for(var j=1;j<8;j++){
                            $("#table_"+j+"_"+i).html("<input type=\"checkbox\" id=\"inlineCheckbox1\" value=\"option1\">");
                        }
                    }
                    //遍历课程表
                    for (var i=0;i<data.length;i++) {
                        $("#table_"+data[i].apply_day+"_"+data[i].apply_section).html(data[i].course_name+"<br>"+data[i].room_name+"<br>"+data[i].user_name);
                    }
                }
            });


        }

    </script>


</body>

</html>