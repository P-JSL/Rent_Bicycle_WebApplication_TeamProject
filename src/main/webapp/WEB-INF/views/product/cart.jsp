<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<style>
.bb {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
	margin: 0 -16px;
}

.container1 {
	border: 2px solid #ccc;
	background-color: #eee;
	border-radius: 5px;
	padding: 16px;
	margin: 16px 0;
}

/* Clear floats after containers */
.container1::after {
	content: "";
	clear: both;
	display: table;
}

/* Float images inside the container to the left. Add a right margin, and style the image as a circle */
.container1 img {
	float: left;
	margin-right: 20px;
	border-radius: 50%;
}

/* Increase the font-size of a span element */
.container1 span {
	font-size: 20px;
	margin-right: 15px;
}

/* Add media queries for responsiveness. This will center both the text and the image inside the container */
@media ( max-width : 500px) {
	.container1 {
		text-align: center;
	}
	.container1 img {
		margin: auto;
		float: none;
		display: block;
	}
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 300px;
	margin: auto;
	text-align: center;
	padding: 10px;
}

.title {
	color: grey;
	font-size: 18px;
}

.button {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
}

.aa {
	padding-top: 100px;
}

a {
	text-decoration: none;
	color: black;
}

.button:hover, a:hover {
	opacity: 0.7;
}

.cc {
	background-color: #f2f2f2;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 3px;
}

span.price {
	float: right;
	color: grey;
}

.btn {
	background-color: dodgerblue;
	color: white;
	padding: 15px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

.btn:hover {
	opacity: 1;
}
</style>
<div class="bradcam_area bradcam_bg_4" style="padding: 50px 0;">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="bradcam_text text-center">
					<h3>cart</h3>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container row aa">
	<div class="profile col-md-4">
		<div class="card">
			<strong style="font-size: 1.25rem;">ユーザー </strong>
			<h1>
				<input type="text" placeholder="Johnathan Doe"
					class="form-control form-control-line"
					value='<sec:authentication property="principal.member.nickname"/>'
					readonly>
			</h1>
			<p class="title">
				<input type="email" placeholder="johnathan@admin.com"
					class="form-control form-control-line" name="example-email"
					id="example-email"
					value="<sec:authentication property="principal.member.useremail" /> "
					readonly>
			</p>
			<p>
				<a href="/users/index?userid=${userid }" class="button">マイページへ</a>
			</p>
		</div>
	</div>
	<div class="cartlist col-lg-6 col-md-8 col-sm-8">
		<c:forEach items="${cartlist}" var="cart">
			<div class="container1">
				<div class="row">
					<div class="col-md-4">
						<img src="/upload/${cart.goodsphoto }" alt="Avatar"
							style="width: 100%; height: 100%;">
					</div>
					<div class="col-md-4" style="margin: auto auto;">
						<div style="text-align: center;">
							<a href="/product/view?num=${cart.n_num }&userid=${userid }"><span>${cart.goods }</span></a>
							${cart.content }

							<p>${cart.price }ウォン</p>
						</div>

					</div>
					<div class="col-md-4" style="margin: auto auto;">
						<a class="button btn"
							href='/product/cartdelete?num=${cart.num }&userid=${userid }'
							style="background-color: firebrick;">削除</a>
					</div>
				</div>

			</div>
		</c:forEach>
	</div>
</div>

<div class="row bb container">
	<div class="cc col-md-2"
		style="position: fixed; right: 40px; top: 40%; z-index: 1111;">
		<c:forEach items="${cartlist}" var="cart">
			<p>
				<a href="/product/view?num=${cart.n_num }&userid=${userid }">${cart.goods }</a>
				<span class="price">${cart.price}円</span>
			</p>
			<hr>
		</c:forEach>
		<h4>
			カート <span class="price" style="color: black"><i
				class="fa fa-shopping-cart"></i> <b>${cartcount }</b></span>
		</h4>
		<p>
			トータル <span class="price" style="color: black"><b>${cartsum }円</b></span>
		</p>
		<hr>
		<button class="btn button" id="p" style="cursor: pointer;">購買する</button>
	</div>
</div>
<form action="/product/cartinsert" method="post" id="cartin"></form>

<script type="text/javascript">
$(function(){
var num = new Array();
var id = new Array();
var nickname = new Array();
var price = new Array();
var goodsphoto = new Array();
var goods = new Array();
var startdate = new Array();
var lastdate = new Array();
<c:forEach items="${cartlist }" var="cr">
	num.push(${cr.n_num });
	id.push('${cr.userid }');
	nickname.push('${cr.nickname }');
	price.push(${cr.price });
	goodsphoto.push('${cr.goodsphoto }');
	goods.push('${cr.goods}');
	startdate.push('${fn:substring(cr.startdate,0,10)}');
	lastdate.push('${fn:substring(cr.lastdate,0,10)}');
</c:forEach>

console.log(num);
console.log(id);
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";
$(document).ajaxSend(function(e, xhr, options) {
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
})
	$("#p").on("click",function(e){
		if(num.length == 0){
			alert("商品が存在しません。");
		}else{			
		var con = confirm("この商品を予約しますか？");
		if(con == true){			
		$.ajax({
			url : "/cart_insert",
			type : 'POST',
			data : JSON.stringify({
				"num" : num,
				"userid" : id,
				"nickname" : nickname,
				"price" : price,
				"goodsphoto" : goodsphoto,
				"goods" : goods,
				"startdate" : startdate,
				"lastdate" : lastdate
			}),
			contentType : "application/json; charset=UTF-8",
			processData : false,
			success : function(result) {
				if(result == true){
					location.href="/users/index?userid=<%=request.getParameter("userid")%>";
				}else{
					location.href=location.href;
				}
			},
			error : function(req, status, error) {
				console.log(error);
			}
		})
		}
		}
	})
})
</script>
<%@include file="../footer.jsp"%>
