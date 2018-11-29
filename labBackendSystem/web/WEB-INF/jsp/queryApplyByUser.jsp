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

    <title>预约查询</title>

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


    <link rel="stylesheet" type="text/css" href="<%=basePath%>sweetalert/sweetalert.css">

    <!-- HTML5Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">

    </script>


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
                        <a href="javascript:void(0)">预约查询</a>
                    </li>
                    <li>
                        <a href="#">教师查询</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">预约查询</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <div class="panel panel-default ">
            <div class="panel-body">
                <form class="form-inline" action="${pageContext.request.contextPath }/apply/queryApplyByUser.action"
                      method="get" id="myform">

                    <div class="form-group">
                        <label for="user">教师</label>
                        <select class="form-control" id="user" name="userName" onchange="submitForm();">>
                            <option value="">--请选择教师--</option>
                            <c:forEach items="${userList}" var="item">
                                <option value="${item.user_id}"
                                        <c:if test="${item.user_id == vo.userName}"> selected</c:if>
                                >
                                        ${item.user_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>


                    <div class="form-group">
                        <label for="user">课程</label>

                        <select class="form-control" id="course" name="courseName">
                            <option value="">--选择课程--</option>
                            <c:forEach items="${courses}" var="item">
                                <option value="${item.course_name}"
                                        <c:if test="${item.course_name == vo.courseName}"> selected</c:if>
                                >
                                        ${item.course_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>


                    <div class="form-group">
                        <label for="user">实验室</label>

                        <select class="form-control" name="roomCode">
                            <option value="">--选择实验室--</option>
                            <c:forEach items="${labRoom }" var="lab" varStatus="vs">

                                <option value="${lab.room_id }"
                                        <c:if test="${lab.room_id == vo.roomCode}"> selected</c:if>
                                >${lab.room_code }</option>

                            </c:forEach>

                        </select>
                    </div>


                    <div class="form-group">
                        <label for="user">周</label>
                        <select class="form-control" name="applyWeek">
                            <option value="">--请选择周--</option>
                            <option value="1" <c:if test="${1 == vo.applyWeek}"> selected</c:if>>
                                第一周
                            </option>
                            <option value="2" <c:if test="${2 == vo.applyWeek}"> selected</c:if>>第二周</option>
                            <option value="3" <c:if test="${3 == vo.applyWeek}"> selected</c:if>>第三周</option>
                            <option value="4" <c:if test="${4 == vo.applyWeek}"> selected</c:if>>第四周</option>
                            <option value="5" <c:if test="${5 == vo.applyWeek}"> selected</c:if>>第五周</option>
                            <option value="6" <c:if test="${6 == vo.applyWeek}"> selected</c:if>>第六周</option>
                            <option value="7" <c:if test="${7 == vo.applyWeek}"> selected</c:if>>第七周</option>
                            <option value="8" <c:if test="${8 == vo.applyWeek}"> selected</c:if>>第八周</option>
                            <option value="9" <c:if test="${9 == vo.applyWeek}"> selected</c:if>>第九周</option>
                            <option value="10" <c:if test="${10 == vo.applyWeek}"> selected</c:if>>第十周</option>
                            <option value="11" <c:if test="${11 == vo.applyWeek}"> selected</c:if>>第十一周</option>
                            <option value="12" <c:if test="${12 == vo.applyWeek}"> selected</c:if>>第十二周</option>
                            <option value="13" <c:if test="${13 == vo.applyWeek}"> selected</c:if>>第十三周</option>
                            <option value="14" <c:if test="${14 == vo.applyWeek}"> selected</c:if>>第十四周</option>
                            <option value="15" <c:if test="${15 == vo.applyWeek}"> selected</c:if>>第十五周</option>
                            <option value="16" <c:if test="${16 == vo.applyWeek}"> selected</c:if>>第十六周</option>
                            <option value="17" <c:if test="${17 == vo.applyWeek}"> selected</c:if>>第十七周</option>
                            <option value="18" <c:if test="${18 == vo.applyWeek}"> selected</c:if>>第十八周</option>
                            <option value="19" <c:if test="${19 == vo.applyWeek}"> selected</c:if>>第十九周</option>
                            <option value="20" <c:if test="${20 == vo.applyWeek}"> selected</c:if>>第二十周</option>
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
                    <div class="panel-heading" style="padding-bottom: 0px;padding-top: 11px;height: 55px;">
                        <div class="pull-right">
                            <button class="btn btn-danger" onclick="deleteAll()">批量删除</button>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class=" col-md-12">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered table-hover"
                                           style="text-align: center;">
                                        <thead>
                                        <tr class="info">
                                            <td><input id="selecteAll" type="checkbox" class="styled"/></td>
                                            <td>序号</td>
                                            <td>周</td>
                                            <td>天</td>
                                            <td>节</td>
                                            <td>上课房间</td>
                                            <td>课程名称</td>
                                            <td>课程性质</td>
                                            <td>上课班级</td>
                                            <td>上课教师</td>
                                            <td>删除</td>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <form id="form1">


                                            <c:forEach items="${page.rows }" var="item" varStatus="vs">
                                                <tr>
                                                    <td><input type="checkbox" id="" name="ids" value="${item.apply_id}"
                                                               class="styled"></td>
                                                    <td>${vs.count}</td>
                                                    <td>${item.apply_week}</td>

                                                    <c:if test="${item.apply_day == 1}">
                                                        <td>星期一</td>
                                                    </c:if>
                                                    <c:if test="${item.apply_day == 2}">
                                                        <td>星期二</td>
                                                    </c:if>
                                                    <c:if test="${item.apply_day == 3}">
                                                        <td>星期三</td>
                                                    </c:if>
                                                    <c:if test="${item.apply_day == 4}">
                                                        <td>星期四</td>
                                                    </c:if>
                                                    <c:if test="${item.apply_day == 5}">
                                                        <td>星期五</td>
                                                    </c:if>
                                                    <c:if test="${item.apply_day == 6}">
                                                        <td>星期六</td>
                                                    </c:if>
                                                    <c:if test="${item.apply_day == 7}">
                                                        <td>星期日</td>
                                                    </c:if>
                                                    <td>第${item.apply_section}节</td>
                                                    <td>${item.room_code}</td>
                                                    <td>${item.course_name}</td>
                                                    <td>${item.course_nature}</td>
                                                    <td>${item.course_class }</td>
                                                    <td>${item.user_name}</td>

                                                    <td>
                                                        <a href="#" class="btn btn-danger btn-xs"
                                                           onclick="deleteApply(${item.apply_id})">
                                                            <i class="ace-icon fa fa-trash-o"></i>
                                                            删除
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </form>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 text-right">
                            <itcast:page url="${pageContext.request.contextPath }/apply/queryApplyByUser.action"/>
                        </div>

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->


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

    <script>


        function deleteApply(id) {

            swal({
                    title: "确定删除吗？",
                    text: "课程很重要的！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定删除！",
                    cancelButtonText: "取消删除！",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {
                    if (isConfirm) {


                        $.post("<%=basePath%>apply/delete.action", {"id": id}, function (data) {
                            if (data == "0") {
                                swal({title: "删除！", text: "课程已经被删除。", type: "success"},
                                    function () {
                                        window.location.reload();
                                    });


                            } else {
                                swal("删除！", "课程删除失败。", "error");
                            }
                        });

                    } else {
                        swal("取消！", "课程是安全的)",
                            "error");
                    }


                });


        }


        function deleteAll() {

            swal({
                    title: "确定删除吗？",
                    text: "课程很重要的！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定删除！",
                    cancelButtonText: "取消删除！",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {
                    if (isConfirm) {


                        $.post("<%=basePath%>apply/deleteAll.action", $("#form1").serialize(), function (data) {
                            if (data == "0") {
                                swal({title: "删除！", text: "课程已经被删除。", type: "success"},
                                    function () {
                                        window.location.reload();
                                    });


                            } else {
                                swal("删除！", "课程删除失败。", "error");
                            }
                        });

                    } else {
                        swal("取消！", "课程是安全的)",
                            "error");
                    }


                });


        }


        $("#selecteAll").click(function () {
            if (this.checked) {
                var products = $("input[name='ids']");
                products.each(function () {
                    $(this).attr('checked', true);
                    $(this).parent().attr("class", 'checked');
                });
            } else {
                var products = $("input[name='ids']");
                products.each(function () {
                    $(this).attr('checked', false);
                    $(this).parent().removeClass('checked');
                });
            }

        });

    </script>


</body>

</html>