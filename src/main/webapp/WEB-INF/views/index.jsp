<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<style>
.box {
	width: 150px;
	height: 150px;
	border-radius: 70%;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.aa {
	padding-top: 60px;
	padding-bottom: 60px;
}
</style>

	<!-- header-end -->

	<!-- slider_area_start -->
	<div class="slider_area">
		<div class="slider_active owl-carousel">
			<div
				class="single_slider  d-flex align-items-center slider_bg_1 overlay">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-xl-12 col-md-12">
							<div class="slider_text text-center">
								<h3>Jeju Island</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div
				class="single_slider  d-flex align-items-center slider_bg_2 overlay">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-xl-12 col-md-12">
							<div class="slider_text text-center">
								<h3>Jeju Island</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div
				class="single_slider  d-flex align-items-center slider_bg_3 overlay">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-xl-12 col-md-12">
							<div class="slider_text text-center">
								<h3>Jeju Island</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- slider_area_end -->



	<!-- popular_destination_area_start  -->
	<sec:authorize access="isAuthenticated()">
		<div class="popular_destination_area  aa">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<div class="section_title text-center mb_70">
							<h3>自転車レンタル</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<c:forEach items="${plist }" var="pro">
						<div class="col-lg-4 col-md-6">
							<div class="single_destination">
								<div class="thumb">
									<img src="/upload/product/${pro.goodsphoto }" alt=""
										style="height: 250px;">
								</div>
								<div class="content">
									<p class="d-flex align-items-center">
										<span class="col-md-6">${pro.goods }</span><a
											href="/product/view?num=${pro.num }&userid=<sec:authentication property='principal.member.userid'/>">
											${pro.price }ウォン</a>
									</p>

								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</sec:authorize>
	<!-- popular_destination_area_end  -->

	<sec:authorize access="isAuthenticated()">
		<div class="popular_places_area aa">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<div class="section_title text-center mb_70">
							<h3>ガイドツアー</h3>
							<p>エクストリームな自転車旅行のため、ガイドツアー商品をご案内いたします。</p>
						</div>
					</div>
				</div>
				<div class="row">
					<c:forEach var="course" items="${clist }">
						<div class="col-lg-4 col-md-6">
							<div class="single_place">
								<div class="thumb">
									<img src="/upload/course/${course.photo}" alt=""
										style="max-width: 350px; max-height: 230px;"> <a
										href="#" class="prise">${course.price}원</a>
								</div>
								<div class="place_info">
									<a
										href="/course/courseview?num=${course.num }&userid=<sec:authentication property='principal.member.userid'/>"><h3>${course.title }</h3></a>
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

				<div class="row">
					<div class="col-lg-12">
						<div class="more_place_btn text-center">
							<a class="boxed-btn4"
								href="/course/course?userid=<sec:authentication property='principal.member.userid'/>">もっと見る</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</sec:authorize>


	<div class="travel_variation_area aa">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single_travel text-center">
						<div class="icon">
							<i class="fa fa-bicycle" aria-hidden="true"
								style="font-size: xxx-large; color: cornflowerblue;"></i>
						</div>
						<h3></h3>
						<p>私たちは目的地にたどり着いてこそ幸せになることではなく、旅行する過程で幸せを感じます。</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single_travel text-center">
						<div class="icon">
							<i class="fa fa-plane" aria-hidden="true"
								style="font-size: -webkit-xxx-large; color: plum;"></i>
						</div>
						<h3></h3>
						<p>よい旅行は決められた計画がなく、到着が目的ではないはずです。</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single_travel text-center">
						<div class="icon">
							<i class="fa fa-pagelines" aria-hidden="true"
								style="font-size: -webkit-xxx-large; color: yellowgreen;"></i>
						</div>
						<h3></h3>
						<p>疲れた私に休みを上げるのはいかがでしょうか。</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- testimonial_area  -->
	<div class="testimonial_area aa">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="testmonial_active owl-carousel">
						<div class="single_carousel">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<div class="single_testmonial text-center">
										<div class="author_thumb box">
											<img src="upload/member/sung.jpg" class="profile" alt="">
										</div>
										<p>"팀 프로젝트를 하는동안 열심히 노력하였고 이런 경험이 나중에 도움이 될것이라고 생각한다. 그래서
											이 경험을 토대로 더 열심히 하고싶다. 고생하신 팀원들에게 고맙다고 생각합니다. "</p>
										<div class="testmonial_author">
											<h3>- 성기원</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="single_carousel">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<div class="single_testmonial text-center">
										<div class="author_thumb box">
											<img src="upload/member/sin.jpg" class="profile" alt="">
										</div>
										<p>" 윈도우 업데이트로 인해서 2~3주간 진행했던 프로젝트 파일을 날려서 복구를 겨우 했는데, 백업의
											중요성을 알게 되었다."</p>
										<div class="testmonial_author">
											<h3>- 신기연</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="single_carousel">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<div class="single_testmonial text-center">
										<div class="author_thumb box">
											<img src="upload/member/kan.jpg" class="profile" alt="">
										</div>
										<p>"원래 혼자서는 간단한 오류조차 찾지 못했는데 이번 팀프로젝트로 쉬운 오류는 처리 할 수 있게
											되었습니다. 성장한거 같아서 좋았습니다."</p>
										<div class="testmonial_author">
											<h3>- 간예은</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="single_carousel">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<div class="single_testmonial text-center">
										<div class="author_thumb box">
											<img src="upload/member/kim.jpg" class="profile" alt="">
										</div>
										<p>"팀프로젝트를 통해 성장한거 같습니다. 다음에도 이런 기회가 있다면 참여 하고 싶습니다."</p>
										<div class="testmonial_author">
											<h3>- 김준영</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="single_carousel">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<div class="single_testmonial text-center">
										<div class="author_thumb box">
											<img src="upload/member/jang.jpg" class="profile" alt="">
										</div>
										<p>"팀 프로젝트를 하는 동안 겪었던 고생과 땀이 보람된 것이었다는 자부심을 갖고, 같이 열심히 해준
											팀원들에게 감사함을 느끼고 있습니다."</p>
										<div class="testmonial_author">
											<h3>- 주장익</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /testimonial_area  -->


	<div class="recent_trip_area aa">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section_title text-center mb_70">
						<h3>フォトレビュー</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${rlist }" var="re">
					<div class="col-lg-4 col-md-6">
						<a href="/review/photo">
							<div class="single_trip">
								<div class="thumb">
									<img src="/upload/review/${re.photo }" alt=""
										style="max-width: 300px; min-height: 200px; max-height: 200px; overflow: hidden;">
								</div>
								<div class="info"
									style="background-color: rgba(104, 109, 224, .15); border-radius: 5px;width: 290px;">
									<div class="date">
										<span>${re.title }</span>
									</div>

									<h3>${re.content }</h3>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>

		</div>
	</div>
</body>
<%@include file="footer.jsp"%>