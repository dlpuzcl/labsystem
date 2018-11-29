<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

		<title>实验室添加</title>

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


		<link rel="stylesheet" type="text/css" href="<%=basePath%>sweetalert/sweetalert.css">
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>

    <![endif]-->
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
								<a href="#">实验室添加</a>
							</li>
						</ul>
						<!-- /.breadcrumb -->
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">实验室添加</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								请认真填写以下数据
							</div>
							<div class="panel-body">
								<div class="row">

									<div class="col-xs-12">
										<!-- PAGE CONTENT BEGINS -->
										<form class="form-horizontal" id="add_Lab_form" action="" >

											<!--房间号-->
											<div class="form-group">
												<label class="col-lg-3 control-label" >房间号</label>
												<div class="col-lg-5">
													<input type="text" class="form-control" name="room_code">
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" >实验室名称</label>
												<div class="col-lg-5">
													<input type="text" class="form-control" name="room_name">
												</div>
											</div>

											<%--学院--%>
											<div class="form-group">
												<label class="col-lg-3 control-label">学院</label>
												<div class="col-lg-5">
													<select class="form-control" id="college" name="room_college">
														<option value="">--请选择--</option>
														<c:forEach items="${fromCollege}" var="item">
															<option value="${item.dict_id}">
																	${item.dict_item_name }
															</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<!--人数-->
											<div class="form-group">
												<label class="col-lg-3 control-label">人数</label>
												<div class="col-lg-5">
													<input type="text" class="form-control" name="place_count">
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label no-padding-right" for="limited">备注</label>
												<div class="col-lg-5">
													<div class="pos-rel">
														<textarea class="form-control limited autosize-transition" id="limited" maxlength="50" name="room_memo"></textarea>
													</div>
												</div>
											</div>

										
											<div class="clearfix form-actions">
												<div class="col-md-offset-3 col-md-9">
													<button class="btn btn-primary" type="submit">
												<i class="ace-icon fa fa-check bigger-110"></i>
												立即提交
											</button> &nbsp; &nbsp; &nbsp;
													<button class="btn" type="reset">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												重置
											</button>
												</div>
											</div>

										</form>

									</div>
									<!-- /.col -->
								</div>

							</div>
							<!-- /.row (nested) -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

		<!-- /#wrapper -->

		<!-- jQuery -->
		<script src="<%=basePath%>jquery/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="<%=basePath%>metisMenu/metisMenu.min.js"></script>

		<script src="<%=basePath%>morrisjs/morris.min.js"></script>


		<script src="<%=basePath%>sweetalert/sweetalert.min.js"></script>


		<!-- Custom Theme JavaScript -->
		<script src="<%=basePath%>dist/js/sb-admin-2.js"></script>
		<!-- 引入表单校验jquery插件 -->
		<script src="<%=basePath%>jquery/jquery.validate.min.js"></script>
	<script>
        $("#add_Lab_form").validate({
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
                $("button[type=submit]").attr('disabled',true)//在按钮提交之后和AJAX提交之前将按钮设置为禁用

                $.post("<%=basePath%>lab/add.action",$("#add_Lab_form").serialize(),function(data){
                    if (data.status == 200){

                        swal({title:"提示",text:"实验室添加成功", type:"success"}, function () {

                            window.location = "<%=basePath%>lab/list.action";
                        });

                    } else{
                        swal({title:"提示",text:"实验室添失败", type:"error"}, function () {


                        });
                    }
                    $("button[type=submit]").attr('disabled',false)//在提交成功之后重新启用该按钮

                });
            },
            invalidHandler: function(form, validator) {  //不通过回调
                return false;
            }
        });

	</script>

	</body>

</html>