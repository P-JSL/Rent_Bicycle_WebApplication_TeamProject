<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../header.jsp"%>
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

<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
body {
	margin-top: 20px;
}

.comment-wrapper .panel-body {
	max-height: 650px;
	overflow: auto;
}

.comment-wrapper .media-list .media img {
	width: 64px;
	height: 64px;
	border: 2px solid #e5e7e8;
}

.comment-wrapper .media-list .media {
	border-bottom: 1px dashed #efefef;
	margin-bottom: 25px;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.button5 {
	background-color: white;
	color: black;
	border: 2px solid #555555;
}

.button5:hover {
	background-color: #555555;
	color: white;
}

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

.form__group {
	position: relative;
	padding: 15px 0 0;
	width: 100%;
}

.form__field {
	font-family: inherit;
	width: 100%;
	border: 0;
	border-bottom: 2px solid #9b9b9b;
	outline: 0;
	font-size: 1.3rem;
	color: #fff;
	padding: 7px 0;
	background: transparent;
	transition: border-color 0.2s;
}

.form__field::placeholder {
	color: transparent;
}

.form__field:placeholder-shown ~ .form__label {
	font-size: 1.3rem;
	cursor: text;
	top: 20px;
}

.form__label {
	position: absolute;
	top: 0;
	display: block;
	transition: 0.2s;
	font-size: 1rem;
}

.form__field:focus {
	padding-bottom: 6px;
	font-weight: 700;
	border-width: 3px;
	border-image: linear-gradient(to right, #11998e, #38ef7d);
	border-image-slice: 1;
}

.form__field:focus ~ .form__label {
	position: absolute;
	top: 0;
	display: block;
	transition: 0.2s;
	font-size: 1rem;
	color: #11998e;
	font-weight: 700;
}
/* reset input */
.form__field:required, .form__field:invalid {
	box-shadow: none;
}
</style>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member.userid" var="id" />
	</sec:authorize>

	<div class="container">
		<div class="col-lg-8 border p-3 main-section bg-white">
			<div class="row hedding m-0 pl-3 pt-0 pb-3"
				style="justify-content: center; font-size: xx-large;">자유 게시판</div>
			<div class="row m-0">

				<div class="col-lg-12">
					<div class="right-side-pro-detail border p-3 m-0">
						<div class="row" style="text-align: center;">
							<div class="col-lg-12">
								<input type="hidden" name="sequence"
									value="<%=request.getParameter("sequence")%>"> <span>
									제목 : ${vo.title }</span> <br>
								<p class="m-0 p-0" style="color: black;"></p>
							</div>
							<div class="col-lg-12 pt-2">
								<h5 class="price-pro">작성자 : ${vo.nickname }</h5>

							</div>
							<div class="col-lg-12">
								<p class="tag-section">
									<strong style="color: green; cursor: pointer;" id="theup"><i
										class="fa fa-thumbs-o-up" aria-hidden="true"></i><span
										id="likes">${vo.recommend }</span> </strong> &nbsp;&nbsp;&nbsp;&nbsp; <strong
										id="down" style="color: red; cursor: pointer;"><i
										class="fa fa-thumbs-o-down" aria-hidden="true"></i><span
										id="dislikes">${vo.disrecommend }</span></strong>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="border-top: 3px double black">
				<div class="col-lg-12 text-center pt-3">
					<h4>게시판 내용</h4>
					<img src="/upload/upload/${vo.goodsphoto }"
						style="position: relative; max-width: 250px; max-height: 300px;"
						class="border p-3">

					<p>${vo.content }</p>
				</div>
			</div>
			<div class="row mt-3 p-0 text-center pro-box-section"
				style="border-bottom: 3px double black; margin-bottom: 40px;">
				<hr class="m-0 pt-2 mt-2">
			</div>
			<div class="col-md-12" style="text-align: center;">
				<a href="/usernotice/Usermodify?sequence=${sequence}&userid=${id}"
					class="button button5">수정</a> <a
					href="/usernotice/Userdelete?sequence=${sequence}"
					class="button button5">삭제</a> <a class="button button5"
					href="/usernotice/Usernotice?pageNum=<%=request.getParameter("pageNum")%>">목록</a>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 100px;">

		<div class="row bootstrap snippets">
			<div class="col-md-9 col-sm-12" style="margin: 0 auto;">
				<div class="comment-wrapper">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="form__group field">
								<input type="input" class="form__field" placeholder="Name"
									name="nickname" id='nickname' required /> <label for="name"
									class="form__label">NickName</label>
							</div>
						</div>
						<div class="panel-body">

							<textarea class="form-control" placeholder="write a comment..."
								rows="3" style="resize: none;" id="comm"></textarea>
							<br>
							<button type="button" class="btn btn-info pull-right" id="post">Post</button>
							<div class="clearfix"></div>
							<hr>
							<ul class="media-list">

							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"
		charset="utf-8"></script>
	<script src="/resources/product/script.js" charset="utf-8"></script>
	<script type="text/javascript">
		function insert(id, goods, n_num, price, goodsphoto) {
			var pageNum =
	<%=request.getParameter("pageNum")%>
		;
			location.href = "/product/reservation?userid=" + id + "&goods="
					+ goods + "&n_num=" + n_num + "&price=" + price
					+ "&goodsphoto=" + goodsphoto + "&pageNum=" + pageNum;
		}
	</script>
	<script type="text/javascript">
		var sequence = $("input[name='sequence']").val();
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		$("#theup").on("click", function() {
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			})
			var likes = $("#likes");
			console.log(likes[0].innerText);
			$.ajax({
				url : "/board/thup",
				type : 'POST',
				data : JSON.stringify({
					"recommend" : true,
					"sequence" : sequence
				}),
				contentType : "application/json; charset=UTF-8",
				processData : false,
				success : function(result) {
					likes[0].innerText = result;
				},
				error : function(req, status, error) {
					console.log(error);
				}
			})
		});
		$("#down").on("click", function() {
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			})
			var dislikes = $("#dislikes");
			$.ajax({
				url : "/board/down",
				type : 'POST',
				data : JSON.stringify({
					"disrecommend" : true,
					"sequence" : sequence
				}),
				contentType : "application/json; charset=UTF-8",
				processData : false,
				success : function(result) {
					dislikes[0].innerText = result;
				},
				error : function(req, status, error) {
					console.log(error);
				}
			})
		});
	</script>
	<script type="text/javascript">
		$(function() {
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			})
			$.ajax({
				url : "/board/list/reply",
				type : 'POST',
				data : JSON.stringify({
					"sequence" : sequence
				}),
				contentType : "application/json; charset=UTF-8",
				processData : false,
				success : function(res) {
					for (var i = 0; i < res.List.length; i++) {
						$(".media-list").prepend(res.List[i]);
					}
				},
				error : function(req, status, error) {
					console.log(error);
				}
			})

			$("#post").on("click", function() {
				if (!$("input[name='nickname']").val()) {
					alert("닉네임을 적어주세요.");
				} else {
					$(document).ajaxSend(function(e, xhr, options) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					})
					var pw = prompt("Password");
					var comm = $("#comm").val();
					var nickname = $("input[name='nickname']").val();

					$.ajax({
						url : "/board/reply",
						type : 'POST',
						data : JSON.stringify({
							"comm" : comm,
							"nickname" : nickname,
							"sequence" : sequence,
							"pw" : pw

						}),
						contentType : "application/json; charset=UTF-8",
						processData : false,
						success : function(res) {
							$(".media-list").prepend(res.html);
						},
						error : function(req, status, error) {
							console.log(error);
						}
					})
				}
			});
		})
	</script>
	<script type="text/javascript">
		function deleted(data) {
			var nickname = $(data).attr("data-name");
			var n_num = $(data).attr("data-nnum");
			var pw = $(data).attr("data-pw");
			var pwconfirm = prompt("Setting your password");
			if (pw == pwconfirm) {
				$.ajax({
					url : "/board/reply/delete",
					type : 'POST',
					data : JSON.stringify({
						"nickname" : nickname,
						"n_num" : n_num
					}),
					contentType : "application/json; charset=UTF-8",
					processData : false,
					success : function(res) {
						$(data).parent().parent().parent().parent().remove();
					},
					error : function(req, status, error) {
						console.log(error);
					}
				})
			} else {
				alert(new Error("No this reply Pw"));
			}
		}
	</script>
	<%@include file="../../footer.jsp"%>