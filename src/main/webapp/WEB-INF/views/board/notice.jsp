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
<link href="/resources/notice_css.css" rel="stylesheet">
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
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body text-center">
					<h3 class="card-title m-b-0">お知らせ</h3>
				</div>
				<div class="table-responsive">
					<table class="table">
						<thead class="thead-light" style="text-align: center;">
							<tr>
								<th style="text-align: center; vertical-align: middle;"><label
									class="customcheckbox m-b-20"> <input type="checkbox"
										id="mainCheckbox"> <span class="checkmark"></span>
								</label></th>
								<th style="text-align: center;">番号</th>
								<th style="text-align: center;">タイトル</th>
								<th style="text-align: center;">作成者</th>
								<th style="text-align: center;"><i class="fa fa-thumbs-o-up fa-lg" aria-hidden="true" style="color: green"></i></th>
								<th style="text-align: center;"><i class="fa fa-thumbs-o-down fa-lg" aria-hidden="true" style="color: red"></i></th>
								<th style="text-align: center;"><i class="fa fa-eye fa-lg" aria-hidden="true"></i></th>
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