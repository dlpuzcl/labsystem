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

    <title>管理界面</title>

    <!-- Bootstrap Core CSS -->
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
                        <a href="javascript:void(0)">用户管理</a>
                    </li>
                    <li>
                        <a href="#">教师管理</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">教师管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->


        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" action="${pageContext.request.contextPath }/user/list.action"
                      method="get">
                    <div class="form-group">
                        <label for="userName">教师名称</label>
                        <input type="text" class="form-control" id="userName" placeholder="教师名称" value="${vo.userName }"
                               name="userName">
                    </div>
                    <div class="form-group">
                        <label for="professional_title">职称</label>
                        <select class="form-control" id="professional_title" placeholder="职称" name="professionalTitle">
                            <option value="">--请选择--</option>
                            <c:forEach items="${fromProfessionalTitle}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == vo.professionalTitle}"> selected</c:if>
                                >
                                        ${item.dict_item_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="add_college">学院</label>
                        <select class="form-control" id="add_college" name="userCollege">
                            <option value="">--请选择--</option>
                            <c:forEach items="${fromCollege}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == vo.userCollege}"> selected</c:if>
                                >
                                        ${item.dict_item_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">查询</button>

                    <a href="#" class="btn btn-success" data-toggle="modal"
                       data-target="#customerAddDialog"
                       onclick="editUser(${row.user_id})">添加
                    </a>

                    <a href="${pageContext.request.contextPath }/user/userExcel.action" class="btn btn btn-info"
                    >下载
                    </a>
                </form>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading" style="padding-bottom: 23px;">

                    </div>


                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row">
                            <div class=" col-md-12">
                                <div class="table-responsive">

                                    <table width="100%" class="table table-striped table-bordered table-hover"
                                           style="text-align: center;">
                                        <thead>
                                        <tr class="info">
                                            <td>序号</td>
                                            <td>姓名</td>
                                            <td>电话</td>
                                            <td>邮箱</td>
                                            <td>职称</td>
                                            <td>学院</td>
                                            <td>颜色</td>
                                            <td>状态</td>
                                            <td>编辑</td>
                                            <td>删除</td>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${page.rows}" var="row" varStatus="vs">
                                            <tr>
                                                <td>${vs.count }</td>
                                                <td>${row.user_name }</td>
                                                <td>${row.user_phone}</td>
                                                <td>${row.user_email}</td>
                                                <td>${row.professional_title }</td>
                                                <td>${row.college}</td>
                                                <td>
                                                    <div style="background-color:${row.user_color};height: 22px"></div>

                                                </td>
                                                <c:if test="${row.user_state == 1}">
                                                    <td>
                                                        <div style="color:#5CB85C"> 已激活</div>
                                                    </td>
                                                </c:if>
                                                <c:if test="${row.user_state == 0}">
                                                    <td>
                                                        <div style="color:#D9534F"> 未激活</div>
                                                    </td>
                                                </c:if>

                                                <td>
                                                    <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                                       data-target="#customerEditDialog"
                                                       onclick="editUser(${row.user_id})">
                                                        <i class="ace-icon fa fa-pencil"></i>
                                                        修改
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-danger btn-xs"
                                                       onclick="deleteUser(${row.user_id})">
                                                        <i class="ace-icon fa fa-trash-o"></i>
                                                        删除
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="col-md-12 text-right">
                                        <itcast:page url="${pageContext.request.contextPath }/user/list.action"/>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>


        <%--用户编辑对话框--%>
        <div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="edit_User_form">
                            <input type="hidden" id="edit_userId" name="user_id"/>
                            <div class="form-group">
                                <label for="edit_userName" class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_userName" placeholder="姓名"
                                           name="user_name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_userCollege" class="col-sm-2 control-label">学院</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="edit_userCollege" placeholder="学院"
                                            name="college">
                                        <option value="">--请选择--</option>
                                        <c:forEach items="${fromCollege}" var="item">
                                            <option value="${item.dict_id}"<c:if
                                                    test="${item.dict_id == userCollege}"> selected</c:if>>${item.dict_item_name }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_professionalTitle" class="col-sm-2 control-label">职称</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="edit_professionalTitle" name="professional_title">
                                        <option value="">--请选择--</option>
                                        <c:forEach items="${fromProfessionalTitle}" var="item">
                                            <option value="${item.dict_id}"
                                                    <c:if test="${item.dict_id == professionalTitle}">
                                                        selected
                                                    </c:if>
                                            >
                                                    ${item.dict_item_name }
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_userEmail" class="col-sm-2 control-label">颜色</label>
                                <div id="cp5" class="input-group colorpicker-component col-sm-10"
                                     title="Using input value"
                                     style="padding-left: 15px ;padding-right: 15px">
                                    <input type="text" class="form-control col-lg-5" name="user_color"
                                           id="edit_userColor" value="rgb(89, 52, 235)"/>
                                    <span class="input-group-addon"><i></i></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_userEmail" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_userEmail" placeholder="邮箱"
                                           name="user_email">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_userPhone" class="col-sm-2 control-label">电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_userPhone" placeholder="移动电话"
                                           name="user_phone">
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="updateUser()">
                            <i class="ace-icon fa fa-check bigger-110"></i>
                            保存修改
                        </button>
                    </div>
                </div>
            </div>
        </div>


        <%--用户添加对话框--%>
        <div class="modal fade" id="customerAddDialog" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="ModalLabel">添加用户信息</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="add_User_form">
                            <%--<input type="hidden" id="add_userId" name="user_id"/>--%>
                            <div class="form-group">
                                <label for="edit_userName" class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edd_userName" placeholder="姓名"
                                           name="user_name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_userCollege" class="col-sm-2 control-label">学院</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="add_userCollege" placeholder="学院"
                                            name="college">
                                        <option value="">--请选择--</option>
                                        <c:forEach items="${fromCollege}" var="item">
                                            <option value="${item.dict_id}">
                                                    ${item.dict_item_name }
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_professionalTitle" class="col-sm-2 control-label">职称</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="add_professionalTitle" name="professional_title">
                                        <option value="">--请选择--</option>
                                        <c:forEach items="${fromProfessionalTitle}" var="item">
                                            <option value="${item.dict_id}">
                                                    ${item.dict_item_name }
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="add_userEmail" class="col-sm-2 control-label">颜色</label>
                                <div id="cp6" class="input-group colorpicker-component col-sm-10"
                                     data-color="#673AB7"
                                     title="Using input value"
                                     style="padding-left: 15px ;padding-right: 15px">
                                    <input type="text" class="form-control col-lg-5" id="add_userColor"
                                           name="user_color"/>
                                    <span class="input-group-addon"><i></i></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_userEmail" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_userEmail" placeholder="邮箱"
                                           name="user_email">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_userPhone" class="col-sm-2 control-label">电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_userPhone" placeholder="电话"
                                           name="user_phone">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_userEmail" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control " id="user_password" placeholder="密码"
                                           name="user_password">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_userEmail" class="col-sm-2 control-label ">确认密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="user_repassword" placeholder="确认密码"
                                           name="user_repassword">
                                </div>
                            </div>
                            <%--<submit type="button" class="btn btn-primary" >提交</submit>--%>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button class="btn btn-primary" type="submit">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    立即提交
                                </button>
                            </div>
                        </form>
                    </div>
                    <%--<div class="modal-footer">--%>
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                    <%--<button type="button" class="btn btn-primary" type="submit">提交</button>--%>

                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
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


    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
        // $(document).ready(function () {
        //     $('#dataTables-example').DataTable({
        //         responsive: true
        //     });
        // });

        $("#add_User_form").validate({
            rules: {

                "user_name": {
                    "required": true,
                },
                "user_phone": {
                    "required": true,
                    "rangelength": [11, 11]
                },
                "user_password": {
                    "required": true,
                    "rangelength": [6, 12]
                },
                "user_repassword": {
                    "required": true,
                    "rangelength": [6, 12],
                    "equalTo": "#user_password"
                },
                "user_email": {
                    "required": true,
                    "email": true
                },
                "professional_title": {
                    "required": true,
                },
                "college": {
                    "required": true,
                }
            },
            messages: {

                "user_name": {
                    "required": "*姓名不能为空",
                },
                "user_phone": {
                    "required": "*电话不能为空",
                    "rangelength": "*电话号码格式不正确"
                },
                "password": {
                    "required": "*密码不能为空",
                    "rangelength": "*密码长度6-12位"
                },
                "repassword": {
                    "required": "*密码不能为空",
                    "rangelength": "*密码长度6-12位",
                    "equalTo": "*两次密码不一致"
                },
                "user_email": {
                    "required": "*邮箱不能为空",
                    "email": "*邮箱格式不正确"
                },
                "professional_title": {
                    "required": "*职称不能为空",
                },
                "college": {
                    "required": "*学院不能为空",
                }
            },

            submitHandler: function (form) {  //表单提交后要执行的内容
                $.post("<%=basePath%>user/add.action", $("#add_User_form").serialize(), function (data) {
                    if (data.status == 200) {
                        swal({title:"提示",text:"用户添加成功", type:"success"}, function () {
                            window.location.reload();
                        });

                    }
                    if (data.status == 400) {
                        swal("用户添加失败！", data.msg, "warning");

                    }
                    if (data.status == 555) {
                        swal("提示",data.msg, "warning");

                    }
                    if (data.status == 666) {
                        swal("提示",data.msg, "warning");

                    }
                    if (data.status == 777) {
                        swal("提示",data.msg, "warning");

                    }
                    // window.location.reload();
                    <%--window.location = "<%=basePath%>user/list.action"--%>
                });
            },
            invalidHandler: function (form, validator) {  //不通过回调
                return false;
            }
        });


        function editUser(id) {
            $.ajax({
                type: "get",
                url: "<%=basePath%>user/edit.action",
                data: {"id": id},
                success: function (data) {
                    $("#edit_userId").val(data.user_id);
                    $("#edit_userName").val(data.user_name);
                    $("#edit_userCollege").val(data.college)
                    $("#edit_userEmail").val(data.user_email)
                    $("#edit_userPhone").val(data.user_phone)
                    $("#edit_userColor").val(data.user_color)

                    $("#edit_professionalTitle").val(data.professional_title)

                }
            });
        }

        function updateUser() {
            $.post("<%=basePath%>user/update.action", $("#edit_User_form").serialize(), function (data) {
                if (data == "0") {
                    alert("客户更新成功！");
                } else {
                    alert("客户更新失败！");
                }
                window.location.reload();
            });
        }

        <%--function deleteUser(id) {--%>
            <%--if (confirm('确实要删除该用户吗?')) {--%>
                <%--$.post("<%=basePath%>user/delete.action", {"id": id}, function (data) {--%>
                    <%--if (data == "0") {--%>
                        <%--alert("用户删除成功！");--%>
                    <%--} else {--%>
                        <%--alert("用户删除失败！");--%>
                    <%--}--%>
                    <%--window.location.reload();--%>
                <%--});--%>
            <%--}--%>
        <%--}--%>


        function deleteUser(id) {
            swal({
                    title: "确定删除吗？",
                    text: "这位用户很重要的！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定删除！",
                    cancelButtonText: "取消删除！",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function(isConfirm){
                    if (isConfirm) {
                        $.post("<%=basePath%>user/delete.action", {"id": id}, function (data) {
                            if (data == "0") {
                                swal({title:"删除！", text:"你的虚拟文件已经被删除。", type:"success"},
                                    function () {
                                        window.location.reload();
                                    });


                            } else {
                                swal("删除！", "你的虚拟删除失败。", "error");
                            }
                        });

                    } else {
                        swal("取消！", "你的虚拟文件是安全的:)",
                            "error");
                    }


                });

        }


        $(function () {
            $('#mycp').colorpicker();
        });
        $(function () {

            $('#cp5,#cp6').colorpicker({
                format: "rgba"
            });

        });
    </script>

</body>

</html>