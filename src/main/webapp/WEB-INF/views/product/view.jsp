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
<link rel="stylesheet" type="text/css"
	href="/resources/product_view.css">
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member.userid" var="id" />
	</sec:authorize>

	<div class="container">
		<div class="col-lg-8 border p-3 main-section bg-white">
			<div class="row hedding m-0 pl-3 pt-0 pb-3"
				style="justify-content: center;">詳細画面</div>
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
								<span> 商品名 </span> <br>
								<p class="m-0 p-0" style="color: black;">${view.goods }</p>
							</div>
							<div class="col-lg-12">

								<hr class="p-0 m-0">
							</div>
							<div class="col-lg-12 pt-2" style="margin-top: 20px 0;">
							<div style="margin:10px;">
								<span class="price-pro" style="color:green">価格</span> : 
								<span>${view.price }$</span>
							</div>
								<hr class="m-0 pt-2" style="margin-top: 20px;">
							</div>
							<div class="col-lg-12" style="margin-bottom: 20px;">
								<p class="tag-section">
									<strong>Tags : </strong><a href="">Bike</a><a href="">,
										Nomal</a>
								</p>
								<hr class="m-0 pt-2" style="margin-top: 20px !important;">
							</div>

							<div class="col-lg-12" style="margin-bottom: 20px;">
								<p class="tag-section">
									<strong>レンタル期間</strong><br> <strong>開始日:</strong>${fn:substring(view.startdate,0,10) }
									<br><strong>終了日:</strong>${fn:substring(view.lastdate,0,10) }
									<br>
								</p>
								<div class="row">
									<div class="col-lg-12 pb-2">
										<sec:authorize access="isAuthenticated()">
											<a href="javascript:void(0)" class="btn  btn-warning w-100"
												style="font-size: 1.5rem;"
												data-date='${fn:substring(view.lastdate,0,10) }' 
												onclick="insert('${id}','${view.goods }','${view.num }','${view.price }','${view.goodsphoto }','<%=request.getParameter("nickname") %>','${fn:substring(view.startdate,0,10) }','${fn:substring(view.lastdate,0,10) }')">Add
												to cart</a>
										</sec:authorize>
										<sec:authorize access="isAnonymous()">
											<a href="javascript:void(0)" class="btn  btn-warning w-100"
												onclick="confirms();"
												style="font-size: 1.5rem;">カート入れ</a>
										</sec:authorize>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center pt-3" style="border-bottom: .01px solid ;text-shadow: 0px 1px #ffffff, 4px 4px 0px #dad7d7;">
					<h4>詳細内容</h4>
				</div>
			</div>
			<div class="row mt-3 p-0 text-center pro-box-section"
				style=" margin-bottom: 40px;">

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
	var today = new Date();
		function insert(id, goods, n_num, price, goodsphoto,nickname,startdate,lastdate) {
			if(today > lastdate){
				alert("예약 하실수 없습니다.");
				return false;
				}else{				
				var pageNum = ${cri.pageNum};
				location.href = "/product/cartinsert?userid=" + id + "&goods="
						+ goods + "&n_num=" + n_num + "&price=" + price
						+ "&goodsphoto=" + goodsphoto +"&pageNum="+pageNum+"&nickname="+nickname+"&startdate="+startdate+"&lastdate="+lastdate;
				}
			}
	</script>
	<script type="text/javascript">
	function confirms(){
		alert("ログインが必要です。");
		location.href='/CustomLogin';
	}
	</script>
	<%@include file="../footer.jsp"%>