<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Product Detail Design Using Bootstrap 4.0</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="custom.css">
</head>
<style type="text/css">
body {
	font-family: 'Roboto Condensed', sans-serif;
}

.hedding {
	font-size: 20px;
	color: #ab8181`;
}

.main-section {
	position: relative;
	left: 50%;
	right: 50%;
	transform: translate(-50%, 5%);
}

.left-side-product-box img {
	width: 100%;
}

.left-side-product-box .sub-img img {
	margin-top: 5px;
	width: 83px;
	height: 100px;
}

.right-side-pro-detail span {
	font-size: 15px;
}

.right-side-pro-detail p {
	font-size: 25px;
	color: #a1a1a1;
}

.right-side-pro-detail .price-pro {
	color: #E45641;
}

.right-side-pro-detail .tag-section {
	font-size: 18px;
	color: #5D4C46;
}

.pro-box-section .pro-box img {
	width: 100%;
	height: 200px;
}

.border {
	border: none !important;
}

@media ( min-width :360px) and (max-width:640px) {
	.pro-box-section .pro-box img {
		height: auto;
	}
}

@media ( min-width :1200px) {
	.container {
		max-width: 1170px;
	}
}
</style>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member.userid" var="id" />
	</sec:authorize>

	<div class="container">
		<div class="col-lg-8 border p-3 main-section bg-white">
			<div class="row hedding m-0 pl-3 pt-0 pb-3"
				style="justify-content: center;">상품 상세화면</div>
			<div class="row m-0">
				<div class="col-lg-7 left-side-product-box pb-3">
					<img src="/upload/product/${view.goodsphoto }"
						style="position: relative; top: 50%; transform: translateY(-50%);"
						class="border p-3">
				</div>
				<div class="col-lg-5">
					<div class="right-side-pro-detail border p-3 m-0">
						<div class="row" style="text-align: center;">
							<div class="col-lg-12">
								<span> 상품 </span> <br>
								<p class="m-0 p-0" style="color:black;">${view.goods }</p>
							</div>
							<div class="col-lg-12">

								<hr class="p-0 m-0">
							</div>
							<div class="col-lg-12 pt-2" style="margin: 20px 0;">
								<h5 class="price-pro">가격</h5>
								<span>${view.price }$</span>
								<hr class="m-0 pt-2" style="margin-top: 20px;">
							</div>
							<div class="col-lg-12" style="margin-bottom: 20px;">
								<p class="tag-section">
									<strong>Tags : </strong><a href="">Bike</a><a href="">,
										Nomal</a>
								</p>
								<hr class="m-0 pt-2" style="margin-top: 20px;">
							</div>
							
							<div class="col-lg-12" style="margin-bottom: 20px;">
								<p class="tag-section">
								<strong>유효기간</strong><br>
									<strong>시작일: </strong><fmt:formatDate value="${view.startdate }" type="date" dateStyle="short" /> <br>
									<strong>~마지막날: </strong><fmt:formatDate value="${view.enddate }" type="date" dateStyle="short" /> <br>
								</p>
								<div class="row">
									<div class="col-lg-12 pb-2">
										<sec:authorize access="isAuthenticated()">
											<a href="javascript:void(0)" class="btn  btn-warning w-100"   style="font-size: 1.5rem;"
												onclick="insert('${id}','${view.goods }','${view.num }','${view.price }','${view.goodsphoto }','${view.nickname }')">Add
												to cart</a>
										</sec:authorize>
										<sec:authorize access="isAnonymous()">
											<a href="javascript:void(0)" class="btn  btn-warning w-100"
												onclick="location.href='/CustomLogin'" style="font-size: 1.5rem;">Add to cart</a>
										</sec:authorize>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="border-top:3px double black">
				<div class="col-lg-12 text-center pt-3">
					<h4>제품 상세 내용</h4>
				</div>
			</div>
			<div class="row mt-3 p-0 text-center pro-box-section" style="border-bottom: 3px double black; margin-bottom: 40px;" >

				<div class="container" style="text-align: center;">${view.content }</div>
				<hr class="m-0 pt-2 mt-2">
			</div>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"
		charset="utf-8"></script>
	<script src="/resources/product/script.js" charset="utf-8"></script>
	<script type="text/javascript">
		function insert(id, goods, n_num, price, goodsphoto) {
			var pageNum = ${cri.pageNum};
			location.href = "/product/cart?userid=" + id + "&goods="
					+ goods + "&n_num=" + n_num + "&price=" + price
					+ "&goodsphoto=" + goodsphoto +"&startdate="+startdate+"&enddate="+enddate"&pageNum="+pageNum;
		}
	</script>

	<%@include file="../footer.jsp"%>