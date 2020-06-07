<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="/resources/product/product.css">
<link rel="stylesheet" href="/resources/product/pagination.css">

<style>
footer {
	margin-left: 0 !important;
	margin-right: 0 !important;
}
</style>
<body>
	<div class="container">

		<nav class="product-filter">
			<h1>Jackets</h1>

			<div class="sort">
				<div class="collection-sort">
					<label>Sort by:</label> <select name="keyword" id="sort"
						onchange="sorting();">
						<option value="desc" ${pageMaker.cri.keyword =='desc' ? 'selected' : '' }>최신순</option>
						<option value="asc" ${pageMaker.cri.keyword =='asc' ? 'selected' : '' }>오래된 순</option>
						<option value="price" ${pageMaker.cri.keyword =='price' ? 'selected' : '' }>가격순</option>
					</select>
				</div>
			</div>
		</nav>
		<section class="products">
			<c:forEach items="${product }" var="pro">
				<div class="product-card">
					<div class="product-image">
						<img src="/upload/${pro.goodsphoto }">
					</div>
					<div class="product-info">
						<h5>${pro.goods }</h5>
						<h6>${pro.price }원</h6>
					</div>
					<c:choose>
					<c:when test="${pro.status !=0 }">
					<button class="btn btn-info"
							style="background: none; color: black;"
							onclick="javascript:location.href='/product/view?num=${pro.num }&userid=${pro.userid }'">상세보기</button>
					</c:when>
					<c:when test="${pro.status == 0 }">
						<button class="btn btn-info"
							style="background: none; color: black;"
							onclick="alert('재고가 없는 상품은 예약 할 수 없습니다.');">예약불가</button>
					</c:when>
					</c:choose>
				
		
				</div>
			</c:forEach>



		</section>
		<div class="pagination-container wow zoomIn mar-b-1x"
			data-wow-duration="0.5s">
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
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.member.userid" var="id" />
					<button class="btn btn-info"
						style="position: absolute; right: 140px;"
						onclick="javascript:location.href='/product/write?userid=${id}'">글쓰기</button>
				</sec:authorize>
			</ul>



		</div>
	</div>
	<form id="actionForm" action="/product/product" method="get"></form>

	<script type="text/javascript">
		function sorting() {
			let values = $("#sort").val();
			console.log(values);
			location.href = "/product/product?keyword=" + values;
		}
	</script>
		<form id="actionForm" action="/product/product" method="get"></form>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
		$(".pagination li  a").on(
				"click",
				function(e) {
					e.preventDefault();
					var num = $(this).attr("href");
					console.log(num);
					var form = $("#actionForm");
					form.append("<input name='pageNum' value='"+num+"'>");
					form.append("<input name='amount' value='"+8+"'>");

					form.submit();

				})
	</script>
	<script type="text/javascript"></script>
	<%@include file="../footer.jsp"%>