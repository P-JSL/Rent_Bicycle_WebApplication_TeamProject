<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<style>
.panel {
	border: none;
}
</style>
<body>
	<div class="container">
		<div class="row" style="justify-content: center;">
			<div class="col-md-8"
				style="border: 2px solid black; margin-top: 20px;">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<h2 class="text-center">IDをお忘れですか？</h2>
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
										<div class="form-group" s>
											<input class="btn btn-lg btn-primary btn-block"
												value="ID探し " id="idsubmit" type="button">
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-8" style="text-align: center; margin-top: 30px;">
			<button class="btn btn-warning" onclick="javscript:self.close()">닫기</button>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			})
			$("#idsubmit").on(
					"click",
					function() {
						if (!$("input[name='useremail']").val()) {
							alert("メールを入力してください。");
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
										"あなた様のIDは " + result + "입니다.");
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