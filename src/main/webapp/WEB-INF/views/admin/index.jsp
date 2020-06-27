<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header"
	th:content="${_csrf.headerName}" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/admin/plugins/images/favicon.png">
<title>Admin Manage Page</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/admin/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Menu CSS -->
<link
	href="/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet">
<!-- toast CSS -->
<link
	href="/resources/admin/plugins/bower_components/toast-master/css/jquery.toast.css"
	rel="stylesheet">
<!-- morris CSS -->
<link
	href="/resources/admin/plugins/bower_components/morrisjs/morris.css"
	rel="stylesheet">
<!-- animation CSS -->
<link href="/resources/admin/css/animate.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/admin/css/style.css" rel="stylesheet">
<!-- color CSS -->
<link href="/resources/admin/css/colors/blue-dark.css" id="theme"
	rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<link href="/resources/admin/css/admin.index.css" rel="stylesheet">
</head>
<style>
#intable th{
padding: 0 !important;
margin: 0 !important;
border-left: 1px solid #eee;
height: 30px;
}
</style>
<body>

	<!-- Preloader -->
	<div class="preloader">
		<div class="cssload-speeding-wheel"></div>
	</div>

	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top m-b-0">
			<div class="navbar-header">
				<a class="navbar-toggle hidden-sm hidden-md hidden-lg "
					href="javascript:void(0)" data-toggle="collapse"
					data-target=".navbar-collapse"><i class="fa fa-bars"></i></a>


				<ul class="nav navbar-top-links navbar-right pull-right">
					<li><a class="profile-pic" href="#"> </a></li>
				</ul>
			</div>
		</nav>

		<!-- Left navbar-header -->
		<%@include file="navi.jsp"%>
		<!-- Left navbar-header end -->
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row bg-title">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">Dashboard</h4>
					</div>

					<!-- /.col-lg-12 -->
				</div>
				<!-- row -->
				<div class="row">
					<!--col -->
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="white-box">
							<div class="col-in row">
								<div class="col-md-6 col-sm-6 col-xs-6">
									<i data-icon="E" class="linea-icon linea-basic"></i>
									<h5 class="text-muted vb">로그인 횟수</h5>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
									<h3 class="counter text-right m-t-15 text-danger">${loginfo.login_count }</h3>
								</div>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="progress">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 100%">
											<span class="sr-only"> Complete (success)</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col -->
					<!--col -->
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="white-box">
							<div class="col-in row">
								<div class="col-md-6 col-sm-6 col-xs-6">
									<i class="linea-icon linea-basic" data-icon="&#xe01b;"></i>
									<h5 class="text-muted vb">
										누적 로그인 실패<br>
									</h5>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
									<h3 class="counter text-right m-t-15 text-megna">${loginfo.fullfail_count }</h3>
								</div>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="progress">
										<div class="progress-bar progress-bar-megna"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 100%">
											<span class="sr-only"> Complete (success)</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col -->
					<!--col -->
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="white-box">
							<div class="col-in row">
								<div class="col-md-6 col-sm-6 col-xs-6">
									<i class="linea-icon linea-basic" data-icon="&#xe00b;"></i>
									<h4 class="text-muted vb">모든 회원</h4>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
									<h3 class="counter text-right m-t-15 text-primary">${users }</h3>
								</div>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="progress">
										<div class="progress-bar progress-bar-primary"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 100%">
											<span class="sr-only"> Complete (success)</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				<!--row -->
				<div class="row" id="chartRow">
					<!-- HTML -->
					<div id="chartdiv"></div>
				</div>
				<!--row -->
				<div class="row">
					<div class="col-sm-12">
						<div class="white-box">
							<div class="container">
								<form id="searchForm" name="myform" method="get"
									action="/admin/index">
									<input type="hidden" name="userid"
										value="<sec:authentication property="principal.member.userid"/>">
									<input type="hidden" name="pageNum"
										value="${pageMaker.cri.pageNum}"> <input type="hidden"
										name="amount" value="${pageMaker.cri.amount }">
									<div class="container">
										<div
											class="col-md-1 col-sm-1 col-xs-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1"></div>
										<div class="col-md-2 col-sm-2 col-xs-4"
											style="text-align: center;">
											<select class="row b-none" name="type">
												<option value="U"
													<c:out value="${pageMaker.cri.type eq 'U'?'selected':''}"/>>名前</option>
												<option value="E"
													<c:out value="${pageMaker.cri.type eq 'E'?'selected':''}"/>>メール</option>
											</select>
										</div>
										<div class="col-md-3 col-sm-4 col-xs-5"
											style="margin-top: 6px; position: relative; top: -10px;">

											<input type="text" name="keyword" class="search_word"
												value="<c:out value='${pageMaker.cri.keyword }'/>">
											<button class="btn_search btn" type="submit"
												style="background-color: #fff;">
												<i class="fa fa-search"></i><span class="sr-only">검색버튼</span>
											</button>
										</div>
									</div>
								</form>
							</div>

							<div class="table-responsive" id="table">
								<table class="table table-striped"
									style="text-align: center; justify-content: center;">
									<thead style="border-top: 1px solid">
										<tr>
											<th style="text-align: center; justify-content: center;">아이디</th>
											<th style="text-align: center; justify-content: center;">등록일자</th>
											<th colspan="1"
												style="text-align: center; justify-content: center;">ip</th>
											<th colspan="1"
												style="text-align: center; justify-content: center;">계정</th>
											<th colspan="3" 
												style="text-align: center; justify-content: center; padding-bottom: 0 !important;"><table class="table table-striped" id="intable" >
													<tr >
														<th style="text-align: center;">계정여부</th>
														<th style="text-align: center;width:155px; ">IP차단여부</th>
														<th style="text-align: center; width: 75px;">㉿</th>
													</tr>
												</table>
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${UserList }">

											<tr id="tab">
												<td class="txt-oflo" id="userid">${list.nickname == null ? list.userid : list.nickname }</td>
												<td class="txt-oflo">${list.regDate }</td>
												<td class="ip">${list.ip }</td>
												<td><span class="text-success"
													id="${list.enabled == true && list.thisip == false ? 'enabled' : 'disenabled'}">${list.enabled == true && list.thisip == false ? '사용가능' : '사용불가' }</span></td>
												<td class="input-group-addon"
													style="background-color: #fff;"><select name="select"
													id="select" style="text-align: center;">
														<option value="null">선택</option>
														<option value="true">사용가능</option>
														<option value="false">사용불가</option>
												</select> <a href="#" type="button" class="btn" style="color: red;"
													id="change">변경</a></td>
												<td class="input-group-addon"
													style="background-color: #fff;"><select name="ban"
													id="ban" style="text-align: center;">
														<option value="null">선택</option>
														<option value="true">차단헤체</option>
														<option value="false">차단</option>
												</select> <a href="#" type="button" class="btn" style="color: red;"
													id="ipban">차단</a></td>
												<td class="input-group-addon"
													style="background-color: #fff;"><input name="out"
													type="radio"
													style="position: relative; top: 2px; left: 4px; transform: scale(1.2); cursor: pointer;"><a
													href="#" id="delete" type="button" class="btn"
													style="color: red;">탈퇴</a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
								<div class="flex paging">
									<ul>
										<c:if test="${pageMaker.prev }">
											<li><a href="${pageMaker.startPage - 1 }"><i
													class="fa  fa-arrow-left"></i></a></li>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage }"
											end="${pageMaker.endPage }">
											<li><a href="${num }"
												class="${pageMaker.cri.pageNum == num ? 'active':''  }">${num }</a></li>
										</c:forEach>
										<c:if test="${pageMaker.next }">
											<li><a href="${pageMaker.endPage+1}"><i
													class="fa  fa-arrow-right"></i></a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
				<!-- row -->
				<div class="row" id="comment_block">
					<c:forEach items="${reply }" var="re">
						<div class="col-md-6 col-lg-6 col-sm-6">
							<div class="white-box">
								<h3 class="box-title">Recent Comments</h3>
								<div class="comment-center">
									<div class="comment-body" style="min-width: 100%">


										<div class="mail-contnet">
											<h5>닉네임 : ${re.userid }</h5>
											<span class="mail-desc">${re.comm }</span><a
												href="javacript:void(0)" class="action"><i
												class="ti-close text-danger"></i></a> <a
												href="javacript:void(0)" class="action"><i
												class="ti-check text-success"></i></a> <span class="pull-left"
												style="color: green;"><i
												class="fa fa-thumbs-o-up fa-fw" aria-hidden="true"></i><b
												style="color: blue;">${re.likes }</b>&nbsp;&nbsp;</span> <span
												class="pull-left" style="color: red; text-align: right;"><i
												class="fa fa-thumbs-o-down fa-fw" aria-hidden="true"></i><b>${re.hates }</b></span>
											<span class="time pull-right"><fmt:formatDate
													value="${re.regdate }" pattern="YY/MM/dd" /></span>
										</div>
									</div>


								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
			<footer class="footer text-center"> 2017 &copy; Pixel Admin
				brought to you by wrappixel.com </footer>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<form id="actionForm" action="/admin/index" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="userid"
			value="<sec:authentication property="principal.member.userid"/>">
	</form>

	<!-- /#wrapper -->
	<!-- jQuery -->
	<script
		src="/resources/admin/plugins/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/admin/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Menu Plugin JavaScript -->
	<script
		src="/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
	<!--slimscroll JavaScript -->
	<script src="/resources/admin/js/jquery.slimscroll.js"></script>
	<!--Wave Effects -->
	<script src="/resources/admin/js/waves.js"></script>
	<!--Counter js -->
	<script
		src="/resources/admin/plugins/bower_components/waypoints/lib/jquery.waypoints.js"></script>
	<script
		src="/resources/admin/plugins/bower_components/counterup/jquery.counterup.min.js"></script>
	<!--Morris JavaScript -->
	<script
		src="/resources/admin/plugins/bower_components/raphael/raphael-min.js"></script>
	<script
		src="/resources/admin/plugins/bower_components/morrisjs/morris.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="/resources/admin/js/custom.min.js"></script>
	<script src="/resources/admin/js/dashboard1.js"></script>
	<script
		src="/resources/admin/plugins/bower_components/toast-master/js/jquery.toast.js"></script>
	<!-- Resources -->
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
	<script src="/resources/admin/js/admin.index.js"></script>
	<script type="text/javascript">
	var data = ${JsonData };
	console.log(data);
	var days = new Array();
	var InUser = new Array();
		for(var i=0; i < data.length; i++){
			 days[i] = data[i].day;
			InUser[i]=data[i].dayofAccount;	
			console.log(days);
			console.log(InUser);
		};	
		if(data.length == 0){
			$("#chartRow").hide();
		}else if(data.length !=0){
			$("#chartRow").show();
		}
