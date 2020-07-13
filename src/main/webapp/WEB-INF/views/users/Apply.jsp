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
<title>RENTAL BYCICLE COMPANY</title>
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
<link href="/resources/write/css/noticewrite.css" rel="stylesheet">
<link href="/resources/write/css/common.css" rel="stylesheet">
<link href="/resources/write/css/login.css" rel="stylesheet">
<link href="/resources/write/css/join.css" rel="stylesheet">
<link href="/resources/write/css/sub-notice.css" rel="stylesheet">
<link href="/resources/write/css/sub-qna.css" rel="stylesheet">
<link href="/resources/write/css/sub-faq.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
</head>
<style>
.notice-write {
	idth: 100%;
	padding: 0px 20px 130px 20px;
	margin: 0 auto;
}
</style>
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
					<div class="col-md-3 col-xs-12" id="appform">
						<div class="white-box">
							<form class="form-horizontal form-material" id="modifyform"
								method="post" action="/users/Apply/${userid }">
								<input type="hidden" value="${_csrf.token }"
									name="${_csrf.parameterName }">

								<div class="form-group">
									<label class="col-md-12">User NickName</label>
									<div class="col-md-12">
										<input type="text" name="username"
											placeholder="Write Your NickName" value="${nickname }"
											${nickname ==null ?'':'readonly' }
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
											name="addr" id="address" placeholder="Wrtie Your Address">
									</div>
								</div>
								<div class="form-group">
									<label for="phonenum" class="col-md-12">Phone-Number</label>
									<div class="col-md-12">
										<input type="text" class="form-control form-control-line"
											name="phonenum" id="phonenum" pattern="[0-9]{3,12}"
											maxlength="11" min="3" placeholder="하이픈(-)없이 적어주세요.">
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
					<div class="col-lg-12 col-md-12 col-sm-12" id="writeform">
						<div class="notice-write ">
							<form name="write" style="background-color: #6daeb8"　 onsubmit="return Register();"
								action="/users/Apply/write" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
								<!-- <input type="hidden" value="save" name="t_gubun"> -->
								<h2 class="readonly">제목, 첨부파일, 내용을 작성합니다</h2>

								<fieldset
									class="table-responsive-sm table-responsive-md table-responsive-lg table-responsive-xl">
									<legend>공지사항 글쓰기</legend>

									<table class="table">
										<caption>공지사항 글쓰기</caption>
										<colgroup>
											<col width="20%">
											<col width="*">
										</colgroup>

										<tr>
											<th style="vertical-align: middle; text-align: center;"><label
												for="t_title">タイトル</label></th>
											<td colspan="2"><input type="text" name="title"
												id="title" class="title" placeholder="제목을 입력해주세요"></td>
											<th style="vertical-align: middle; text-align: center;"><label
												for="t_title">品目</label></th>
											<td colspan="1"><input type="text" name="goods"
												id="title" class="title"></td>
											<th style="vertical-align: middle; text-align: center;"><label
												for="t_title">作成者</label></th>
											<td colspan="4"><input type="text" name="nickname"
												id="title" class="title" readonly value="${nickname }">
												<input type="hidden" name="userid" id="title" class="title"
												value="${ userid}"></td>
										<tr>
											<th style="vertical-align: middle; text-align: center;"><label
												for="t_title">金額</label></th>
											<td colspan="2"><input type="text" name="price" id="title"
												class="title"></td>
											
											<th style="vertical-align: middle; text-align: center;"><label
												for="t_title">カテゴリー</label></th>
											<td><input type="text" name="category" id="title"
												class="title"></td>
											<th style="vertical-align: middle; text-align: center;"><label
												for="t_title">レンタル可能日</label></th>
											<td><input type="text" name="startdate" id="title"
												class="title"></td>
											<td><input type="text" name="lastdate" id="to"
												class="title"></td>
												

										</tr>
										<tr>
											<th style="vertical-align: middle; text-align: center;"><label
												for="cont">コンテンツ</label></th>
											<td colspan="8"><textarea type="cont" name="content"
													id="cont" class="cont" placeholder="내용을 입력해주세요"></textarea>
										</tr>
										<tr>
											<th style="vertical-align: middle; text-align: center;"><label
												for="t_title">イメージ</label></th>
											<td colspan="9"><input type="file" name="goodsfile"
												id="title" class="title"></td>
										</tr>

										<tr>
											<td colspan="9"><input type="submit" class="btn"
												onclick="noticeSave()" value="登録"></td>
										</tr>

									</table>
								</fieldset>
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
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
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

			var nickname = $("input[name='username']").val();
			var Addr = $("input[name='addr']").val();
			var phone = $("input[name='phonenum']").val();

			if (!nickname) {
				alert("ニックネームを書いてください。");
				return false;
			}
			if (!Addr) {
				alert("住所を書いてください。");
				return false;
			}
			if (!phone && phone.length < 12) {
				alert("携帯番号を書いてください。あるいは、会社電話でも構いません。");
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
			$("#modify").show();
			$("#app").hide();
			$.ajax({
				url : "/confirm",
				type : "post",
				data : JSON.stringify({
					"userid" : id
				}),
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				processData : false,
				success : (function(res) {
					console.log(res);
					if (res == "true") {
						$("#appform").css("display", "inherit");
						$("#writeform").css("display", "none");
					} else {
						$("#appform").css("display", "none");
						$("#writeform").css("display", "inherit");
					}
				})
			})
		})
	</script>
	<script type="text/javascript">
		var today = new Date();
		var Year = today.getFullYear();
		var Month = today.getMonth() + 1;
		var Day = today.getDate();
		function Register(){
		$("input[name='startdate']").val(Year + "/" + Month + "/" + Day);
		var lastdate = $("input[name='lastdate']").val();
		if(!$("input[name='goods']").val()){
			alert("商品を書いてください。");
			return false;
		}	
		if(!$("input[name='category']").val()){
			alert("カテゴリーを分かりやすく入力してください。");
			return false;
		}	
		if(!$("input[name='price']").val()){
				alert("値段を書いてください。～円/ウォン単位はいりません");
				return false;
			}
			if(lastdate.length == 0){
				alert("レンタル終了日を指定してください。");
				return false;
			}
			if(!$("input[type='file']").val()){
				alert("商品のイメージは必須です。");
				return false;
			}
		}
		</script>
	<script type="text/javascript">
	$("input[name='lastdate']").flatpickr({
		  enableTime: false,
		  dateFormat: "Y/m/d",
		  minDate:today
		});
	</script>
</body>

</html>