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
<link rel="stylesheet" type="text/css" href="/resources/custom.css">
<link rel="stylesheet" type="text/css" href="/resources/product_view.css">
</head>
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
					<img src="/upload/${view.goodsphoto }"
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
							</div>
							<div class="col-lg-12" style="border-top: 1px solid #ddd; padding-top: 20px;">
								
								<input type="text" readonly
									class="form-control text-center w-100" value="남은 렌탈 회수 : ${view.many }"
									style="font-size: 1.5rem; background-color: transparent;">
							</div>
							<div class="col-lg-12 mt-3">
								<div class="row">
									<div class="col-lg-12 pb-2">
										<sec:authorize access="isAuthenticated()">
											<a href="javascript:void(0)" class="btn  btn-warning w-100"   style="font-size: 1.5rem;"
												onclick="insert('${id}','${view.goods }','${view.num }','${view.price }','${view.goodsphoto }')">Add
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
			location.href = "/product/reservation?userid=" + id + "&goods="
					+ goods + "&n_num=" + n_num + "&price=" + price
					+ "&goodsphoto=" + goodsphoto +"&pageNum="+pageNum;
		}
	</script>

	<%@include file="../footer.jsp"%>