</script>
	<script type="text/javascript">
	$(function(e) {

		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		})
		//회원 탈퇴
		let on = false,check;
		$('#table tbody input[name="out"]').on('click',function(e){
		let on = $(this).prop('checked');
		if(on == true){
		check = this;
		}else{
		check = this;
		}
		})
		$('#table tbody #delete').on("click", function(e) {
		var textid = $(this).parent().parent();
		var id = $(textid).find("#userid").text();

		if(typeof check !== "undefined"){
			
			$.ajax({
				url : "/id_delete",
				type : 'POST',
				data : JSON.stringify({
					"userid" : id
				}),
				contentType : "application/json; charset=UTF-8",
				processData : false,
				success : function(result) {
					alert(id + "님이 성공적으로 탈퇴가 되었습니다.");
					if(result){
						location.reload(true);
					return;
					}
				},
				error : function(req, status, error) {
					console.log(error);
				}
			});
		}
		})
	})
		$(function(e){
			
		var values = false;
		var userid = "";
		console.log(userid);
		$("#table tbody #select").on("change",function(e){
		values = $(this).val();
		console.log(values);
		userid = $(this).parent().parent().find("#userid").text();
		console.log(userid);
		})
		
		$("#table tbody #change").on("click",function(e){
		e.preventDefault();
	
		console.log("this values :" +values);
			$.ajax({
				url : "/revitailze",
				type : 'POST',
				data : JSON.stringify({
					"enabled" : values,
					"userid" : userid
				}),
				contentType : "application/json; charset=UTF-8",
				processData : false,
				success : function(result) {
					if(result){
					alert(userid + "님의 상태가 성공적으로 변경 되었습니다.");
						window.location.href=window.location.href
					return;
					}
				},
				error : function(req, status, error) {
					console.log(error);
				}
			})
		
		})

		})
