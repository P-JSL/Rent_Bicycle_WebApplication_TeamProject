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
<link rel="stylesheet" href="/resources/photo.css">
<%@include file="../header.jsp"%>
</head>
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
							<p class="author">by ${re.nickname == null? re.writer : re.nickname }</p>
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