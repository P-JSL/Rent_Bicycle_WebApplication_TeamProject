<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">
<!-- CSS -->
<link href="/resources/product/style.css" rel="stylesheet">
<meta name="robots" content="noindex,follow" />

</head>

<body>
	<main class="container">

		<!-- Left Column / Headphones Image -->
		<div class="left-column">
			<img data-image="black" src="/resources/product/images/black.png"
				alt=""> <img data-image="blue"
				src="/resources/product/images/blue.png" alt=""> <img
				data-image="red" class="active" src="/upload/${view.goodsphoto }"
				alt="">
		</div>


		<!-- Right Column -->
		<div class="right-column">

			<!-- Product Description -->
			<div class="product-description">
				<span>${view.goods }</span>
				<h1>Beats EP</h1>
				<p>${view.content }</p>
			</div>

			<!-- Product Configuration -->
			<div class="product-configuration">

				<!-- Product Color -->
				<div class="product-color">
					<span>Color</span>

					<div class="color-choose">
						<div>
							<input data-image="red" type="radio" id="red" name="color"
								value="red" checked> <label for="red"><span></span></label>
						</div>
						<div>
							<input data-image="blue" type="radio" id="blue" name="color"
								value="blue"> <label for="blue"><span></span></label>
						</div>
						<div>
							<input data-image="black" type="radio" id="black" name="color"
								value="black"> <label for="black"><span></span></label>
						</div>
					</div>

				</div>

				<!-- Cable Configuration -->
				<div class="cable-config">
					<span>Cable configuration</span>

					<div class="cable-choose">
						<button>Straight</button>
						<button>Coiled</button>
						<button>Long-coiled</button>
					</div>

					<a href="#">How to configurate your headphones</a>
				</div>
			</div>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.member.userid" var="id" />
			</sec:authorize>

			<!-- Product Pricing -->
			<div class="product-price">
				<span>${view.price }$</span>
				<sec:authorize access="isAuthenticated()">
					<a href="javascript:void(0)" class="cart-btn"
						onclick="insert('${id}','${view.goods }','${view.num }','${view.price }','${view.goodsphoto }')">Add
						to cart</a>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<a href="javascript:void(0)" class="cart-btn"
						onclick="location.href='/CustomLogin'">Add to cart</a>
				</sec:authorize>
			</div>
		</div>
	</main>
	<!-- Scripts -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"
		charset="utf-8"></script>
	<script src="/resources/product/script.js" charset="utf-8"></script>
	<script type="text/javascript">
		function insert(id, goods, n_num, price, goodsphoto) {
			location.href = "/product/reservation?userid=" + id + "&goods="
					+ goods + "&n_num=" + n_num + "&price=" + price
					+ "&goodsphoto=" + goodsphoto;
		}
	</script>
	<%@include file="../footer.jsp"%>