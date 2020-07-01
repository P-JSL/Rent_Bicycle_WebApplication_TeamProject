<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
<title>Admin Management Page</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/admin/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css">
<script src="/resources/write/js/jquery-3.3.1.min.js"></script>
<!-- Menu CSS -->
<link
	href="/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
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
<link href="/resources/admin/css/index.product.css" rel="stylesheet">
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
						<h4 class="page-title">商品管理ページ</h4>
					</div>
					<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
						<ol class="breadcrumb">
							<li><a href="#">Dashboard</a></li>
							<li class="active">商品テーブル</li>
						</ol>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /row -->
				<div class="row">
					<div class="col-sm-12">
						<div class="white-box">
							<h3 class="box-title">商品テーブル</h3>

							<div class="table-responsive" style="margin-bottom: 30px;">
								<table class="table table-striped">
									<thead style="border-bottom: 2px double">
										<tr>
											<th>#</th>
											<th>商品名</th>
											<th>商品イメージ</th>
											<th>商品価格</th>
											<th>種類</th>
											<th>状態</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${product }" var="pro">
											<tr>
												<td>${pro.num }</td>
												<td>${pro.goods }</td>
												<td><img src="/upload/${pro.goodsphoto }"
													style="max-width: 120px;"></td>
												<td>${pro.price }</td>
												<td>${pro.category =='1' ? '일반' : '브랜드' }</td>
												<td>${pro.status =='2' ? '○': pro.status == '1' ? '예약' : pro.status == '0' ? '렌탈중' : '' }</td>
												
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
							<div class="flex paging">
								<ul class="paginations">
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
									<input type="button" value="글쓰기" class="btn"
										style="position: relative; top: 10px; right: -140px;"
										onclick="movewrite()">

								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
			<footer class="footer text-center"> 2017 &copy; Pixel Admin
				brought to you by wrappixel.com </footer>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<form id="actionForm" action="/product/write" method="get">
		<input type="hidden" name="userid"
			value="<sec:authentication property="principal.member.userid"/>">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
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
	<!-- Custom Theme JavaScript -->
	<script src="/resources/admin/js/custom.min.js"></script>
	<script type="text/javascript">
		var form = $("#actionForm");
		function movewrite() {

			form.submit();
		}
	</script>
	<script type="text/javascript">
		$(".paginations a").on("click", function(e) {
			e.preventDefault();
			var num = $(this).attr("href");
			$("input[name='pageNum']").val(num);
			form.attr("action", "/admin/product_manager");
			form.submit();
		})
	</script>
</body>

</html>

