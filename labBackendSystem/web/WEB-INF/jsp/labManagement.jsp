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

    <title>实验室管理</title>

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
                        <a href="/admini/first.action">首页</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">教室管理</a>
                    </li>
                    <li>
                        <a href="#">实验室管理</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">实验室管理</h1>
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

                    <a href="#" class="btn btn-success" data-toggle="modal"
                       data-target="#labAddDialog"
                    >添加
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
                                            <td>房间号</td>
                                            <td>实验室名称</td>
                                            <td>人数</td>
                                            <td>所属学院</td>
                                            <td>备注</td>
                                            <td>编辑</td>
                                            <td>删除</td>
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
                                                       data-target="#labEditDialog"
                                                       onclick="editLab(${lab.room_id})">
                                                        <i class="ace-icon fa fa-pencil"></i>
                                                        修改
                                                    </a>
                                                </td>


                                                <td>
                                                    <a href="#" class="btn btn-danger btn-xs"
                                                       onclick="deleteLab(${lab.room_id})">
                                                        <i class="ace-icon fa fa-trash-o"></i>
                                                        删除
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

        <!-- /.row -->

        <%--实验室编辑对话框--%>
        <div class="modal fade" id="labEditDialog" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">修改实验室信息</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="edit_lab_form">
                            <input type="hidden" id="edit_roomId" name="room_id"/>


                            <div class="form-group">
                                <label for="edit_roomCode" class="col-sm-2 control-label">房间号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_roomCode" placeholder="房间号"
                                           name="room_code">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_roomName" class="col-sm-2 control-label">房间名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_roomName" placeholder="实验室名称"
                                           name="room_name">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_roomCollege" class="col-sm-2 control-label">学院</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="edit_roomCollege" placeholder="学院"
                                            name="room_college">
                                        <option value="">--请选择--</option>
                                        <c:forEach items="${fromCollege}" var="item">
                                            <option value="${item.dict_id}"<c:if
                                                    test="${item.dict_id == roomCollege}"> selected</c:if>>${item.dict_item_name }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_placeCount" class="col-sm-2 control-label">人数</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_placeCount" placeholder="人数"
                                           name="place_count">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_placeCount" class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control limited autosize-transition" id="edit_roomMemo"
                                              maxlength="50" name="room_memo"></textarea>

                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="button" class="btn btn-primary" onclick="updateLab()">
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
                        <form class="form-horizontal" id="add_lab_form">
                            <%--<input type="hidden" id="add_roomId" name="room_id"/>--%>


                            <div class="form-group">
                                <label for="edit_roomCode" class="col-sm-2 control-label">房间号</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_roomCode" placeholder="房间号"
                                           name="room_code">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_roomName" class="col-sm-2 control-label">房间名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_roomName" placeholder="实验室名称"
                                           name="room_name">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_roomCollege" class="col-sm-2 control-label">学院</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="add_roomCollege" placeholder="学院"
                                            name="room_college">
                                        <option value="">--请选择--</option>
                                        <c:forEach items="${fromCollege}" var="item">
                                            <option value="${item.dict_id}"<c:if
                                                    test="${item.dict_id == roomCollege}"> selected</c:if>>${item.dict_item_name }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_placeCount" class="col-sm-2 control-label">人数</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_placeCount" placeholder="人数"
                                           name="place_count">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_placeCount" class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control limited autosize-transition" id="add_roomMemo"
                                              maxlength="50" name="room_memo">

                                    </textarea>

                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button class="btn btn-primary" type="submit">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    立即提交
                                </button>
                            </div>

                        </form>
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
        // $(document).ready(function() {
        // 	$('#dataTables-example').DataTable({
        // 		responsive: true
        // 	});
        // });
        //


        <%--function delLab(lid){  --%>
        <%--swal(  --%>
        <%--{title:"确定删除吗？",  --%>
        <%--text:"你将无法恢复该课程！",  --%>
        <%--type:"warning",  --%>
        <%--showCancelButton:true,  --%>
        <%--confirmButtonColor:"#DD6B55",  --%>
        <%--confirmButtonText:"是的，我要删除！",  --%>
        <%--cancelButtonText:"让我再考虑一下…",  --%>
        <%--closeOnConfirm:false,  --%>
        <%--closeOnCancel:false  --%>
        <%--},  --%>
        <%--function(isConfirm)  --%>
        <%--{  --%>
        <%--if(isConfirm)  --%>
        <%--{  --%>
        <%--swal({title:"删除成功！",  --%>
        <%--text:"你成功删除了这条门课程。",  --%>
        <%--type:"success"},function(){window.location="${pageContext.request.contextPath}/delLab?lid="+lid})  --%>
        <%--}  --%>
        <%--else{  --%>
        <%--swal({title:"已取消",  --%>
        <%--text:"这门课程是安全的！",  --%>
        <%--type:"error"})  --%>
        <%--}  --%>
        <%--}  --%>
        <%--)  --%>
        <%--} --%>

        function editLab(id) {
            $.ajax({
                type: "get",
                url: "<%=basePath%>lab/edit.action",
                data: {"id": id},
                success: function (data) {
                    $("#edit_roomId").val(data.room_id);
                    $("#edit_roomName").val(data.room_name);
                    $("#edit_roomCollege").val(data.room_college)
                    $("#edit_roomCode").val(data.room_code)
                    $("#edit_roomMemo").val(data.room_memo)
                    $("#edit_placeCount").val(data.place_count)

                }
            });
        }

        function updateLab() {
            $.post("<%=basePath%>lab/update.action", $("#edit_lab_form").serialize(), function (data) {
                if (data == "0") {
                    alert("实验室更新成功！");
                } else {
                    alert("实验室更新失败！");
                }
                window.location.reload();
            });
        }

        $("#add_lab_form").validate({
            rules:{

                "room_name":{
                    "required":true,
                },
                "room_code":{
                    "required":true,
                },

                "place_count":{
                    "required":true,
                },
                "room_coolege":{
                    "required":true,
                }
            },
            messages:{

                "room_name":{
                    "required":"*实验室名不能为空",
                },
                "room_code":{
                    "required":"*房间号不能为空",
                },
                "place_count":{
                    "required":"*课位数不能为空",
                },
                "room_coolege":{
                    "required":"*学院不能为空",
                }
            },

            submitHandler:function(form){  //表单提交后要执行的内容
                $.post("<%=basePath%>lab/add.action",$("#add_lab_form").serialize(),function(data){
                    if (data.status == 200){
                        alert("实验室添加成功！");
                        window.location = "<%=basePath%>lab/list.action"

                    } else{
                        alert("实验室添加失败:"+data.msg);
                        window.location.reload();
                    }

                });
            },
            invalidHandler: function(form, validator) {  //不通过回调
                return false;
            }
        });


        function deleteLab(id) {
            if(confirm('确实要删除该实验室吗?')) {
                $.post("<%=basePath%>lab/delete.action",{"id":id},function(data){
                    if (data == "0"){
                        alert("实验室删除成功！");
                    } else{
                        alert("实验室删除失败！");
                    }
                    window.location.reload();
                });
            }
        }

    </script>


</body>

</html>