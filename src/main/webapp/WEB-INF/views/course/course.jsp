<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<style>
.button {
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 28px;
	padding: 20px;
	width: 200px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
	float: right;
	margin-right: 230px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}
</style>
<div class="popular_places_area">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="section_title text-center mb_70">
					<h3>ガイドツアー</h3>
					<p>エクストリームな自転車旅行のためのガイドツアー商品をご案内いたします。</p>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${course}" var="course">
				<div class="col-lg-4 col-md-6">
					<div class="single_place">
						<div class="thumb">
							<img src="/upload/course/${course.photo}" alt=""
								style="width: 350px; height: 250px;"> <a href="#"
								class="prise">${course.price}원</a>
						</div>
						<div class="place_info">
							<a href="/course/courseview?num=${course.num }&userid=${userid }"><h3>${course.title }</h3></a>
							<p>${course.content }</p>
							<div class="rating_days d-flex justify-content-between">
								<span class="d-flex justify-content-center align-items-center">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <a href="#">(${course.preview}
										Review)</a>
								</span>
								<div class="days">
									<i class="fa fa-clock-o"></i> <a href="#">${course.days}
										Days</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
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
			</ul>



		</div>
	</div>
	<sec:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
		<a href="/course/coursewrite?userid=${userid }" class="button"
			style="vertical-align: middle"><span style="color: white;">作成</span></a>
			</sec:authorize>
</div>

<%@include file="../footer.jsp"%>