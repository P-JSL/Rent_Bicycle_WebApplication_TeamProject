<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Bootstrap Core CSS -->
<link href="/resources/admin/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Menu CSS -->
<link
	href="/resources/admin/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet">
<!-- toast CSS -->
<link
	href="/resources/admin/plugins/bower_components/toast-master/css/jquery.toast.css"
	rel="stylesheet">
<!-- morris CSS -->
<link
	href="/resources/admin/plugins/bower_components/morrisjs/morris.css"
	rel="stylesheet">
<!-- animation CSS -->
<link href="/resources/admin/css/animate.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/admin/css/style.css" rel="stylesheet">
<!-- color CSS -->
<link href="/resources/admin/css/colors/blue-dark.css" id="theme"
	rel="stylesheet">
	<link rel="stylesheet" href="/resources/goods.css">
<%@include file="../header.jsp"%>
</head>
<div class="container">
	<div class="col-sm-12">
		<div class="row d-flex">
			<ul id="projects">
				<li id="p1" class="flipper">
					<div class="front">
						<img
							src="https://dribbble.s3.amazonaws.com/users/1960/screenshots/948220/icons_1x.png"
							alt="">
					</div>
					<div class="back">
						<h2>제목</h2>
						<p class="author">
							by <a href="http://dribbble.com/brandclay">작성자</a>
						</p>
						<p>내용.</p>
						<p class="date">날짜</p>
					</div>
				</li>
				<!--
    -->
				<li id="p2" class="flipper">
					<div class="front">
						<img
							src="https://dribbble.s3.amazonaws.com/users/8868/screenshots/949182/_dribbble____024_-_itsy_theme__22minimal_22.png"
							alt="">
					</div>
					<div class="back">
						<h2>Itsy theme "minimal"</h2>
						<p class="author">
							by <a href="http://dribbble.com/hiroshi1012">hiroshi</a>
						</p>
						<p>Itsy Theme "minimal"</p>
						<p>
							↓ Download<br /> https://cl.ly/Mzol
						</p>
						<p class="date">Feb 18, 2013</p>
					</div>
				</li>
				<!--
    -->
				<li id="p3" class="flipper">
					<div class="front">
						<img
							src="https://dribbble.s3.amazonaws.com/users/3587/screenshots/948687/untitled-1.jpg"
							alt="">
					</div>
					<div class="back">
						<h2>Portfolio Design</h2>
						<p class="author">
							by <a href="http://dribbble.com/NpaulFlavius">Paul Flavius
								Nechita</a>
						</p>
						<p>A concept I've put together for my lovely Elena Greta
							Apostol. This is meant to be a portfolio/store that should
							reflect the quality of her work.</p>
						<p>I'd really like to know what you guys think.</p>
						<p class="date">Feb 18, 2013</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="container" style="text-align: right; margin-bottom: -40px;">
		<button type="button" class="btn btn-info">글쓰기</button>
	</div>
	<ul class="pagination" style="justify-content: center;">
		<li><a href="#" aria-label="Previous"> <span
				aria-hidden="true">&laquo;</span>
		</a></li>
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</ul>
</div>
<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript">
$('#projects > li').hover(function(){
	  $(this).siblings().addClass('blur');
	}, function(){
	  $(this).removeClass('clicked').siblings().removeClass('blur');
	  
	});

	$('#projects > li').click(function(e){
	  $(this).addClass('clicked');
	});

</script>
<%@include file="../footer.jsp"%>