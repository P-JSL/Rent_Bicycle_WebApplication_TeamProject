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

.pass_show {
	position: relative
}

.pass_show .ptxt {
	position: absolute;
	top: 50%;
	right: 10px;
	z-index: 1;
	color: #f36c01;
	margin-top: -10px;
	cursor: pointer;
	transition: .3s ease all;
}

.pass_show .ptxt:hover {
	color: #333333;
}
</style>
<body>
	<div class="container">
		<div class="row" style="justify-content: center; margin-top: 25px;">
			<div class="col-md-8"
				style="border-bottom: 1px solid black; background-color: aliceblue;">
				<form class="form" action="/forgot/reset" method="get">
					<div class="panel-body">
						<label>아이디</label>
						<div class="form-group">
							<input type="text" name="userid" id="IdInput"
								class="form-control" placeholder="Your id">
						</div>
						<label>새 비밀번호</label>
						<div class="form-group pass_show">
							<input type="password" name="userpw" id="IdInput"
								class="form-control" placeholder="New Password">
						</div>
						<label>비밀번호 확인</label>
						<div class="form-group pass_show">
							<input type="password" name="password_confirm" id="IdInput"
								class="form-control" placeholder="Confirm Password">
						</div>
						<div class="form-group">
							<input class="btn btn-lg btn-outline-info btn-block"
								value="비밀번호 변경 " id="submit" type="button">
						</div>
					</div>
				</form>

			</div>


		</div>
		<div class="container" style="text-align: center; margin-top: 30px;">
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
						if ($("input[name='userpw']").val() != $(
								"input[name='password_confirm']").val()) {
							alert("재대로 비밀번호를 입력해주세요.");
							$("input[name='userpw']").val("");
							$("input[name='password_confirm']").val("");
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

		})
	</script>
</body>
</html>