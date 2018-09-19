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

<title>实验室管理</title>

<!-- Bootstrap Core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" type="text/css" href="sweetalert/sweetalert.css">

<!-- HTML5Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	/* function delLab(lid){
		var isDel = confirm("您确认要删除吗？");
		if(isDel){
			//要删除
			location.href = "${pageContext.request.contextPath}/delLab?lid="+lid;
		}
	}*/
</script>
<style>
	#sty {
		height: 60px;
	}
	
	#che {
		width: 20px;
		height: 20px;
}
</style>

</head>

<body>

	<div id="wrapper">

		<%@ include file="/navigation.jsp"%>

		<div id="page-wrapper">

			<div class="row">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a
							href="主页.html">首页</a></li>
						<li><a href="javascript:void(0)">教室管理</a></li>
						<li><a href="实验室管理.html">实验室预约</a></li>
					</ul>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">实验室预约</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading" style="padding-bottom: 23px;">
							<i class="fa fa-bar-chart-o fa-fw"></i> 实验室预约

							<div class="pull-right">
								<form action="${pageContext.request.contextPath }/queryApply">
									<div class="btn-group">

										<select class="form-control" name="lid">

											<c:forEach items="${labList }" var="lab">

												<option value="${lab.lid }">${lab.lroomid }</option>

											</c:forEach>

										</select>

									</div>

									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<!--  
                                <div class="btn-group">
                                    <div class="iDate date">
										<input type="text" name="date">
										 <button type="button" class="addOn"></button>
									</div>
                                </div>
                                -->
									<div class="btn-group">

										<select class="form-control" name="weeks">



											<option value="1">第一周</option>
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

									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									<div class="btn-group">

										<button type="submit" class="btn btn-primary">查询</button>

									</div>
								</form>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="row">
								<div class=" col-md-12">
									<div class="table-responsive">
										<table width="100%" class="table table-bordered "
											style="text-align: center;">
											<thead>
												<tr class="info">
													<td>序号</td>
													<td>星期一</td>
													<td>星期二</td>
													<td>星期三</td>
													<td>星期四</td>
													<td>星期五</td>
													<td>星期六</td>
													<td>星期日</td>
												</tr>
											</thead>
											<tbody>
												<c:forEach begin="1" end="12" var="i">
													<tr id="sty">
														<td>第${i }节</td>

														<td>
															<div class="checkbox">
																<label> <input id="che" type="checkbox" value="">
																</label>
															</div>
														</td>
														<td>
															<div class="checkbox disabled">
																<label> <input id="che" type="checkbox" value=""
																	disabled>
																</label>
															</div>
														</td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>

													</tr>
												</c:forEach>


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
															class="btn btn-lg btn-success btn-block">提交</button>
													</form>
												</div>
											</div>
										</div>
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
				</div>


				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

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

	<script src="sweetalert/sweetalert.min.js"></script>

	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});

		function delLab(lid) {
			swal(
					{
						title : "确定删除吗？",
						text : "你将无法恢复该课程！",
						type : "warning",
						showCancelButton : true,
						confirmButtonColor : "#DD6B55",
						confirmButtonText : "是的，我要删除！",
						cancelButtonText : "让我再考虑一下…",
						closeOnConfirm : false,
						closeOnCancel : false
					},
					function(isConfirm) {
						if (isConfirm) {
							swal(
									{
										title : "删除成功！",
										text : "你成功删除了这条门课程。",
										type : "success"
									},
									function() {
										window.location = "${pageContext.request.contextPath}/delLab?lid="
												+ lid
									})
						} else {
							swal({
								title : "已取消",
								text : "这门课程是安全的！",
								type : "error"
							})
						}
					})
		}
	</script>



</body>

</html>