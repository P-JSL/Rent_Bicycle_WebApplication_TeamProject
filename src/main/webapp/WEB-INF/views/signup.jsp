<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>SignUp</title>
<%@include file="header.jsp"%>
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/resources/user/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/user/css/util.css">
<link rel="stylesheet" type="text/css"
	href="/resources/user/css/main.css">
<!--===============================================================================================-->
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header"
	th:content="${_csrf.headerName}" />
</head>
<style type="text/css">
.slicknav_nav .slicknav_arrow {
	margin: 0 0 0 0 !important;
	font-size: 20px !important;
}

input[name='useremail']::after {
	content: attr(data-content);
}
</style>
<body>


	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="/signup"
					method="post" onsubmit="return checkAccount()" id="signform">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token }"> <span
						class="login100-form-title p-b-34"> Account Create </span> <input
						type="hidden" name="userName" value="일반사용자">
					<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
						data-validate="Type user name">
						<input id="first-name" class="input100" type="text" name="userid"
							placeholder="User id"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="형식에 맞는 이메일 작성.">
						<input class="input100" type="email" name="useremail"
							placeholder="Email"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="Type password">
						<input class="input100" type="password" name="userpw"
							placeholder="password"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
						data-validate="Type password">
						<input class="input100" type="password" name="userpw_confirm"
							placeholder="password confirm"> <span
							class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn">
						<button class="btn btn-outline-success login100-form-btn">Sign
							up</button>
					</div>

				</form>

				<div class="login100-more"
					style="background-image: url('/resources/user/images/bg-01.jpg');"></div>
			</div>
		</div>
	</div>



	<div id="dropDownSelect1"></div>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/user/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch : 20,
			dropdownParent : $('#dropDownSelect1')
		});
	</script>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/user/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/user/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="/resources/user/js/main.js"></script>
	<script type="application/javascript">
		
  function getIP(json) {
    console.log("My public IP address is: ", json.ip);
  }
	
	</script>
	<script type="application/javascript"
		src="https://api.ipify.org?format=jsonp&callback=getIP"></script>
	<script type="text/javascript">
		function checkAccount() {
			let userid = $("input[name='userid']").val();
			let useremail = $("input[name='useremail']").val();
			let userpw = $("input[name='userpw']").val();
			let userpw_confirm = $("input[name='userpw_confirm']").val();
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-z]([-_.]?[0-9a-zA-Z])*.[a-z]{2,3}$/i;

			if (!userid) {
				alert("아이디를 입력해주세요.");
				return false;
			}
			if (!useremail && regExp.test(useremail) == false) {
				alert("이메일 형식이 아니거나 이메일을 입력하지 않았습니다.");
				return false;
			}
			if (userpw != userpw_confirm) {
				alert("비밀번호를 정확히 입력 해주세요.");
				return false;
			}
			var form = $("#signform");
			form.append("<input type='hidden' name='ip' value='"+getIP(json)+"'>")
			form.submit();
		}
	</script>
	<script type="text/javascript">
		$(function(e) {
			'use strict'

			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			})

			$("input[name='useremail']").on("change", function(e) {

				var useremail = $("input[name='useremail']").val();
				var datas = {
					"useremail" : useremail
				};

				$.ajax({
					url : "/emailcheck",
					type : 'POST',
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify(datas),
					dataType : 'JSON',
					processData : false,
					success : function(result) {
						console.log(result);
						if (!result) {
							alert('중복된 이메일입니다.다시 입력해주세요.');
							$("input[name='useremail']").val("");
						}
					},
					error : function(req, status, error) {
						console.log(error);
					}
				})
			})

		})
	</script>
	<script type="text/javascript">
		$(function(e) {
			'use strict'

			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			})

			$("input[name='userid']").on("change", function(e) {

				var userid = $("input[name='userid']").val();
				var datas = {
					"userid" : userid
				};

				$.ajax({
					url : "/idcheck",
					type : 'POST',
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify(datas),
					dataType : 'JSON',
					processData : false,
					success : function(result) {
						console.log(result);
						if (!result) {
							alert('중복된 아이디입니다.다시 입력해주세요.');
							$("input[name='userid']").val("");
						}
					},
					error : function(req, status, error) {
						console.log(error);
					}
				})
			})

		})
	</script>

	<%@include file="footer.jsp"%>