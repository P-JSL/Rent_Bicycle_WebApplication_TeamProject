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
<link rel="stylesheet" href="/resources/noticenav.css">
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

a:link, a:visited {
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
	-webkit-box-shadow: 0 3px 5px rgba(0, 0, 0, .2);
	box-shadow: 0 3px 5px rgba(0, 0, 0, .2);
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
	-webkit-box-shadow: 0 5px 25px rgba(0, 0, 0, .2);
	box-shadow: 0 5px 25px rgba(0, 0, 0, .2);
	cursor: pointer;
}

#projects .flipper.blur {
	-webkit-filter: blur(3px);
	-webkit-transform: scale(0.88);
	-moz-transform: scale(0.88);
	-o-transform: scale(0.88);
	-ms-transform: scale(0.88);
	transform: scale(0.88);
	filter: alpha(opacity = 60);
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

.front, .back {
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

.flex {
	width: 50vw;
	height: 80px;
	line-height: 80px;
	background-color: white;
	margin: 0 auto;
}

.flex ul {
	display: flex;
	padding: 0;
	margin: 0;
	box-shadow: 0 10px 20px 0 rgba(black, 0.25);
}

.flex ul li {
	flex: 1;
	list-style: none;
	text-align: center;
	position: relative;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	user-select: none;
}

.flex ul li &:hover {
	background-color: rgba(white, 0.25);
	color: #f564a9;
}

.flex ul .active:hover {
	width: 10%;
	background-color: #f564a9;
	height: 5px;
}

#chartdiv {
	width: 100%;
	height: 500px;
}

select {
	padding: 4px;
	font-size: 12px;
	border: 1px solid #ccc;
	background-color: #fff;
	appearance: none; /* 기본 스타일 없애기 */
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	vertical-align: inherit;
}

input.btn {
	width: 95px;
	height: 40px;
	border: 1px solid #6dcddc;
	background: 0 none;
	cursor: pointer;
	margin: 10px;
}

.d-flex {
	display: inherit !important;
}

.row {
	display: inherit !important;
}

#projects {
	width: 1400px !important;
}
</style>
<div class="action" onclick="actionToggle();">
	<span>+</span>
	<ul>
		<li><i class="fa fa-paper-plane-o fa-fw" aria-hidden="true"><a href="/board/notice">&nbsp;&nbsp;&nbsp;Notice</a></i></li>
		<li><i class="fa fa-commenting-o fa-fw" aria-hidden="true"><a href="/review/photo">&nbsp;&nbsp;&nbsp;PhotoView</a></i></li>
		<li><i class="fa fa-question-circle-o fa-fw" aria-hidden="true"><a href="/QnA/QnA">&nbsp;&nbsp;&nbsp;QnA</a></i></li>
	</ul>
</div>
<div class="container">
	<div class="col-sm-12">
		<div class="row d-flex">
			<ul id="projects">
				<c:forEach items="${list }" var="re">

					<li id="p1" class="flipper">
						<div class="front">
							<img style="width: 100%" src="/upload/review/${re.photo }" alt="">
						</div>
						<div class="back">
							<h2>${re.title }</h2>
							<p class="author">by ${re.writer }</p>
							<p>${re.content }</p>
							<p class="date">
								<fmt:formatDate value="${re.regdate }" pattern="YY-MM-dd" />
							</p>
						</div>
					</li>
				</c:forEach>
				<!--
    -->

			</ul>
			<div class="container"
				style="position: relative; text-align: center;">
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.member.userid" var="id" />
					<button type="button" class="genric-btn info-border circle"
						style="position: relative; top: -33px; left: 400px;"
						onclick="javascript:location.href='/review/write?writer=${id}'">글쓰기</button>
				</sec:authorize>

				<ul class="pagination" style="justify-content: center;">
					<c:if test="${pageMaker.prev }">
						<li><a href="${pageMaker.startPage - 1 }"><i
								class="fa  fa-arrow-left"></i></a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li><a href="${num }"
							class="${pageMaker.cri.pageNum == num ? 'active':''  }">${num }</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li><a href="${pageMaker.endPage+1}"><i
								class="fa  fa-arrow-right"></i></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>
<form action="/review/photo" method="get" id="photoForm">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
</form>
<script
	src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript">
	$(".pagination a").on("click", function(e) {
		e.preventDefault();
		var form = $("#photoForm");
		let num = $(this).attr("href");
		form.append("<input type='hidden' name='pageNum' value='"+num+"'>");
		form.submit();
	})
</script>
<script type="text/javascript">
	$('#projects > li').hover(function() {
		$(this).siblings().addClass('blur');
	}, function() {
		$(this).removeClass('clicked').siblings().removeClass('blur');

	});

	$('#projects > li').click(function(e) {
		$(this).addClass('clicked');
	});
</script>
<script type="text/javascript">
 function actionToggle(){
	 var action = document.querySelector(".action");
	 action.classList.toggle('active');
 }
</script>
<%@include file="../footer.jsp"%>