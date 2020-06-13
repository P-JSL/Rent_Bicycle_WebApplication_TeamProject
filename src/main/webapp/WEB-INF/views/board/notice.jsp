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
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<style type="text/css">
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

.container {
	border-radius: 4px;
}

@media ( max-width : 1500px) {
	.navigator {
		max-width: 100px !important;
	}
}

@media ( max-width : 1350px) {
	.navigator {
		max-width: 100px !important;
	}
}

@media ( max-width : 1024px) {
	.navigator {
		max-width: 75px !important;
	}
}

@media ( max-width : 768px) {
	.navigator {
		max-width: 50px !important;
	}
}

.card {
	border: none;
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
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body text-center">
					<h3 class="card-title m-b-0">공지 사항</h3>
				</div>
				<div class="table-responsive">
					<table class="table">
						<thead class="thead-light" style="text-align: center;">
							<tr>
								<th style="text-align: center; vertical-align: middle;"><label
									class="customcheckbox m-b-20"> <input type="checkbox"
										id="mainCheckbox"> <span class="checkmark"></span>
								</label></th>
								<th style="text-align: center;">번호</th>
								<th style="text-align: center;">이름</th>
								<th style="text-align: center;">작성자</th>
								<th style="text-align: center;">좋아요</th>
								<th style="text-align: center;">싫어요</th>
								<th style="text-align: center;">조회수</th>
							</tr>
						</thead>
						<tbody class="customtable">
							<c:set
								value="${pageMaker.total - (pageMaker.cri.pageNum - 1) * pageMaker.cri.amount}"
								var="bno"></c:set>
							<c:forEach items="${list }" var="no">
								<tr
									style="border-bottom: 1px solid #ddd; text-align: center; justify-content: center;">
									<td><label class="customcheckbox m-b-20"> <input
											type="checkbox" id="mainCheckbox"> <span
											class="checkmark"></span>
									</label></td>

									<td>${bno}</td>
									<td><a
										href="/board/view?sequence=${no.sequence }&userid=${no.userid}&pageNum=${pageMaker.cri.pageNum}">${no.title }</a></td>

									<c:choose>
										<c:when test="${no.userid eq 'althsuwpfl'}">
											<td>관리자</td>
										</c:when>
										<c:otherwise>
											<td>${no.userid }</td>
										</c:otherwise>
									</c:choose>
									<td>${no.recommend }</td>
									<td>${no.disrecommend }</td>
									<td>${no.viewer }</td>

									<c:set value="${bno-1 }" var="bno"></c:set>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<nav aria-label="Page navigation example"
					style="z-index: 11; position: relative; text-align: center;">
					<ul class="pagination justify-content-center"
						style="font-size: 1.5rem;">
						<c:if test="${pageMaker.prev }">
							<li class="page-item"><a href="${pageMaker.startPage - 1 }"
								class="page-link" tabindex="-1"><i class="fa  fa-arrow-left"></i></a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">
							<li class="page-item"><a href="${num }"
								class="${pageMaker.cri.pageNum == num ? 'active':''  } page-link">${num }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="page-item"><a href="${pageMaker.endPage+1}"
								class="page-link"><i class="fa  fa-arrow-right"></i></a></li>
						</c:if>


					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
<form id="actionForm" action="/board/notice" method="get"></form>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(".pagination li  a").on("click", function(e) {
		e.preventDefault();
		var num = $(this).attr("href");
		console.log(num);
		var form = $("#actionForm");
		form.append("<input name='pageNum' value='"+num+"'>");
		form.append("<input name='amount' value='"+6+"'>");

		form.submit();

	})
</script>
<script type="text/javascript">
 function actionToggle(){
	 var action = document.querySelector(".action");
	 action.classList.toggle('active');
 }
</script>

<%@include file="../footer.jsp"%>