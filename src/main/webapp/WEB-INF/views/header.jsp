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
<title>Travelo</title>
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
											<li><a class="active" href="/">메인페이지</a></li>
											<li><a href="about.jsp">추천코스</a>
												<ul class="submenu">
													<li><a href="destination_details.html">가이드투어</a></li>
													<li><a href="elements.html">관광명소</a></li>
												</ul></li>
											<li><a href="#">자전거대여</i></a>
												<ul class="submenu">
													<li><a href="/about">이용안내</a></li>
													<li><a href="/product/product">자전거 상품</a></li>
												</ul></li>
											<li><a href="contact.html">커뮤니티</a>
												<ul class="submenu">
													<li><a href="/board/notice">공지사항</a></li>
													<li><a href="/review/photo">포토리뷰</a></li>
													<li><a href="/QnA/QnA">FAQ</a></li>
												</ul></li>
											<li><a href="javascript:void(0)">기타</a>
												<ul class="submenu">
													<li><sec:authorize access="isAnonymous()">
															<a href="/CustomLogin"> 로그인</a>
														</sec:authorize> <sec:authorize
															access="isAuthenticated() and hasAnyRole({'ROLE_USER','ROLE_ADMIN'}) ">
															<a href="javascript:void(0)" onclick="onLogout();">
																로그아웃</a>
														</sec:authorize></li>
													<li><sec:authorize
															access="isAuthenticated() and hasRole('ROLE_USER')">
															<li><a
																href="/users/index?userid=<sec:authentication property='principal.member.userid'/>">마이페이지</a></li>
														</sec:authorize> <sec:authorize access="hasRole('ROLE_ADMIN')">
															<li><a
																href="/admin/index?userid=<sec:authentication property='principal.member.userid'/>">관리자
																	페이지</a></li>
														</sec:authorize></li>
													<li><sec:authorize access="isAnonymous()">
															<li><a href="/signup">회원가입</a></i>
														</sec:authorize></li>
													<li><a href="/contact/contact">문의하기</a></li>
												</ul></li>
										</ul>
									</nav>
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 d-none d-lg-block logmenu">
								<div class="number">
									<p style="display: inline-block; padding-right: 40px;">
										<i class="fa fa-phone"></i> 10(256)-928 256
									</p>
									<div class="social_links d-none d-xl-block">
										<b><span id="nowTimes"></span></b>
									</div>
								</div>
							</div>
							<div class="seach_icon">
								<a data-toggle="modal" data-target="#exampleModalCenter"
									href="#"> <i class="fa fa-search"></i>
								</a>
							</div>
							<div class="col-12">
								<div class="mobile_menu d-block d-lg-none"></div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</header>
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
			document.getElementById("nowTimes").innerHTML =
			year + "/" + addzero(month) + "/" + addzero(date) + "&nbsp;" + hour
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