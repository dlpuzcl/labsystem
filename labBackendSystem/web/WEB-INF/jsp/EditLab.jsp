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
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	</head>

	<body>

		<div id="wrapper">
		
			<%@ include file="/navigation.jsp" %>	
			

			<div id="page-wrapper">
				<div class="row">
					<div class="breadcrumbs" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="index.html">首页</a>
							</li>
							<li>
								<a href="javascript:void(0)">教室管理</a>
							</li>
							<li>
								<a href="实验室添加.html">实验室修改</a>
							</li>
						</ul>
						<!-- /.breadcrumb -->
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">实验室修改</h1>
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
										<form class="form-horizontal" id="defaultForm" action="${pageContext.request.contextPath }/updateLab" method="post">
										
										<!-- <隐藏域传lid> -->
										
										<input type="hidden" name="lid" value="${lab.lid }">
										
											<div class="form-group">
												<label class="col-lg-3 control-label" >实验室名称</label>
												<div class="col-lg-5">
													<input type="text" class="form-control" name="lname" value = "${lab.lname }">
												</div>
											</div>
											<!--房间号-->
											<div class="form-group">
												<label class="col-lg-3 control-label" >房间号</label>
												<div class="col-lg-5">
													<input type="text" class="form-control" name="lroomid" value = "${lab.lroomid }">
												</div>
											</div>
											<!--人数-->
											<div class="form-group">
												<label class="col-lg-3 control-label">人数</label>
												<div class="col-lg-5">
													<input type="text" class="form-control" name="lpeople" value = "${lab.lpeople }">
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label no-padding-right" for="limited">备注</label>
												<div class="col-lg-5">
													<div class="pos-rel">
														<textarea class="form-control limited autosize-transition" id="limited" maxlength="50" name="lnote">${lab.lnote }</textarea>
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
	</body>

</html>