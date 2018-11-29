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
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>我的课程</title>

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

    <link href="<%=basePath%>css/style.css" rel="stylesheet">

    <script src="<%=basePath%>jquery/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>sweetalert/sweetalert.css">


    <style type="text/css">
        .error {
            color: red
        }
    </style>
</head>

<body>

<div id="wrapper">

    <%@ include file="/WEB-INF/jsp/top.jsp" %>

    <div id="page-wrapper"

         class="row" style="background-color:#FFFFFF;margin-left: 0px;margin-right: 0px;padding-left: 0px;padding-right: 0px;">
        <div class="col-lg-offset-2 col-lg-8">
            <div class="row">

                <div class="col-lg-3 col-md-6">
                    <h1 class="page-header">我的课程</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <%@ include file="/WEB-INF/jsp/middle.jsp" %>

            <div class="row">

                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="morris-area-chart"></div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="padding-bottom: 0px;padding-top: 11px;height: 55px;">
                            <div class="pull-right">
                                <a href="#" class="btn btn-success" data-toggle="modal"
                                   data-target="#labAddDialog"
                                >添加
                                </a>
                            </div>
                        </div>

                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class=" col-md-12">
                                    <div class="table-responsive">
                                        <thead>
                                        <table width="100%" class="table table-striped table-bordered table-hover"
                                               style="text-align: center;">

                                            <tr class="info">
                                                <td>序号</td>
                                                <td>课程名称</td>
                                                <td>上课班级</td>
                                                <td>上课人数</td>

                                                <td>课程性质</td>
                                                <td>协同教师</td>
                                                <td>课程学时</td>
                                                <td>已约学时</td>
                                                <td>编辑</td>
                                                <td>删除</td>
                                            </tr>
                                            </thead>

                                            <tbody>

                                            <c:forEach items="${courseList }" var="iterm" varStatus="vs">
                                                <tr>
                                                    <td>${vs.count}</td>
                                                    <td>${iterm.course_name}</td>
                                                    <td>${iterm.course_class }</td>
                                                    <td>${iterm.course_students}</td>

                                                    <td>${iterm.course_nature }</td>
                                                    <td>${iterm.course_memo }</td>
                                                    <td>${iterm.course_time }</td>
                                                    <c:if test="${iterm.course_timed < iterm.course_time}">
                                                        <td>
                                                            <div style="color:#5CB85C"> ${iterm.course_timed }</div>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${iterm.course_timed == iterm.course_time}">
                                                        <td>
                                                            <div style="color:#D9534F"> ${iterm.course_timed }</div>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${course.course_timed > course.course_time}">
                                                        <td>
                                                            <div style="color:#D9534F"> ${course.course_timed }</div>
                                                        </td>
                                                    </c:if>
                                                    <td>
                                                        <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                                           data-target="#courseEditDialog"
                                                           onclick="editCourse(${iterm.course_id})">
                                                            <i class="ace-icon fa fa-pencil"></i>
                                                            修改
                                                        </a>
                                                    </td>


                                                    <td>
                                                        <a href="#" class="btn btn-danger btn-xs"
                                                           onclick="deleteCourse(${iterm.course_id})">
                                                            <i class="ace-icon fa fa-trash-o"></i>
                                                            删除
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <%--课程编辑对话框--%>
            <div class="modal fade" id="courseEditDialog" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">修改课程信息</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" id="edit_course_form">
                                <input type="hidden" id="edit_course_id" name="course_id"/>

                                <div class="form-group">
                                    <label for="edit_course_name" class="col-sm-2 control-label">课程名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="edit_course_name" placeholder="课程名称"
                                               name="course_name">
                                    </div>
                                </div>

                                <input type="hidden" name="user_id"
                                       value="${user.user_id}"/>

                                <div class="form-group">
                                    <label for="edit_course_nature" class="col-sm-2 control-label">课程性质</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="edit_course_nature" placeholder="课程性质"
                                                name="course_nature">
                                            <option value="">--请选择--</option>
                                            <c:forEach items="${course_nature_list}" var="item">
                                                <option value="${item.dict_item_name }">
                                                        ${item.dict_item_name }
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="edit_course_class" class="col-sm-2 control-label">上课班级</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="edit_course_class"
                                               placeholder="上课班级"
                                               name="course_class">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="edit_course_class" class="col-sm-2 control-label">上课人数</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="edit_course_students"
                                               placeholder="上课人数"
                                               name="course_students">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="add_course_class" class="col-sm-2 control-label">课程学时</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="edit_course_time" placeholder="学时"
                                               name="course_time">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="edit_course_memo" class="col-sm-2 control-label">协同教师</label>
                                    <div class="col-sm-10">
                                    <textarea class="form-control limited autosize-transition" id="edit_course_memo"
                                              maxlength="50" name="course_memo"></textarea>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        保存修改
                                    </button>
                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>


            <%--实验室添加对话框--%>
            <div class="modal fade" id="labAddDialog" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="myaddLabel">添加实验室信息</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" id="add_course_form">
                                <%--<input type="hidden" id="add_course_id" name="course_id"/>--%>

                                <div class="form-group">
                                    <label for="edit_course_name" class="col-sm-2 control-label">课程名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="add_course_name" placeholder="课程名称"
                                               name="course_name">
                                    </div>
                                </div>


                                <input type="hidden" name="user_id" id="user_id"
                                       value="${user.user_id}">

                                <div class="form-group">
                                    <label for="add_course_nature" class="col-sm-2 control-label">课程性质</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="add_course_nature" placeholder="课程性质"
                                                name="course_nature">
                                            <option value="">--请选择--</option>
                                            <c:forEach items="${course_nature_list}" var="item">
                                                <option value="${item.dict_item_name }">
                                                        ${item.dict_item_name }
                                                </option>
                                            </c:forEach>

                                        </select>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="add_course_class" class="col-sm-2 control-label">上课班级</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="add_course_class" placeholder="上课班级"
                                               name="course_class">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="add_course_class" class="col-sm-2 control-label">上课人数</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="add_course_students"
                                               placeholder="上课人数"
                                               name="course_students">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="add_course_class" class="col-sm-2 control-label">课程学时</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="add_course_time" placeholder="学时"
                                               name="course_time">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="add_course_memo" class="col-sm-2 control-label">协同教师</label>
                                    <div class="col-sm-10">
                                    <textarea class="form-control limited autosize-transition" id="add_course_memo"
                                              maxlength="50" name="course_memo"></textarea>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        立即提交
                                    </button>
                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <!--弹出删除资源警告窗口-->
            <div class="modal fade" id="deleteSource" role="dialog" aria-labelledby="gridSystemModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                确定要删除该资源？删除后不可恢复！
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                            <button type="button" class="btn btn-xs btn-danger">保 存</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

        </div>
    </div>
