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
<%@include file="../header.jsp"%>
</head>
<style>
h2 {
	font-size: 20px;
	color: #333;
	margin: 7px 0;
}

a:hover {
	text-decoration: none;
	color: #205F82;
}

a:link,a:visited {
	color: #4083A9;
	outline: none;
	text-decoration: none;
}

.author {
	font-size: 13px;
	margin: 5px 0 25px;
}

.date {
	font-size: 13px;
	font-weight: bold;
}

/**/
#projects {
	width: 1200px;
	margin: 30px auto;
	perspective: 1000;
}

#projects .flipper {
	width: 400px;
	height: 300px;
	display: inline-block;

	-webkit-transform: scale(0.90);
	-moz-transform: scale(0.90);
	-o-transform: scale(0.90);
	-ms-transform: scale(0.90);
	transform: scale(0.90);

	-webkit-box-shadow: 0 3px 5px rgba(0,0,0,.2);
	box-shadow: 0 3px 5px rgba(0,0,0,.2);

	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	-ms-transition: all 0.3s;
	transition: all 0.3s;

	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	-ms-transform-style: preserve-3d;
	transform-style: preserve-3d;
	position: relative;
}

#projects .flipper:hover {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-o-transform: scale(1);
	-ms-transform: scale(1);
	transform: scale(1);

	-webkit-box-shadow: 0 5px 25px rgba(0,0,0,.2);
	box-shadow: 0 5px 25px rgba(0,0,0,.2);
	cursor: pointer;
}

#projects .flipper.blur {
	-webkit-filter: blur(3px);

	-webkit-transform: scale(0.88);
	-moz-transform: scale(0.88);
	-o-transform: scale(0.88);
	-ms-transform: scale(0.88);
	transform: scale(0.88);
	filter: alpha(opacity=60);
	opacity: 0.6;
}

#projects .flipper.rotate {
	-webkit-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
	-o-transform: rotateY(180deg);
	-ms-transform: rotateY(180deg);
	transform: rotateY(180deg);
}

#projects:hover .clicked {
	-webkit-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
	-o-transform: rotateY(180deg);
	-ms-transform: rotateY(180deg);
	transform: rotateY(180deg);
}

.front,.back {
	width: 400px;
	height: 300px;
	position: absolute;
	top: 0;
	left: 0;
	backface-visibility: hidden;
}

.front {
	z-index: 2;
}

.back {
	-webkit-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
	-o-transform: rotateY(180deg);
	-ms-transform: rotateY(180deg);
	transform: rotateY(180deg);
	width: 360px;
	height: 260px;
	padding: 20px;
	z-index: 1;
	background: white;
}

</style>
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