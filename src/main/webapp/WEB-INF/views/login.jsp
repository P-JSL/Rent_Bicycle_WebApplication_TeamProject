<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp"%>


<meta name="viewport" content="width=device-width, initial-scale=1">
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
<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100">
			<form class="login100-form validate-form" action="/login" style="justify-content: center;"
				method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token }"> <span
					class="login100-form-title p-b-34"> ログインページ <c:if
						test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
						<br>
						<font color="red" style="font-size:1rem;">
							${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
							<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
						</font>
					</c:if>
					<p>${logout }</p>
					<p id="change"></p>
				</span>


				<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
					data-validate="아이디를 입력하세요.">
					<input id="first-name" class="input100" type="text" name="username"
						placeholder="IDを入力してください。"> <span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
					data-validate="パスワードを入力してください。">
					<input class="input100" type="password" name="password"
						placeholder="パスワードを入力してください。"> <span class="focus-input100"></span>
				</div>
				<div class="genric-btn primary-border circle m-b-20"
					id="remember">
					<input type="checkbox" id="remember-me" name="remember-me"
						style="position: relative; top: 4px; right: 5px;">オートログイン
				</div>
				<div class="container-login100-form-btn">
					<button class="login100-form-btn">ログイン</button>
				</div>

				<div class="w-full text-center p-t-27">
					<span class="txt1"> ID/PW　Search </span><hr><br> <a
						href="javascript:void(0)" onClick="window.open('/forgot/forgotid','','width=100px,heigth=100px, resize=none')"
						class="txt2"> IDを忘れましたか？ </a>
						 <hr><br><a
						href="javascript:void(0)" onclick="window.open('/forgot/forgotpw','','width=100px,heigth=100px, resize=none');"
						class="txt2"> パスワードを忘れましたか？</a>
						<hr>
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
<script type="text/javascript">
	$("#remember").on("click", function() {
		if (!$("input[name='remember-me']").is(":checked")) {
			$("input[name='remember-me']").prop("checked", true);
		} else if($("input[name='remember-me']").is(":checked")) {
			$("input[name='remember-me']").prop("checked",false);
		}

	})
</script>

<%@include file="footer.jsp"%>