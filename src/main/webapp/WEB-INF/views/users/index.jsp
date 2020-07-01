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
<title>RENTAL BYCICLE COMPANY</title>
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
<link href="/resources/user.index.css" rel="stylesheet">
<link href="/resources/user/css/popup.css" rel="stylesheet">
</head>
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
						<h4 class="page-title">管理者ページ</h4>
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
									<h5 class="text-muted vb">ログイン回数</h5>
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
										累積ログイン<br> 失敗回数
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
									<h4 class="text-muted vb">予約回数</h4>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
									<h3 class="counter text-right m-t-15 text-primary">${count.count == null ? '0' : count.count }</h3>
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
					<h4 style="text-align: center;">
						予約日および総金額 <a href="#layer1" class="btn btn-warning btn-example">
							私の商品・予約者現況 </a>
					</h4>
					<!-- HTML -->
					<div id="chartdiv"></div>
				</div>
				<!--row -->

				<!-- /.row -->
				<!-- row -->
				<div class="row">
					<c:forEach items="${reply }" var="re">
						<div class="col-md-6 col-lg-6 col-sm-6">
							<div class="white-box">
								<h3 class="box-title">Recent Comments</h3>
								<div class="comment-center">
									<div class="comment-body" style="min-width: 100%">


										<div class="mail-contnet">
											<h5>${re.comm }</h5>
											<span class="mail-desc">${re.n_num }번 공지사항 :
												${re.nickname == null ? re.userid : re.nickname }님의 댓글</span><a href="javacript:void(0)" class="action"><i
												class="ti-close text-danger"></i></a> <a
												href="javacript:void(0)" class="action"><i
												class="ti-check text-success"></i></a> <span class="pull-left"
												style="color: green;"><i
												class="fa fa-thumbs-o-up fa-fw" aria-hidden="true"></i><b
												style="color: blue;">${re.likes }</b>&nbsp;&nbsp;&nbsp;&nbsp;</span>
											<span class="pull-left"
												style="color: red; text-align: right;"><i
												class="fa fa-thumbs-o-down fa-fw" aria-hidden="true"></i><b>${re.hates }</b></span>
											<span class="time pull-right"><fmt:formatDate
													value="${re.regdate }" pattern="YY/MM/dd HH:MM" /></span>
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
	<div id="layer1" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts" style="overflow: scroll;">
				<!--content //-->
				<p class="ctxt mb20">
				<div class="col-12">
					<div class="card" style="width: 700px; height: 100%;">
						<div class="card-body text-center">
							<h3 class="card-title m-b-0">
								등록물품 예약자 현황<a href="#" class="btn-layerClose"
									style="width: 30px; border: none; position: absolute; right: 50px; top: 10px; background: #fff;"><i
									class="fa fa-times fa-fw fa-2x" style="color: black;"></i></a>
							</h3>


						</div>
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead class="thead-light" style="text-align: center;">
									<tr>
										<!-- <th style="text-align: center; vertical-align: middle;"><label
									class="customcheckbox m-b-20">
								</label></th> -->
										<th style="text-align: left;">닉네임</th>
										<th style="text-align: left;">상품</th>
										<th style="text-align: left;">가격</th>
										<th style="text-align: left;">사진</th>

									</tr>
								</thead>
								<!--start-->
								<tbody>
									<c:forEach items="${list}" var="index">
										<tr>
											<td class="goods"><a  href="javascript:void(0)" style="color:black;">${index.nickname == null ? index.userid : index.nickname}</a>
											</td>

											<td class="goods"><a  href="javascript:void(0)" style="color:black;">${index.goods}</a>
											</td>
											<td class="goods"><a  href="javascript:void(0)" style="color:black;">${index.price}</a>
											</td>
											<td><img style="max-width: 150px;"
												src="/upload/${index.goodsphoto }"></td>

										</tr>

									</c:forEach>
								</tbody>

							</table>
						</div>
					</div>
				</div>

				<!--// content-->
			</div>
		</div>
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
	<script src="/resources/user/js/simple.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$.toast({
				heading : 'Welcome to admin Page',
				text : 'You are Management All of User in Admin Page.',
				position : 'top-right',
				loaderBg : '#ff6849',
				icon : 'info',
				hideAfter : 3500,
				stack : 6
			})
		});

	</script>


	<script type="text/javascript">
		$(".flex ul li").on("mouseover", function(e) {
			$(this).addClass("active");
		})
		$(".flex ul li").on("mouseout", function(e) {
			$(this).removeClass("active");
		})
	</script>
	<script type="text/javascript">
		var actionForm = $("#actionForm");
		$(".paging li a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		})
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
		$("#table tbody #select").on("change",function(e){
		values = $(this).val();
		userid = $(this).parent().parent().find("#userid").text();
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
	<script>
	var datas = ${JsonData };
	var	price = new Array();
	var days = new Array();
		for(var i=0; i < datas.length; i++){
			 price[i] = datas[i].price;
			days[i]=datas[i].resdate;
		};	
		if(datas.length == 0){
			$("#chartRow").hide();
		}else if(datas.length !=0){
			$("#chartRow").show();
		}
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

chart.data =datas;
	var values = 0;
	for(var val of datas){
		values += Number(val.price);
	}

var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.dataFields.category = "resdate";
categoryAxis.renderer.minGridDistance = 40;
categoryAxis.fontSize = 11;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.min = 0;
valueAxis.max = Math.max.apply(null,price)+3000;
valueAxis.strictMinMax = true;
valueAxis.renderer.minGridDistance = 30;
// axis break
var axisBreak = valueAxis.axisBreaks.create();
axisBreak.startValue = 5000;
axisBreak.endValue = 15000;
//axisBreak.breakSize = 0.005;

// fixed axis break
var d = (axisBreak.endValue - axisBreak.startValue) / (valueAxis.max - valueAxis.min);
axisBreak.breakSize = 0.1 * (1 - d) / d; // 0.05 means that the break will take 5% of the total value axis height

// make break expand on hover
var hoverState = axisBreak.states.create("hover");
hoverState.properties.breakSize = 1;
hoverState.properties.opacity = 0.1;
hoverState.transitionDuration = 1500;

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
series.dataFields.categoryX = "resdate";
series.dataFields.valueY = "price";
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
