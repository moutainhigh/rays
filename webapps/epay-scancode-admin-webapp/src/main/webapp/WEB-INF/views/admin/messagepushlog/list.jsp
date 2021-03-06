<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="page" uri="page" %> 
<%
   String path =  request.getContextPath();
   request.setAttribute("path", path);
%>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<style type="text/css">
.td0{
	text-align: right;
	font-weight: bolder;
}
#form .portlet.box.green-haze{
	background-color: #ccc;
	height: 1px;
	line-height: 1px;
	margin: 10px 0;
}
</style>
<head>
<meta charset="utf-8"/>
<title>PlatfromAdviertisement Manager</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN PAGE LEVEL STYLES -->
<jsp:include page="../include/commoncss.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${path}/resources/assets/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/styles/bootstrap-select.css"/>

<!-- BEGIN PAGE LEVEL STYLES -->
<!-- END PAGE LEVEL STYLES -->
<!-- END PAGE LEVEL STYLES -->
<link rel="shortcut icon" href="../favicon.ico"/>
</head>
<body class="page-header-fixed page-quick-sidebar-over-content">
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<section id="ucenterSection">
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<!-- BEGIN SEARCH CONDITION -->
			<div class="portlet box ">
				<div class="portlet-body form">
					<!-- BEGIN FORM-->
					<form action="#" class="form-horizontal" id="form">
						<div class="form-body">
							
							<!--/row-->
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label col-md-4">渠道名称</label>
										<div class="col-md-8">
											<select id="channelNo" name="channelNo" class="form-control selectpicker show-tick" data-live-search="true">
												<option value=''>  --  请选择  --  </option>
									        </select>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label col-md-4">消息类型</label>
										<div class="col-md-8">
											<select id="messageType" name="messageType" class="form-control">
												<option value = "">  --  请选择  --  </option>
												<c:forEach var="item" items="${messageType}">
													<option value = "${item.value}">${item.desc}</option>
												</c:forEach>
									        </select>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label col-md-4">推送方式</label>
										<div class="col-md-8">
											<select id="pushWay" name="pushWay" class="form-control">
												<option value = "">  --  请选择  --  </option>
												<c:forEach var="item" items="${pushWay}">
													<option value = "${item.value}">${item.desc}</option>
												</c:forEach>
									        </select>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label col-md-4">代理商级别</label>
										<div class="col-md-8">
											<select class="form-control" id="temp1" name="temp1">
												<option value = "">  --  请选择  --  </option>
												<c:forEach var="item" items="${temp1}">
													<option value = "${item.paraVal}">${item.paraVal}</option>
												</c:forEach>
									        </select>
										</div>
									</div>
								</div>
								
							</div>
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label col-md-4">开始时间</label>
										<div class="col-md-8">
											<input type="text" class="form-control date-picker" id="beginTimeStr" name="beginTimeStr">
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="control-label col-md-4">结束时间</label>
										<div class="col-md-8">
											<input type="text" class="form-control date-picker" id="endTimeStr" name="endTimeStr">
										</div>
									</div>
								</div>								
<!-- 								<div class="col-md-3" style="display: none;"> -->
<!-- 									<div class="form-group"> -->
<!-- 										<label class="control-label col-md-4">记录状态</label> -->
<!-- 										<div class="col-md-8"> -->
<!-- 											<select id="recordStatus" name="recordStatus" class="form-control"> -->
<!-- 												<option value = "">  --  请选择  --  </option> -->
<!-- 												<option value='Y'>正常</option> -->
<!-- 												<option value='N'>删除</option> -->
<!-- 									        </select> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
								<div class="col-md-3" style="display: none;">
									<div class="form-group">
										<label class="control-label col-md-4">推送频率</label>
										<div class="col-md-8">
											<select class="form-control" id="pushTime" name="pushTime">
												<option value = "">  --  请选择  --  </option>
												<c:forEach var="item" items="${pushTime}">
													<option value = "${item.value}">${item.desc}</option>
												</c:forEach>
									        </select>
										</div>
									</div>
								</div>								
								
							</div>
							<div class="portlet box green-haze">
								
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="control-label col-md-2"></label>
										<div class="col-md-10">
											<button type="button" class="btn green" id="query">查询</button>
											<button type="button" class="btn default" id="cancle">重置</button>
										</div>
									</div>
								</div>
								<!--/span-->
							</div>
							
						</div>
					</form>
					<!-- END FORM-->
				</div>
			</div>
			<!-- END SEARCH CONDITION -->
			
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box green-haze">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i>消息推送日志列表
							</div>
						</div>
						<div class="portlet-body" id="tablec">
							
						</div>
						<!-- <div class="portlet-body" id="tablec1">
							
						</div> -->
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<!-- END CONTENT -->
	</section>
</div>
<!-- END CONTAINER -->
<jsp:include page="../include/footerjs.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL PLUGINS -->

<script src="${path}/resources/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${path}/resources/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${path}/resources/assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="${path}/resources/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="${path}/resources/scripts/ajaxfileupload.js" type="text/javascript"></script>
<script src="${path}/resources/scripts/base.js" type="text/javascript"></script>
<script src="${path}/resources/scripts/common.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/resources/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${path}/resources/assets/global/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="${path}/resources/scripts/bootstrap-select.js" type="text/javascript"></script>

<script src="${path}/resources/scripts/admin/messagepushlog/list.js" type="text/javascript"></script>
<div style="display: none;" id="baseUrl">${path}</div>
</body>
<!-- END BODY -->
</html>