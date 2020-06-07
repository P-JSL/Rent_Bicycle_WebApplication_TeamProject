<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<style type="text/css">
.container {
	margin: auto auto;
}
</style>
<body>
	<div class="container">
		<div class="row" style="justify-content: center;">
			<div class="col-md-8" style="border: 2px solid black;">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<h2 class="text-center">비밀번호를 잊으셨습니까?</h2>
							<p>비밀번호 변경 하시겠습니까?.</p>
							<div class="panel-body">

								<form class="form" action="/forgot/reset" method="get">
									<fieldset>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-envelope color-blue"></i></span> <input
													name="userid" id="IdInput" placeholder="Your ID"
													class="form-control" type="text"> <input
													name="userpw" id="IdInput" placeholder="Your Password"
													class="form-control" type="text">
											</div>
										</div>
										<div class="form-group">
											<input class="btn btn-lg btn-primary btn-block"
												value="비밀번호 변경 " id="submit" type="button">
										</div>
									</fieldset>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-8"
				style="border: 2px solid black; margin-top: 20px;">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<h2 class="text-center">아이디를 잊으셨습니까?</h2>
							<p>아이디를 찾으십시오.</p>
							<div class="panel-body">

								<form class="form" action="/forgot/findid" method="get">
									<fieldset>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-envelope color-blue"></i></span> <input
													name="useremail" id="emailInput" placeholder="Your email"
													class="form-control" type="email">

											</div>
										</div>
										<div class="form-group">
											<input class="btn btn-lg btn-primary btn-block"
												value="아이디 찾기 " id="idsubmit" type="button">
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container" style="text-align: center; margin-top: 30px; ">
			<button class="btn btn-warning" onclick="javscript:self.close()">닫기</button>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			})
			$("#submit").on(
					"click",
					function() {
						if (!$("input[name='userid']").val()) {
							alert("아이디를 입력해주세요.");
							return false;
						}
						if (!$("input[name='userpw']").val()) {
							alert("비밀번호를 입력해주세요.");
							return false;
						}
						let userid = $("input[name='userid']").val();
						let userpw = $("input[name='userpw']").val();
						$.ajax({
							url : "/forgot/reset",
							type : 'POST',
							data : JSON.stringify({
								"userid" : userid,
								"userpw" : userpw
							}),
							dataType : "text",
							contentType : "application/json; charset=UTF-8",
							processData : false,
							success : function(result) {

								$(opener.document).find("#change").text(
										"정상적으로 비밀번호가 변경되었습니다.");
								self.close();
								return;

							},
							error : function(req, status, error) {
								console.log("req" + req + "status " + status
										+ " error " + error);
							}
						})
					})

			$("#idsubmit").on(
					"click",
					function() {
						if (!$("input[name='useremail']").val()) {
							alert("이메일을 입력해주세요.");
							return false;
						}
						let useremail = $("input[name='useremail']").val();

						$.ajax({
							url : "/forgot/findId",
							type : 'POST',
							data : JSON.stringify({
								"useremail" : useremail,

							}),
							dataType : "text",
							contentType : "application/json; charset=UTF-8",
							processData : false,
							success : function(result) {

								$(opener.document).find("#change").text(
										"당신의 아이디는 " + result + "입니다.");
								self.close();
								return;

							},
							error : function(req, status, error) {
								console.log("req" + req + "status " + status
										+ " error " + error);
							}
						})
					})
		})
	</script>
</body>
</html>