</div>


<script src="<%=basePath%>jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>dist/js/sb-admin-2.js"></script>

<script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>


<script type="text/javascript" src="<%=basePath%>bootstrap/js/inpitassembly-2.0.js"></script>

<%--表单校验--%>
<script src="<%=basePath%>jquery/jquery.validate.min.js"></script>
<script type="text/javascript">


    function editCourse(id) {
        $.ajax({
            type: "get",
            url: "<%=basePath%>frontCourse/edit.action",
            data: {"id": id},
            success: function (data) {
                $("#edit_course_id").val(data.course_id);
                $("#edit_course_name").val(data.course_name);
                $("#edit_course_class").val(data.course_class);
                $("#edit_course_memo").val(data.course_memo);
                $("#edit_course_nature").val(data.course_nature);
                $("#edit_course_time").val(data.course_time);
                $("#edit_course_students").val(data.course_students);

            }
        });
    }

    function updateCourse() {
        $("button[type=submit]").attr('disabled',true)//在按钮提交之后和AJAX提交之前将按钮设置为禁用
        $.post("<%=basePath%>frontCourse/update.action", $("#edit_course_form").serialize(), function (data) {
            if (data == "0") {
                swal({title: "提示", text: "课程更新成功", type: "success"}, function () {
                    window.location.reload();
                });
            } else {
                swal({title: "提示", text: "课程更新失败", type: "error"}, function () {
                    // window.location.reload();
                });
            }
            $("button[type=submit]").attr('disabled',false)//在提交成功之后重新启用该按钮
        });
    }


    $("#edit_course_form").validate({
        rules: {

            "course_name": {
                "required": true,
            },
            "course_class": {
                "required": true,
            },

            "user_id": {
                "required": true,
            },
            "course_time": {

                "required": true,
                "number": true
            },
            "course_nature": {
                "required": true,
            }

        },
        messages: {

            "course_name": {
                "required": "*课程名称不能为空",
            },
            "course_class": {
                "required": "*上课班级不能为空",
            },
            "user_id": {
                "required": "*任课教师不能为空",
            },
            "course_time": {
                "required": "*学时不能为空",
                "number": "*学时只能为数字"
            },
            "course_nature": {
                "required": "*课程性质不能为空",
            }
        },

        submitHandler: function (form) {  //表单提交后要执行的内容
            $("button[type=submit]").attr('disabled',true)//在按钮提交之后和AJAX提交之前将按钮设置为禁用
            $.post("<%=basePath%>frontCourse/update.action", $("#edit_course_form").serialize(), function (data) {
                if (data == "0") {
                    swal({title: "提示", text: "课程更新成功", type: "success"}, function () {
                        window.location.reload();
                    });
                } else {
                    swal({title: "提示", text: "课程更新失败", type: "error"}, function () {
                        // window.location.reload();
                    });
                }
                $("button[type=submit]").attr('disabled',false)//在提交成功之后重新启用该按钮
            });

        },
        invalidHandler: function (form, validator) {  //不通过回调
            return false;
        }
    });




    $("#add_course_form").validate({
        rules: {

            "course_name": {
                "required": true,
            },
            "course_class": {
                "required": true,
            },

            "user_id": {
                "required": true,
            },
            "course_time": {

                "required": true,
                "number": true
            },
            "course_nature": {
                "required": true,
            }

        },
        messages: {

            "course_name": {
                "required": "*课程名称不能为空",
            },
            "course_class": {
                "required": "*上课班级不能为空",
            },
            "user_id": {
                "required": "*任课教师不能为空",
            },
            "course_time": {
                "required": "*学时不能为空",
                "number": "*学时只能为数字"
            },
            "course_nature": {
                "required": "*课程性质不能为空",
            }
        },

        submitHandler: function (form) {  //表单提交后要执行的内容
            $("button[type=submit]").attr('disabled',true)//在按钮提交之后和AJAX提交之前将按钮设置为禁用
            $.post("<%=basePath%>frontCourse/add.action", $("#add_course_form").serialize(), function (data) {
                if (data == "0") {
                    swal({title: "提示", text: "课程添加成功", type: "success"}, function () {
                        window.location.reload();
                    });
                } else {
                    swal({title: "提示", text: "课程添加失败", type: "error"}, function () {
                        window.location.reload();
                    });
                }
                $("button[type=submit]").attr('disabled',false)//在提交成功之后重新启用该按钮
            });
        },
        invalidHandler: function (form, validator) {  //不通过回调
            return false;
        }
    });


    function deleteCourse(id) {


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
                    $.post("<%=basePath%>frontCourse/delete.action", {"id": id}, function (data) {
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


</script>
</body>

</html>
