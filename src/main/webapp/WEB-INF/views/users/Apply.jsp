<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="../plugins/images/favicon.png">
<title>Pixel Admin - Responsive Admin Dashboard Template build
	with Twitter Bootstrap</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/admin/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Menu CSS -->
<link
	href="/resources/adminplugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
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
						<h4 class="page-title">Rental Apply Register</h4>
					</div>
					<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
						<ol class="breadcrumb">
							<li><a href="#">Dashboard</a></li>
							<li class="active">Rental Apply Register</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
				<!-- .row -->
				<div class="row">

					<sub></sub>
					<div class="col-md-8 col-xs-12">
						<div class="white-box">
							<form class="form-horizontal form-material" id="modifyform"
								method="post" action="/users/Apply/${userid }">
								<input type="hidden" value="${_csrf.token }" name="${_csrf.parameterName }">

								<div class="form-group">
									<label class="col-md-12">User NickName</label>
									<div class="col-md-12">
										<input type="text" name="userName"
											placeholder="Write Your NickName"
											class="form-control form-control-line">
									</div>
								</div>
								
								<div class="form-group">
									<label for="example-email" class="col-md-12">Email</label>
									<div class="col-md-12">
										<input type="email" class="form-control form-control-line"
											name="useremail" id="example-email"
											value="<sec:authentication property="principal.member.useremail" /> "
											readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="example-email" class="col-md-12">Address</label>
									<div class="col-md-12">
										<input type="text" class="form-control form-control-line"
											name="address" id="address" placeholder="Wrtie Your Address">
									</div>
								</div>
								<div class="form-group">
									<label for="phonenum" class="col-md-12">Phone-Number</label>
									<div class="col-md-12">
										<input type="text" class="form-control form-control-line"
											name="phonenum" id="phonenum" pattern="[0-9]{3,12}"
											maxlength="11" min="3"
											placeholder="Wrtie Your Phone Number no hyphen">
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-12">ROLE</label>
									<div class="col-md-12">
										<input type="text" name='role'
											value="<sec:authentication property="principal.member.userName" /> "
											readonly class="form-control form-control-line">
									</div>
								</div>
								<a href="javascript:void(0)" onclick="onCheck()"
									class="btn label label-warning" id="app">신청</a> <a
									href="javascript:void(0)" class="btn label label-info"
									id="modify" onclick="onCheck()">수정</a> <span
									class="btn label label-success"
									onclick="location.href='/contact/contact'">신청 취소 문의</span>
							</form>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
			<footer class="footer text-center"> 2020 &copy;
				www.rental.bike </footer>
		</div>
		<!-- /#page-wrapper -->
	</div>
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
	<!-- Custom Theme JavaScript -->
	<script src="/resources/admin/js/custom.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#modify").on("click", function(e) {
				var textinput = $("input[type='text']");
				var emailinput = $("input[type='email']");

				$(textinput).removeAttr("readonly");
				$(emailinput).removeAttr("readonly");

				$("#app").show();
				$(this).hide();

				$("input[name='userid']").attr("readonly", true);
				$("input[name='role']").attr("readonly", true);
			})
		})
	</script>
	<script type="text/javascript">
		var phone = $("input[name='phonenum']");
		$(phone).on(
				"change",
				function(e) {

					$(this).val(
							$(this).val().replace(/[^0-9]/g, "").replace(
									/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3")
									.replace("--", "-"));

				})
		var form = $("#modifyform");
		function onCheck() {

			var nickname = $("input[name='userName']").val();
			var Addr = $("input[name='address']").val();
			var phone = $("input[name='phonenum']").val();

			if (!nickname) {
				alert("닉네임을 적어주시길 바랍니다.");
				return false;
			}
			if (!Addr) {
				alert("주소를 적어주세요");
				return false;
			}
			if (!phone && phone.length < 12) {
				alert("핸드폰 번호를 적어주시길 바랍니다.");
				return false;
			}
			form.submit();

		}
	</script>
	<script type="text/javascript">
		$(document).on("ready", function(e) {
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			})

			var id = `${userid}`;
			$("#modify").hide();
			$("#app").show();
			$.ajax({
				url : "/confirm",
				type : "post",
				data : JSON.stringify({
					"userid" : id
				}),
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				processData : false,
				success : $(function(res) {
					if (!res) {
						$("#app").hide();
						$("#modify").show();
					} else {
						$("#app").show();
						$("#modify").hide();
					}
				})
			})
		})
	</script>
</body>

</html>