<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>RENTAL BYCICLE COMPANY</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/gijgo.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.css">
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">


</head>
<style>
.slicknav_btn {
	top: -15px !important;
	right: -15px !important;
}

@media ( max-width : 991px) and (min-width: 768px) {
	.header-area .main-header-area {
		padding: 30px 20px !important;
	}
}

@media ( min-width : 993px) {
	.col-lg-4 {
		display: inline-block !important;
	}
}

.fa-shopping-cart {
	position: relative;
}

.fa-shopping-cart::after {
	content: attr(data-count);
	color: red;
	position: absolute;
	font-size:12px;
	top: -20px;
	right: 5px;
}
@media (min-width: 992px){
 .d-lg-block{
  display: inline-block !important;
 }
}
</style>
<body>
	<header>
		<div class="header-area ">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid">
					<div class="header_bottom_border">
						<div class="row align-items-center">

							<div class="col-xl-7 col-lg-7"
								style="text-align: center; max-height: 75px; display: inline-block;">
								<div class="main-menu  d-none d-lg-block">
									<nav>
										<ul id="navigation">
										<sec:authorize access="isAnonymous()">
											<li><a class="active" href="/">MAIN PAGE</a></li>
											</sec:authorize>
										<sec:authorize access="isAuthenticated()">
											<li><a class="active" href="/<sec:authentication property="principal.member.userid"/>">MAIN PAGE</a></li>
											</sec:authorize>
											
											<li><a href="#">INFOMATION</a>
												<ul class="submenu">
													<li><a href="/about">利用案内</a></li>
													<li><a href="/tourist">観光名所</a></li>
												</ul></li>
											<li><a href="#">GOODS</a>
												<ul class="submenu">
													<li><a href="/product/product">自転車レンタル</a></li>
													<sec:authorize access="isAuthenticated()">
														<li><a
															href="/course/course?userid=<sec:authentication property='principal.member.userid'/>">ガイドツアー情報</a>
														</li>
													</sec:authorize>
												</ul></li>
											<li><a href="#">COMMUNITY</a>
												<ul class="submenu">
													<li><a href="/board/notice">公知掲示板</a></li>
													<li><a href="/review/photo">写真レビュー</a></li>
													<li><a href="/QnA/QnA">FAQ</a></li>
												</ul></li>
											<li><a href="#">#</a>
												<ul class="submenu">
													<li><sec:authorize access="isAnonymous()">
															<a href="/login">ログイン</a>
														</sec:authorize> <sec:authorize
															access="isAuthenticated() and hasAnyRole({'ROLE_USER','ROLE_ADMIN'}) ">
															<a href="javascript:void(0)" onclick="onLogout();">
																ログアウト</a>
														</sec:authorize></li>
													<li><sec:authorize
															access="isAuthenticated() and hasRole('ROLE_USER')">
															<li><a
																href="/users/index?userid=<sec:authentication property='principal.member.userid'/>">マイページ</a></li>
														</sec:authorize> <sec:authorize access="hasRole('ROLE_ADMIN')">
															<li><a
																href="/admin/index?userid=<sec:authentication property='principal.member.userid'/>">管理者ページ
																	</a></li>
														</sec:authorize></li>
													<li><sec:authorize access="isAnonymous()">
															<li><a href="/signup">会員登録</a>
														</sec:authorize></li>
													<li><a href="/contact/contact">お問い合わせ</a></li>
												</ul></li>
										</ul>
									</nav>
								</div>
							</div>
							<div class="col-xl-3 col-lg-3 d-none d-lg-block logmenu">
								<div class="number">
									<p style="display: inline-block; padding-right: 40px;">
										<i class="fa fa-phone">+82 10-2345-6789</i>
									</p>
									<div class="social_links d-none d-xl-block">
										<b><span id="nowTimes"></span></b>
									</div>
								</div>
							</div>
							<sec:authorize
								access="isAuthenticated() and hasRole('ROLE_USER')">
								<div class="cart">
									<a
										href="/product/cart?userid=<sec:authentication property='principal.member.userid'/>">
										<i id='cart' class="fa fa-shopping-cart fa-lg" aria-hidden="true" data-count=${count-cart } data-id='<sec:authentication property='principal.member.userid'/>'></i>
									</a>
								</div>
							</sec:authorize>
							<div class="seach_icon"></div>
							<div class="col-12">
								<div class="mobile_menu d-block d-lg-none"></div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</header>
	<script
  src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			// 시간을 딜레이 없이 나타내기위한 선 실행
			realTimer();
			// 이후 0.5초에 한번씩 시간을 갱신한다.
			setInterval(realTimer, 500);
		});
		// 시간을 출력
		function realTimer() {
			const nowDate = new Date();
			const year = nowDate.getFullYear();
			const month = nowDate.getMonth() + 1;
			const date = nowDate.getDate();
			const hour = nowDate.getHours();
			const min = nowDate.getMinutes();
			const sec = nowDate.getSeconds();
			document.getElementById("nowTimes").innerHTML = year + "/"
					+ addzero(month) + "/" + addzero(date) + "&nbsp;" + hour
					+ ":" + addzero(min) + ":" + addzero(sec);
		}
		// 1자리수의 숫자인 경우 앞에 0을 붙여준다.
		function addzero(num) {
			if (num < 10) {
				num = "0" + num;
			}
			return num;
		}
	</script>
	<script type="text/javascript">
	var id = $("#cart").attr("data-id");
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			})
	setInterval(
		$.ajax({
			url : "/cart_counter",
			type : 'post',
			data : JSON.stringify({
				"userid" : id
			}),
			contentType : "application/json; charset=UTF-8",
			processData : false,
			success : function(result) {
				$("#cart").attr("data-count",result);
			},
			error : function(req, status, error) {
				console.log(error);
			}
		})
	,10000)
	</script>