<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/resources/js/vendor/modernizr-3.5.0.min.js"></script>
<script src="/resources/js/vendor/jquery-1.12.4.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/isotope.pkgd.min.js"></script>
<script src="/resources/js/ajax-form.js"></script>
<script src="/resources/js/waypoints.min.js"></script>
<script src="/resources/js/jquery.counterup.min.js"></script>
<script src="/resources/js/imagesloaded.pkgd.min.js"></script>
<script src="/resources/js/scrollIt.js"></script>
<script src="/resources/js/jquery.scrollUp.min.js"></script>
<script src="/resources/js/wow.min.js"></script>
<script src="/resources/js/nice-select.min.js"></script>
<script src="/resources/js/jquery.slicknav.min.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/plugins.js"></script>
<script src="/resources/js/gijgo.min.js"></script>
<script src="/resources/js/slick.min.js"></script>



<!--contact js-->
<script src="/resources/js/jquery.ajaxchimp.min.js"></script>
<script src="/resources/js/jquery.form.js"></script>
<script src="/resources/js/jquery.validate.min.js"></script>
<script src="/resources/js/mail-script.js"></script>


<script src="/resources/js/main.js"></script>
<script>
	$('#datepicker').datepicker({
		iconsLibrary : 'fontawesome',
		icons : {
			rightIcon : '<span class="fa fa-caret-down"></span>'
		}
	});
</script>
<style>
.main_public_subtitle {
	display: block;
	overflow: hidden;
	font-weight: 700;
	letter-spacing: -0.25px;
	color: #58c464;
	white-space: nowrap;
}

.main_public_title {
	display: block;
	margin-top: 6px;
	font-size: 13px;
	font-weight: 700;
	line-height: 1.25;
	letter-spacing: -0.26px;
	color: #242424;
	white-space: nowrap;
}

.main_public_desc {
	overflow: hidden;
	line-height: 18px;
	letter-spacing: -0.25px;
	color: #424242;
	white-space: nowrap;
}

.main_public_desc2 {
	overflow: hidden;
	line-height: 18px;
	letter-spacing: -0.25px;
	color: #424242;
	white-space: nowrap;
}

.one::after {
	content: '';
	position: relative;
	right: -105%;
	top: -100px;
	width: 1px;
	height: 100px;
	background-color: #e4e8eb;
	color: black;
	display: inline-block;
	width: 1px;
}

.two::after {
	content: '';
	position: relative;
	right: -105%;
	top: -100px;
	width: 1px;
	height: 100px;
	background-color: #e4e8eb;
	color: black;
	display: inline-block;
}

#blocked::after
{
    content: '';
    position: absolute;
    width: 1px;
    height: 160px;
    right: 50%;
    background-color: #eee;
    top: 31%;	
}
</style>
<!-- Modal -->
<div class="modal fade custom_search_pop" id="exampleModalCenter"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="serch_form">
				<input type="text" placeholder="Search">
				<button type="submit">search</button>
			</div>
		</div>
	</div>
</div>
<form action="/logout" method="post" class="logout">
	<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token }">
</form>

<script type="text/javascript">
	function onLogout() {
		$(".logout").submit();

	}
</script>

<footer class="footer" style="margin-top: 30px;">
	<div class="footer_top">
		<div class="container">
			<div class="row" style="justify-content: center;">
				<div class="col-xl-4 col-md-6 col-lg-4 ">
					<div class="col-xl-offset-2 col-xl-2" style="height: 50px;">
					</div>
					<div class="footer_widget">
						<h3 style="text-align: center; margin-bottom: 10px;">Address</h3>
						<p style="font-size: 12px; color: black;">
							大田廣域市(テジョングァンヨクシ) 中區(チュング) <br>龍頭洞(ヨンドゥドン) &nbsp;35-17 <br>
							ヒヨンビル JSL人材開発院 ５層<br> <a href="#">+10 367 826 2567</a> <br>
							<a href="#">abc@rental.com</a>
						</p>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 col-lg-3">
					<div class="footer_widget">
						<h3 class="footer_title" style="color: black; text-align: center;">PHOTO
							VIEW</h3>
						<div class="instagram_feed" style="margin-top: 15px;">
							<div class="single_insta">
								<a href="#"> <img src="/resources/img/instagram/1.png"
									alt="">
								</a>
							</div>
							<div class="single_insta">
								<a href="#"> <img src="/resources/img/instagram/2.png"
									alt="">
								</a>
							</div>
							<div class="single_insta">
								<a href="#"> <img src="/resources/img/instagram/3.png"
									alt="">
								</a>
							</div>
							<div class="single_insta">
								<a href="#"> <img src="/resources/img/instagram/4.png"
									alt="">
								</a>
							</div>
							<div class="single_insta">
								<a href="#"> <img src="/resources/img/instagram/5.png"
									alt="">
								</a>
							</div>
							<div class="single_insta">
								<a href="#"> <img src="/resources/img/instagram/6.png"
									alt="">
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-md-6 col-lg-4 ">
					<h4
						style="margin-top: 50px; text-align: center; border-bottom: 1px solid #eee; margin-bottom: 10px;">Quick
						Move</h4>
					<div class="footer_widget" id="blocked" style="display: inline-block;">
						<div class="col-md-2" style="display: grid; grid-gap: 7px;font-size: medium;">
							<b style="color: black;">PRODUCT</b>
							<div class="bdr"
								style="border-bottom: 1px solid #e4e8eb; margin: 0 !important; border-top: none; width: 80px;"></div>
							<small><a href="/product/product">BICYCLE</a></small> 
							<small><a href="/board/notice">NOTICE</a></small> <small><a href="/about">INFOMATION</a></small>
						</div>
					</div>
					<div class="footer_widget" style="float: right;">
						<div class="col-md-2" style="display: grid; grid-gap: 7px;font-size: medium;">
							<b style="color: black;">PAGE</b>
							<div class="bdr"
								style="border-bottom: 1px solid #e4e8eb; margin: 0 !important; border-top: none; width: 80px;"></div>
							<small><a href="/usernotice/Usernotice">USERBOARD</a></small>
							<small><a href="/review/photo">REVIEW</a></small><small><a href="/QnA/QnA">FAQ</a></small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="copy-right_text">
		<div class="container">
			<div class="footer_border"></div>
			<div class="row">
				<div class="col-xl-12">
					<p class="copy_right text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">RENTAL</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</div>
</footer>
<script type="text/javascript">
	$(function() {
		$(window).ready(function() {
			if ($(window).width() < 993) {
				$(".footer .footer_top .row").css("justify-content", "");
			}
			if ($(window).width() > 993) {
				$(".footer .footer_top .row").css("justify-content", "center");
			}
		})
		$(window).resize(function() {
			if ($(window).width() < 993) {
				$(".footer .footer_top .row").css("justify-content", "");
			}
			if ($(window).width() > 993) {
				$(".footer .footer_top .row").css("justify-content", "center");
			}
		})
	})
</script>
</body>
</html>