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
    	<style type="text/css">
    		.error{
				color:red
			}
    	</style>
    	<script type="text/javascript">
	    	
    	
    	</script>
	</head>

	<body>

		<div id="wrapper">

			<%@ include file="WEB-INF/jsp/navigation.jsp" %>
			
			<div id="page-wrapper">
				<div class="row">
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="主页.html">首页</a>
							</li>
							<li>
								<a href="javascript:void(0)">用户管理</a>
							</li>
							<li>
								<a href="#">用户编辑</a>
							</li>
						</ul>
						<!-- /.breadcrumb -->
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">编辑用户</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-xs-12">
						<div id="user-profile-2" class="user-profile">
							<div class="tabbable">
								<ul class="nav nav-tabs padding-18">
									<li class="active">
										<a data-toggle="tab" href="#teacher">
											<i class="green icon-user bigger-120"></i> 管理员
										</a>
									</li>
								</ul>

								<div class="tab-content no-border padding-24">
									<div id="teacher" class="tab-pane in active">
										<div class="row">
											<div class="col-lg-12">
												<div class="panel panel-default">
													<!--<div class="panel-heading">
								请认写以下数据
							</div>-->
													<div class="panel-body">
														<div class="row">

															<div class="col-xs-12">
																<!-- PAGE CONTENT BEGINS -->
																	<form class="form-horizontal" id="admiForm" action="${pageContext.request.contextPath }/updateAdministrator">
																	
																	<input type="hidden" name="admiid" value="${admi.admiid }">
																		<div class="form-group">
																			<label class="col-lg-3 control-label">用户名</label>
																			<div class="col-lg-5">
																				<input type="text" class="form-control" name="adminame" value="${admi.adminame }">
																			</div>
																		</div>

																		<!--密码-->
																		<div class="form-group">
																			<label class="col-lg-3 control-label">密码</label>
																			<div class="col-lg-5">
																				<input type="password" class="form-control" id="password" name="password" value="${admi.password }">
																			</div>
																		</div>
																	<!--确认密码-->
																	<div class="form-group">
																		<label class="col-lg-3 control-label">确认密码</label>
																		<div class="col-lg-5">
																			<input type="password" class="form-control" id="repassword" name="repassword">
																		</div>
																	</div>

																		<div class="form-group">
																			<label class="col-lg-3 control-label no-padding-right" for="limited">备注</label>
																			<div class="col-lg-5">
																				<div class="pos-rel">
																					<textarea class="form-control limited autosize-transition" id="limited" maxlength="50" name="adminote">${admi.adminote }</textarea>
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

										</div>
										<!-- /row-fluid -->

									</div>


									
									
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->

		<script src="jquery/jquery.min.js"></script>

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
		
		<!-- 引入表单校验jquery插件 -->
		<script src="jquery/jquery.validate.min.js"></script>
		   
		   
		   
		   
		
		<script>
		
		//自定义校验规则
    	$.validator.addMethod(
    		//规则的名称
    		"checkUsername",
    		//校验的函数
    		function(value,element,params){
    			
    			//定义一个标志
    			var flag = false;
    			
    			//value:输入的内容
    			//element:被校验的元素对象
    			//params：规则对应的参数值
    			//目的：对输入的username进行ajax校验
    			$.ajax({
    				"async":false,
    				"url":"${pageContext.request.contextPath}/checkUsername",
    				"data":{"username":value},
    				"type":"POST",
    				"dataType":"json",
    				"success":function(data){
    					flag = data.isExist;
    				}
    			});
    			
    			//返回false代表该校验器不通过
    			return !flag;
    		}
    		
    	);
		
    	
    		$("#admiForm").validate({
    			rules:{
    				"username":{
    					"required":true,
    				},
    				"name":{
    					"required":true,
    				},
    				"telephone":{
    					"required":true,
    					"rangelength":[11,11]
    				},
    				"password":{
    					"required":true,
    					"rangelength":[6,12]
    				},
    				"repassword":{
    					"required":true,
    					"rangelength":[6,12],
    					"equalTo":"#password"
    				},
    				"email":{
    					"required":true,
    					"email":true
    				}
    			},
    			messages:{
    				"username":{
    					"required":"*用户名不能为空",
    				},
    				"name":{
    					"required":"*姓名不能为空",
    				},
    				"telephone":{
    					"required":"*电话不能为空",
    					"rangelength":"*电话号码格式不正确"
    				},
    				"password":{
    					"required":"*密码不能为空",
    					"rangelength":"*密码长度6-12位"
    				},
    				"repassword":{
    					"required":"*密码不能为空",
    					"rangelength":"*密码长度6-12位",
    					"equalTo":"*两次密码不一致"
    				},
    				"email":{
    					"required":"*邮箱不能为空",
    					"email":"*邮箱格式不正确"
    				}
    			}
    		});
  

    	
    	</script>
	</body>

</html>
