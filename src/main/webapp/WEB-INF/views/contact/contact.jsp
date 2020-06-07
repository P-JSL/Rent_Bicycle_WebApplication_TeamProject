<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../header.jsp"%>
</head>
<body>

	<!-- bradcam_area  -->
	<div class="bradcam_area bradcam_bg_4">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text text-center">
						<h3>contact</h3>
						<p>Pixel perfect design with awesome contents</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->

	<!-- ================ contact section start ================= -->
	<section class="contact-section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2 class="contact-title">1:1 문의</h2>
				</div>
				<div class="col-lg-8">
					<form class="form-contact contact_form" action="/contact/mail"
						method="post" id="contactForm" novalidate="novalidate">
						<input type="hidden" value="${_csrf.token }"
							name="${_csrf.parameterName }">
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<input class="form-control" name="title" id="subject"
										type="text" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Subject'"
										placeholder="Enter Subject">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<textarea class="form-control w-100" name="message"
										id="message" cols="30" rows="9"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Message'"
										placeholder=" Enter Message"></textarea>
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<sec:authorize access="isAuthenticated()">

										<input class="form-control valid" name="email" id="email"
											type="email"
											readonly value="<sec:authentication property='principal.member.useremail'/>">
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
									<input class="form-control valid" name="email" id="email"
										type="email" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter email address'"
										placeholder="Email">									
									</sec:authorize>
								</div>
							</div>

						</div>
						<div class="form-group mt-3">
							<button type="submit" class="button button-contactForm boxed-btn"
								id="send">보내기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- ================ contact section end ================= -->
	<script type="text/javascript">
		$("#send").on("click", function() {
			var form = $("#contactForm");
			form.submit();
		})
	</script>
</body>
<%@include file="../footer.jsp"%>
</html>