</script>
	<script type="text/javascript">
$(function(e){
	
	var values = false;
	var userid = "";
	var ip = "";
	console.log(userid);
	$("#table tbody #ban").on("change",function(e){
	values = $(this).val();
	console.log(values);
	ip = $(this).parent().parent().find(".ip").text();
	userid = $(this).parent().parent().find("#userid").text();
	console.log(ip);
	})
	
	$("#table tbody #ipban").on("click",function(e){
	e.preventDefault();

	console.log("this values :" +values);
		$.ajax({
			url : "/ip",
			type : 'POST',
			data : JSON.stringify({
				"ip" : ip,
				"userid" : userid,
				"ban" : values
			}),
			contentType : "application/json; charset=UTF-8",
			processData : false,
			success : function(result) {
				if(result){
				alert(userid + "님이 차단되었습니다.");
					window.location.href=window.location.href
				}else{
					alert(userid + "님이 차단해체 되었습니다.");					
					window.location.href=window.location.href
				}
			},
			error : function(req, status, error) {
				console.log(error);
			}
		})
	
	})

	})
</script>

	<script>

	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		var chart = am4core.create("chartdiv", am4charts.XYChart);
		chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

		chart.data =data;

		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.renderer.grid.template.location = 0;
		categoryAxis.dataFields.category = "day";
		categoryAxis.renderer.minGridDistance = 40;
		categoryAxis.fontSize = 14;

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.min = 0;
		valueAxis.max = Math.max.apply(null,InUser)+5;
		valueAxis.strictMinMax = true;
		valueAxis.renderer.minGridDistance = 30;
		// axis break
		var axisBreak = valueAxis.axisBreaks.create();
		axisBreak.startValue = 2100;
		axisBreak.endValue = 22900;
		//axisBreak.breakSize = 0.005;

		// fixed axis break
		var d = (axisBreak.endValue - axisBreak.startValue) / (valueAxis.max - valueAxis.min);
		axisBreak.breakSize = 0.05 * (1 - d) / d; // 0.05 means that the break will take 5% of the total value axis height

		// make break expand on hover
		var hoverState = axisBreak.states.create("hover");
		hoverState.properties.breakSize = 1;
		hoverState.properties.opacity = 0.1;
		hoverState.transitionDuration = 1000;

		axisBreak.defaultState.transitionDuration = 1000;
		/*
		// this is exactly the same, but with events
		axisBreak.events.on("over", function() {
		  axisBreak.animate(
		    [{ property: "breakSize", to: 1 }, { property: "opacity", to: 0.1 }],
		    1500,
		    am4core.ease.sinOut
		  );
		});
		axisBreak.events.on("out", function() {
		  axisBreak.animate(
		    [{ property: "breakSize", to: 0.005 }, { property: "opacity", to: 1 }],
		    1000,
		    am4core.ease.quadOut
		  );
		});*/

		var series = chart.series.push(new am4charts.ColumnSeries());
		series.dataFields.categoryX = "day";
		series.dataFields.valueY = "dayofAccount";
		series.columns.template.tooltipText = "{valueY.value}";
		series.columns.template.tooltipY = 0;
		series.columns.template.strokeOpacity = 0;

		// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
		series.columns.template.adapter.add("fill", function(fill, target) {
		  return chart.colors.getIndex(target.dataItem.index);
		});

		}); // end am4core.ready()
	</script>
</body>

</html>
